<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\User;
use App\Area;
use App\Animal;
use App\Killreport;

class KillreportTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function users_can_begin_killreport_process()
    {
        $this->withoutExceptionHandling();
        $user = $this->signIn();

        $this->get('/killreports/create')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function admins_can_begin_killreport_process()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create(['role' => 'admin']);
        $this->signIn($user);

        $this->get('/killreports/create')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function guests_cannot_begin_killreport_process()
    {
        $this->withoutExceptionHandling();


        $this->get('/killreports/create')->assertRedirect('home');
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_store_a_killreport()
    {
        $this->withoutExceptionHandling();
        $reporter = factory(User::class)->create();
        $this->signIn($reporter);

        $shooter = factory(User::class)->create();
        $area = factory(Area::class)->create();

        $animal = factory(Animal::class)->make(['shooter_id'   => $shooter->id, 'antlers' => null, 'points' => null]);

        $this->post('/animals/store', $animal->toArray())->assertOk();
        $this->assertDatabaseHas('animals', $animal->getAttributes());

        $killreport = factory(Killreport::class)->make([
            'shooter_id'    => $shooter->id,
            'reporter_id'   => $reporter->id,
            'animal_id'     => 1,
            'area_id'       => $area->id
        ]);

        $this->post('/killreports/store', $killreport->toArray())->assertRedirect('/killreports');
        $this->assertDatabaseHas('killreports', $killreport->getAttributes());

    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_sees_all_killreports_when_visiting_killreport_index_page()
    {
        $this->withoutExceptionHandling();
        
        $this->signIn();

        $killreport_one = factory(Killreport::class)->create(['killdate' => '2015-01-01']);
        $killreport_two = factory(Killreport::class)->create(['killdate' => '2016-01-01']);
        $killreport_three = factory(Killreport::class)->create(['killdate' => '2017-01-01']);
        $killreport_four = factory(Killreport::class)->create(['killdate' => '2018-01-01']);


        $this->get('/killreports')->assertSee('2015-01-01');
        $this->get('/killreports')->assertSee('2016-01-01');
        $this->get('/killreports')->assertSee('2017-01-01');
        $this->get('/killreports')->assertSee('2018-01-01');

    }


}
