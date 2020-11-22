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
    public function a_user_can_update_an_unlocked_killreport()
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

    // /**
    //  * @test
    //  * 
    //  * @return void
    //  */
    // public function only_admins_see_delete_btn_in_killreport_index_view() 
    // {

    //     // admin skall se 'ta bort'-knappen
    //     $admin = factory(User::class)->create([
    //         'role'  => 'admin'
    //     ]);

    //     $this->signIn($admin);

    //     $killreport = factory(Killreport::class)->create();

    //     $this->get('/killreports')->assertSee('btn-danger'); // 'ta bort'-knappen



    //     // user skall inte se 'ta bort'-knappen
    //     $user = factory(User::class)->create([
    //         'role'  => 'user'
    //     ]);

    //     $this->signIn($user);

    //     $this->get('/killreports')->assertDontSee('btn-danger'); // 'ta bort'-knappen
    // }

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

        $this->post('/killreports/'.$killreport->id.'/delete');

        $this->assertDatabaseMissing('killreports', ['id'   => $killreport->id]);

        // user skall inte kunna ta bort killreport
        $user = factory(User::class)->create([
            'role'  => 'user'
        ]);

        $this->signIn($user);

        $killreport = factory(Killreport::class)->create();

        $this->assertDatabaseHas('killreports', ['id'   => $killreport->id]);

        $this->post('/killreports/'.$killreport->id.'/delete')->assertRedirect('login');
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

        $this->post('/killreports/'.$killreport->id.'/delete');


        $this->assertDatabaseMissing('animals', ['id'   => $animal->id]);
        $this->assertDatabaseMissing('killreports', ['id'   => $killreport->id]);
        $this->assertDatabaseMissing('meats', ['id'   => $meat_1->id]);
        $this->assertDatabaseMissing('meats', ['id'   => $meat_2->id]);
        $this->assertDatabaseMissing('images', ['id'   => $image_1->id]);
        $this->assertDatabaseMissing('images', ['id'   => $image_2->id]);
        
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_report_with_no_animal_specistype_has_yellow_status()
    {
        // Djuret
        $animal = factory(Animal::Class)->create([
            'speciestype'   => 'unknown'
        ]);

        // Området annat än Småris
        $area = factory(Area::Class)->create([
            'area_name'     => 'Haddebo'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);
        
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_report_with_no_set_shooter_has_yellow_status()
    {
        // okänd jägare
       $anonhunter = factory(User::Class)->create([
           'occupation'     => 'anonhunter'
       ]);

       // Området annat än Småris
        $area = factory(Area::Class)->create([
            'area_name'     => 'Haddebo'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'        => $anonhunter->id,
            'area_id'           => $area->id,
            'report_status'     => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);
        
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_report_with_no_carcass_weight_and_no_aprox_carcass_weight_has_yellow_status()
    {
        // Djuret
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null
        ]);

        // Området annat än Småris
        $haddebo = factory(Area::Class)->create([
            'area_name'     => 'Haddebo'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'animal_id'     => $animal->id,
            'area_id'       => $haddebo->id,
            'report_status' => 'green'
        ]);

        // dd($killreport);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);
        
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_report_with_either_carcass_weight_or_aprox_carcass_weight_has_green_status()
    {
        // Djuret med slaktvikt men inte uppskattad slaktvikt
        $animal_carcass = factory(Animal::Class)->create([
            'carcass_weight'        => 30,
            'aprox_carcass_weight'  => null
        ]);

        // Området annat än Småris
        $haddebo = factory(Area::Class)->create([
            'area_name'     => 'Haddebo'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'animal_id'     => $animal_carcass->id,
            'area_id'       => $haddebo->id,
            'report_status' => 'green'
        ]);

        // dd($killreport);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('green', $killreport->report_status);



        // Djuret med slaktvikt men inte uppskattad slaktvikt
        $animal_aprox_carcass = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => 30
        ]);

        // Området annat än Småris
        $glotterback = factory(Area::Class)->create([
            'area_name'     => 'Glotterbäck'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'animal_id'     => $animal_aprox_carcass->id,
            'area_id'       => $glotterback->id,
            'report_status' => 'green'
        ]);

        // dd($killreport);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('green', $killreport->report_status);
        


        // Djuret både slaktvikt och uppskattad slaktvikt
        $animal_both = factory(Animal::Class)->create([
            'carcass_weight'        => 30,
            'aprox_carcass_weight'  => 30
        ]);

        // Området Småris
        $smaris = factory(Area::Class)->create([
            'area_name'     => 'Småris'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'animal_id'     => $animal_both->id,
            'area_id'       => $smaris->id,
            'report_status' => 'green'
        ]);

        // dd($killreport);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('green', $killreport->report_status);
        
    }


     /**
     * @test
     * 
     * @return void
     */
    public function a_report_from_smaris_with_no_meet_allocated_has_yellow_status()
    {
        //Skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Djuret
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 32,
            'aprox_carcass_weight'  => null
        ]);

        

        // Området Småris
        $area = factory(Area::Class)->create([
            'area_name'     => 'Småris'
        ]);

        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);

        // dd($killreport);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);
        
    }

    /**
     * @test
     * 
     * @return void
     */
    public function smaris_full_status_test()
    {
        // Området Småris
        $area = factory(Area::Class)->create([
            'area_name'     => 'Småris'
        ]);

        // 1. INGEN SKYTT, INGEN DJURKLASS, INGEN VIKT, INGEN ALLOKERING
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 2. INGEN SKYTT, INGEN DJURKLASS, VIKTER, INGEN ALLOKERING
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 32,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);


        // 3. INGEN SKYTT, INGEN DJURKLASS, VIKTER, ALLOKERAT KÖTT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 32,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => 2,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 4. INGEN SKYTT, SATT DJURKLASS, INGA VIKTER, INGET KÖTT ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 5. INGEN SKYTT, SATT DJURKLASS, SATT VIKT, INGET KÖTT ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 21,
            'aprox_carcass_weight'  => 20,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 6. INGEN SKYTT, SATT DJURKLASS, SATT VIKT, KÖTT ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 21,
            'aprox_carcass_weight'  => 20,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => 2,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 7. SATT SKYTT, INGEN DJURKLASS, INGEN VIKT, KÖTT INTE ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 8. SATT SKYTT, INGEN DJURKLASS, SATT VIKT, KÖTT INTE ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => 14,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 9. SATT SKYTT, INGEN DJURKLASS, SATT VIKT, KÖTT ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => 14,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => 2,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 10. SATT SKYTT, SATT DJURKLASS, INGEN VIKT, KÖTT INTE ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 11. SATT SKYTT, SATT DJURKLASS, SATT VIKT, KÖTT INTE ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 32,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => null,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);


        // 11. SATT SKYTT, SATT DJURKLASS, SATT VIKT, KÖTT ALLOKERAT
        // Ingen skytt
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 32,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);

        // köttet inte allokerat
        $meat = factory(Meat::Class)->create([
            'user_id'       => 2,
            'killreport_id' => $killreport->id
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('green', $killreport->report_status);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function other_area_than_smaris_full_status_test()
    {
        // Området annat än Småris
        $area = factory(Area::Class)->create([
            'area_name'     => 'Glotterbäck'
        ]);

        // 1. INGEN SKYTT, INGEN DJURKLASS, INGEN VIKT
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 2. INGEN SKYTT, INGEN DJURKLASS, SATT VIKTER
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 32,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);


        // 3. INGEN SKYTT, SATT DJURKLASS, INGA VIKTER
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 4. INGEN SKYTT, SATT DJURKLASS, SATT VIKTER
        $user = factory(User::Class)->create([
            'occupation'    => 'anonhunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 24,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);



        // 5. SATT SKYTT, INGEN DJURKLASS, INGEN VIKT
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 6. SATT SKYTT, INGEN DJURKLASS, SATT VIKT
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => 21,
            'aprox_carcass_weight'  => 20,
            'speciestype'           => 'unknown'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 7. SATT SKYTT, SATT DJURKLASS, INGEN VIKT
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => null,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('yellow', $killreport->report_status);




        // 8. SATT SKYTT, SATT DJURKLASS, SATT VIKT
        $user = factory(User::Class)->create([
            'occupation'    => 'hunter'
        ]);


        // Ingen speciestype eller vikt
        $animal = factory(Animal::Class)->create([
            'carcass_weight'        => null,
            'aprox_carcass_weight'  => 14,
            'speciestype'           => 'Hjort'
        ]);

        
        // Rapport
        $killreport = factory(Killreport::Class)->create([
            'shooter_id'    => $user->id,
            'animal_id'     => $animal->id,
            'area_id'       => $area->id,
            'report_status' => 'green'
        ]);
        
        // Sätter färgen för rapporten
        $killreport->set_status();

        // Antagande
        $this->assertEquals('green', $killreport->report_status);

    }

}
