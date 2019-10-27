<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Killreport;
use App\User;
use App\Animal;
use Faker\Generator as Faker;

$factory->define(Killreport::class, function (Faker $faker) {
    return [
        'reporter_id'   =>  function() { return factory(User::class)->create()->id; },
        'shooter_id'    =>  function() { return factory(User::class)->create()->id; },
        'kindofhunt'    =>  function() { 
                                $kindofhunt = ['Gemensam jakt', 'Ensamjakt']; 
                                return $kindofhunt[array_rand($kindofhunt)]; 
                            },
        'animal_id'     =>  function() { return factory(Animal::class)->create()->id; },
        'image'         =>  $faker->word,
        'killdate'      =>  now(),
        'season'        =>  '19/20',
        'area_id'       =>  $faker->randomDigitNotNull, // TODO: function() { return factory(Area::class)->create()->id; }
        'place'         =>  $faker->sentence,
        'longitud'      =>  $faker->randomFloat,
        'latitud'       =>  $faker->randomFloat,
        'report_status' =>  function() {
                                $report_status = ['red', 'yellow', 'green'];
                                return $report_status[array_rand($report_status)];
                            },
        'locked'        =>  function() {
                                $locked = ['yes', 'no'];
                                return $locked[array_rand($locked)];
                            },
        'created_at'    =>  now()
    ];
});