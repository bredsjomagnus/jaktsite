<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;

use App\Killreport;
use App\User;
use App\Animal;
use App\Area;

class KillreportTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_belongs_to_a_shooter()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport = factory(Killreport::class)->create(['shooter_id' => $user->id]);

        $this->assertInstanceOf(User::class, $killreport->shooter);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_belongs_to_a_reporter()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport = factory(Killreport::class)->create(['reporter_id' => $user->id]);

        $this->assertInstanceOf(User::class, $killreport->reporter);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_can_belong_to_a_different_reporter_and_a_shooter()
    {
        // $this->withoutExceptionHandling();
        $magnus = factory(User::class)->create(['id' => 1]);
        $johan = factory(User::class)->create(['id' => 2]);
        $killreport = factory(Killreport::class)->create(['shooter_id' => $magnus->id, 'reporter_id' => $johan->id]);

        $this->assertEquals(2, $killreport->reporter->id);
        $this->assertEquals(1, $killreport->shooter->id);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_has_an_animal()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $animal = factory(Animal::class)->create([
            'shooter_id'    => $user->id
        ]);
        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $user->id, 
            'reporter_id'   => $user->id, 
            'animal_id'     => $animal->id 
            ]);

        $this->assertInstanceOf(Animal::class, $killreport->animal());
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_has_one_area()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $area = factory(Area::class)->create([
            'area_name'     => 'Småris'
        ]);
        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $user->id, 
            'reporter_id'   => $user->id, 
            'area_id'       => $area->id 
            ]);

        $this->assertInstanceOf(Area::class, $killreport->area());
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_has_a_path()
    {
        $this->withoutExceptionHandling();
        $killreport = factory(Killreport::class)->create();

        $this->assertEquals($killreport->path(), "killreports/1");
    }
}
