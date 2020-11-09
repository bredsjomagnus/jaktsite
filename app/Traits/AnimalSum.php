<?php

namespace App\Traits;

use App\Animal;

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
}  