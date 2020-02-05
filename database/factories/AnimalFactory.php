<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Animal;
use App\User;
use App\Killreport;
use Faker\Generator as Faker;

$factory->define(Animal::class, function (Faker $faker) {
    return [
        'shooter_id'            =>  function() { return factory(User::class)->create()->id; },
        'species'               =>  function() {
                                        $species = ['Dovvilt', 'Älg', 'Kronvilt','Rådjur', 'Vildsvin'];
                                        return $species[array_rand($species)];
                                    },
        'speciestype'           =>  function() {
                                        $species_type = ['Hjort', 'Hind', 'Hjortkalv','Hindkalv', 'Bock', 'Galt', 'Smalhind', 'Smaldjur', 'Gylta'];
                                        return $species_type[array_rand($species_type)];
                                    },
        'engspecies'            =>  $faker->word,
        'sex'                   =>  $faker->word,
        'age'                   =>  $faker->word,
        'live_weight'           =>  10,
        'aprox_live_weight'     =>  $faker->randomFloat,
        'passad_weight'         =>  $faker->randomFloat,
        'aprox_passad_weight'   =>  $faker->randomFloat,
        'carcass_weight'        =>  $faker->randomFloat,
        'aprox_carcass_weight'  =>  $faker->randomFloat,
        'aprox_carcass_weight'  =>  $faker->randomFloat,
        'cut_weight'            =>  $faker->randomFloat,
        'heart_weight'          =>  $faker->randomFloat,
        'waste'                 =>  $faker->randomFloat,
        'waste_notes'           =>  $faker->sentence,
        'antlers'               =>  $faker->word,
        'points'                =>  $faker->randomDigit,
        'created_at'            =>  now()
    ];
});
