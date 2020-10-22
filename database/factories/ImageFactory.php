<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Image;
use Faker\Generator as Faker;

use App\Killreport;
use App\User;

$factory->define(Image::class, function (Faker $faker) {
    return [
        'killreport_id'     => function() { return factory(Killreport::class)->create()->id; },
        'user_id'           => function() { return factory(User::class)->create()->id; },
        'name'              => $faker->word,
        'path'              => $faker->word,
        'created_at'        => now()
    ];
});
