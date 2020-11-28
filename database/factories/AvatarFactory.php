<?php

use App\Avatar;
use Faker\Generator as Faker;

use App\User;

$factory->define(Avatar::class, function (Faker $faker) {
    return [
        'user_id'           => function() { return factory(User::class)->create()->id; },
        'name'              => $faker->word,
        'path'              => 'images/avatars',
        'created_at'        => now()
    ];
});
