<?php

namespace App\Traits;

use App\Animal;
use App\User;
use App\Killreport;
use App\Area;

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
        $animals = Animal::where('species', '=', $species)->where('deleted_at', null)->get();

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

        // JÄGARNA
        // Alla jägare som inte är gäster
        $users = User::where('role', '!=', 'guest')->where('occupation', '=', 'hunter')->get();

         // bygg upp resultatarrayen för användare som är jägare
        foreach($users as $user) {
            $killreports = $user->killreports_shooter;
            
            // Lägger till key => values (area och species) för användarnas killreports
            foreach($killreports as $killreport) {
                $killreport['area']     = $killreport->area()->area_name;
                $killreport['species']  = $killreport->animal()->species;
            }

            $data[$index] = [
                'id'            => $user->id,
                'role'          => $user->role,
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


    /**
     *  Get how many animals each hunter has shot
     * 
     * @return Array $data; [0: [id, username, firstname, username, name, animals_shot], 1: [...]
     */
    public function getNumberOfAnimalsShotByGuests()
    {
        // resultatsarray
        $data = [];

        $index = 0;

        // GÄSTERNA
        // Längst bak i $data läggs gästerna till som en samlad grupp
        $guests = User::where('role', '=', 'guest')->where('occupation', '=', 'hunter')->get();

        // bygger upp resultatarrayen för gästernas killreports
        foreach($guests as $guest) {
            $guest_killreports = $guest->killreports_shooter; // Gästesn registrerade killreports
            
            //
            foreach($guest_killreports as $guest_killreport) {
                $guest_killreport['area']     = $guest_killreport->area()->area_name;
                $guest_killreport['species']  = $guest_killreport->animal()->species;
            }
            $data[$index] = [
                'id'                    => $guest->id,
                'role'                  => $guest->role,
                'username'              => $guest->username,
                'firstname'             => $guest->firstname,
                'lastname'              => $guest->lastname,
                'name'                  => $guest->firstname ." ". $guest->lastname,
                'guest_killreports'     => $guest_killreports
            ];
            $index += 1;
        }

        // dd($data);

            
        return $data;
    }

    /**
     * Get the distribution per species
     * 
     * @param String $specie, ex 'Dovvilt'
     * 
     * @return Array ['Småris' => Array ['adult_male' => 2, 'calf_female' => 4], 'Haddebo' => Array[...]]
     */
    public function getDistribution($specie)
    {
        // Ta fram djuren med djurslag $species ur databasen
        $animals = Animal::where('species', '=', $specie)->where('deleted_at', null)->get();

        // array som skall byggas upp och returneras
        $res = [];

        // Förbereder resultat arrayen med de områden som finns
        $areas = Area::all();
        foreach($areas as $area) {
            $res[$area->area_name] = [];
        }

        // Gå igenom dem och sortera in dem i listan
        foreach($animals as $animal) {

            // Området för djuret
            $animal_area = $animal->killreport()->area()->area_name;  

            // Existerar djuret klassificering för detta område sedan förut så lägg till på den
            if(array_key_exists($animal->age.'_'.$animal->sex, $res[$animal_area])) { 
                $res[$animal_area][$animal->age.'_'.$animal->sex] = $res[$animal_area][$animal->age.'_'.$animal->sex] + 1;

            // Annars lägg in första räkningen för området och djurklassificeringen
            } else {
                $res[$animal_area][$animal->age.'_'.$animal->sex] = 1;
            }
        }
        // dd($res);
        return $res;
    }
}  