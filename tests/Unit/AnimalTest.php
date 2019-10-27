<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Animal;
use App\User;
use App\Killreport;

class AnimalTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function animals_belongs_to_a_user()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $animal = factory(Animal::class)->create([
            'shooter_id'    => $user->id
        ]);

        $this->assertInstanceOf(User::class, $animal->shooter);

    }

    /**
     * @test
     *
     * @return void
     */
    public function animals_is_set_to_a_report()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $animal = factory(Animal::class)->create([
            'shooter_id'    => $user->id
        ]);
        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $user->id,
            'reporter_id'   => $user->id,
            'animal_id'     => $animal->id,
        ]);

        $this->assertInstanceOf(Killreport::class, $animal->killreport());

    }
}
