<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Area;
use Faker\Generator as Faker;

$factory->define(Area::class, function (Faker $faker) {
    return [
        'area_name'     => $faker->word,
        'notes'         => $faker->sentence,
        'created_at'    => now()
    ];
});
