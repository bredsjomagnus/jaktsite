<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

use App\User;
use App\Animal;
use App\Area;
use App\Killreport;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

    protected function signIn($user = null){
        // $this->withoutExceptionHandling();
        $user = $user ?: factory(User::class)->create();
        $this->actingAs($user);
        return $user;
    }

    protected function report_kill($shooter = null, $reporter = null, $animal = null, $area = null, $locked = 'no')
    {
        $reporter = $reporter ?: factory(User::class)->create();
        $shooter = $shooter ?: factory(User::class)->create();
        $animal = $animal ?: factory(Animal::class)->create(['shooter_id'   => $shooter->id]);
        $area = $area ?: factory(Area::class)->create();

        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $shooter->id,
            'reporter_id'   => $reporter->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'locked'        => $locked
        ]);

        $data = [
            'reporter'      => $reporter,
            'shooter'       => $shooter,
            'animal'        => $animal,
            'area'          => $area,
            'killreport'    => $killreport
        ];

        return $data;
        

    }
}
