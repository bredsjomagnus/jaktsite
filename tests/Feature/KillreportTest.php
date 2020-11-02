<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\User;
use App\Area;
use App\Animal;
use App\Meat;
use App\Image;
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

    /**
     * @test
     * 
     * @return void
     */
    public function only_admins_see_delete_btn_in_killreport_index_view() 
    {

        // admin skall se 'ta bort'-knappen
        $admin = factory(User::class)->create([
            'role'  => 'admin'
        ]);

        $this->signIn($admin);

        $killreport = factory(Killreport::class)->create();

        $this->get('/killreports')->assertSee('btn-danger'); // 'ta bort'-knappen



        // user skall inte se 'ta bort'-knappen
        $user = factory(User::class)->create([
            'role'  => 'user'
        ]);

        $this->signIn($user);

        $this->get('/killreports')->assertDontSee('btn-danger'); // 'ta bort'-knappen
    }

    /**
     * @test
     * 
     * @return void
     */
    public function only_admins_can_delete_a_killreport()
    {
        $this->withoutExceptionHandling();
        // admin skall kunna ta bort killreport
        $admin = factory(User::class)->create([
            'role'  => 'admin'
        ]);

        $this->signIn($admin);

        $killreport = factory(Killreport::class)->create();

        $this->assertDatabaseHas('killreports', ['id'   => $killreport->id]);

        $this->delete('/killreports/'.$killreport->id.'/delete');

        $this->assertDatabaseMissing('killreports', ['id'   => $killreport->id]);

        // user skall inte kunna ta bort killreport
        $user = factory(User::class)->create([
            'role'  => 'user'
        ]);

        $this->signIn($user);

         $killreport = factory(Killreport::class)->create();

        $this->assertDatabaseHas('killreports', ['id'   => $killreport->id]);

        $this->delete('/killreports/'.$killreport->id.'/delete')->assertRedirect('login');
    }

    /**
     * @test
     * 
     * @return void
     */
    public function when_a_killreport_is_deleted_so_is_its_animal_meat_images()
    {
        // admin skall kunna ta bort killreport
        $admin = factory(User::class)->create([
            'role'  => 'admin'
        ]);

        $this->signIn($admin);

        $animal = factory(Animal::class)->create();

        $killreport = factory(Killreport::class)->create([
            'animal_id'     => $animal->id
        ]);

        $meat_1 = factory(Meat::class)->create([
            'killreport_id' => $killreport->id
        ]);
        $meat_2 = factory(Meat::class)->create([
            'killreport_id' => $killreport->id
        ]);

        $image_1 = factory(Image::class)->create([
            'killreport_id' => $killreport->id
        ]);
        $image_2 = factory(Image::class)->create([
            'killreport_id' => $killreport->id
        ]);


        $this->assertDatabaseHas('animals', ['id'   => $animal->id]);
        $this->assertDatabaseHas('killreports', ['id'   => $killreport->id]);
        $this->assertDatabaseHas('meats', ['id'   => $meat_1->id]);
        $this->assertDatabaseHas('meats', ['id'   => $meat_2->id]);
        $this->assertDatabaseHas('images', ['id'   => $image_1->id]);
        $this->assertDatabaseHas('images', ['id'   => $image_2->id]);

        $this->delete('/killreports/'.$killreport->id.'/delete');


        $this->assertDatabaseMissing('animals', ['id'   => $animal->id]);
        $this->assertDatabaseMissing('killreports', ['id'   => $killreport->id]);
        $this->assertDatabaseMissing('meats', ['id'   => $meat_1->id]);
        $this->assertDatabaseMissing('meats', ['id'   => $meat_2->id]);
        $this->assertDatabaseMissing('images', ['id'   => $image_1->id]);
        $this->assertDatabaseMissing('images', ['id'   => $image_2->id]);
        
    }

}
