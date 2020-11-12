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

        // Alla jägare som inte är gäster
        $users = User::where('role', '!=', 'guest')->where('occupation', '=', 'hunter')->get();

        // bygg upp resultatarrayen
        foreach($users as $user) {
            // dd($user->animals);
            $killreports = $user->killreports_shooter;
            
            foreach($killreports as $killreport) {
                $killreport['area']     = $killreport->area()->area_name;
                $killreport['species']  = $killreport->animal()->species;
                // $animal['season'] = $killreport->season;
                
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