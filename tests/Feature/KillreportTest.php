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


        $this->get('/killreports/create')->assertRedirect('login');
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

        $this->post('/killreports/store', $killreport->toArray());
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

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_edit_a_killreport()
    {
        $this->withoutExceptionHandling();
        
        $this->signIn();

        $killreport = factory(Killreport::class)->create(['killdate' => '1802-02-15']);
        // dd($killreport->id);
        $this->get('/killreports/'.$killreport->id.'/edit', $killreport->toArray())->assertSee('1802-02-15');

    }

    /**
     * @test
     *
     * @return void
     */
    public function a_guest_cannot_visit_killreport_indexpage()
    {
        $this->withoutExceptionHandling();
  
        $this->get('/killreports')->assertRedirect('/login');

    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_show_a_killreport()
    {
        $this->withoutExceptionHandling();
        
        $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $this->get('/killreports/'.$killreport->id)->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_guest_cannot_show_a_killreport()
    {
        $this->withoutExceptionHandling();
        
        // $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $this->get('/killreports/'.$killreport->id)->assertRedirect('/login');
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_can_update_a_killreport()
    {
        $this->withoutExceptionHandling();
        
        $this->signIn();

        $report = $this->report_kill();

        $killreport = $report['killreport'];

        $animal_id = $killreport->animal_id;
        $animal = Animal::find($animal_id);

        $killreportupdate = [
            'shooter_id'    => 5,
            'area_id'       => 3
        ];
        // $killreport->shooter_id = 5;
        // $killreport->area_id = 3;
        // $killreport->save();

        $animalupdate = [
            'live_weight'   => 90000000
        ];
        // $animal->live_weight = 900000000;
        // $animal->save();
        

        $this->post('/killreports/'.$killreport->id.'/update', $killreportupdate);
        $this->assertDatabaseHas('killreports', $killreportupdate);

        $this->post('/animals/'.$animal->id.'/update', $animalupdate);
        $this->assertDatabaseHas('animals', $animalupdate);


    }





}
