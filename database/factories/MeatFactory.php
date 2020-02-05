<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Meat;
use App\Killreport;
use App\User;
use Faker\Generator as Faker;

$factory->define(Meat::class, function (Faker $faker) {
    return [
        'killreport_id'     => function() { return factory(Killreport::class)->create()->id; },
        'user_id'           => function() { return factory(User::class)->create()->id; },
        'share_kilogram'    => $faker->randomFloat,
        'share_lot'         => null,
        'notes'             => $faker->sentence,
        'created_at'        => now()
    ];
});
