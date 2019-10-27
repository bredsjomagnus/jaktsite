<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Area;
use App\User;
use App\Killreport;
use App\Animal;

class AreaTest extends TestCase
{
    use RefreshDatabase;
    /**
     * @test
     *
     * @return void
     */
    public function an_area_can_retrieve_assocciated_killreports()
    {
        $this->withoutExceptionHandling();
        $area = factory(Area::class)->create([
            'area_name'     => 'Småris'
        ]);

        $user = factory(User::class)->create();
        $animal = factory(Animal::class)->create([
            'shooter_id'    => $user->id
        ]);
        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $user->id,
            'reporter_id'   => $user->id,
            'area_id'       => $area->id,
            'animal_id'     => $animal->id
        ]);

        // dd($area->killreports());

        $this->assertCount(1, $area->killreports());
    }
}
