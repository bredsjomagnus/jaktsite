<?php

namespace App\Traits;

use App\Animal;
use App\User;
use App\Killreport;

trait AnimalSum
{
    /**
     * Get all animals of a certain species
     * 
     * @param String $species; ex 'Kronvilt'
     * 
     * @return Collection Animals with added keys area and season
     */
    public function getAnimalsOfSpecies($species)
    {
        // Tar fram djuren för ett viss djurslag.
        $animals = Animal::where('species', '=', $species)->get();

        // Lägger till keys area och season för djuren.
        foreach($animals as $animal) {
            $animal['area'] = $animal->killreport()->area()->area_name;
            $animal['season'] = $animal->killreport()->season;
        }

        return $animals;
    }

    /**
     *  Get how many animals each hunter has shot
     * 
     * @return Array $data; [0: [id, username, firstname, username, name, animals_shot], 1: [...]
     */
    public function getNumberOfAnimalsShot()
    {
        // resultatsarray
        $data = [];

        $index = 0;

        // Alla jägare som inte är gäster
        $users = User::where('role', '!=', 'guest')->where('occupation', '=', 'hunter')->get();

        // bygg upp resultatarrayen
        foreach($users as $user) {
            // dd($user->animals);
            $killreports = $user->killreports_shooter;
            
            foreach($killreports as $killreport) {
                $killreport['area'] = $killreport->area()->area_name;
                $animal['season'] = $killreport->season;
            }

            

            $data[$index] = [
                'id'            => $user->id,
                'username'      => $user->username,
                'firstname'     => $user->firstname,
                'lastname'      => $user->lastname,
                'name'          => $user->firstname ." ". $user->lastname,
                'killreports'   => $killreports
            ];
            $index += 1;

            
        }

        

        return $data;

    }
}  