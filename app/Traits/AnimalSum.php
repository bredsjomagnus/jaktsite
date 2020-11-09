<?php

namespace App\Traits;

use App\Animal;
use App\User;

trait AnimalSum
{
    /**
     * Get all animals of a certain species
     * 
     * @param String $species; ex 'Kronvilt'
     * 
     * @return Collection Animals
     */
    public function getAnimalsOfSpecies($species)
    {
        return Animal::where('species', '=', $species)->get();
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
            $data[$index] = [
                'id'            => $user->id,
                'usermane'      => $user->username,
                'firstname'     => $user->firstname,
                'lastname'      => $user->lastname,
                'name'          => $user->firstname ." ". $user->lastname,
                'animals'       => $user->killreports_shooter
            ];
            $index += 1;

            
        }

        

        return $data;

    }
}  