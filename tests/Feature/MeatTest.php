<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Meat;
use App\Killreport;
use App\User;
use App\Animal;

class MeatTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_get_to_edit_meat()
    {
        $this->withoutExceptionHandling();
        $this->signIn();

        $meat = factory(Meat::class)->create();

        

        $this->get('/meat/'.$meat->killreport_id.'/edit')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_edit_a_not_yet_existing_meat()
    {
        $this->withoutExceptionHandling();
        $this->signIn();

        $meat = factory(Meat::class)->create();

        $this->get('/meat/1/edit')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_store_a_meat_row_in_db()
    {
        // $this->withoutExceptionHandling();
        $this->signIn();

        $meat_attributes = [
            'user_id'   => 1,
            'killreport_id' => 1,
            'share_kilogram' => 10,
        ];

        $this->post('/meat/store', [$meat_attributes])->assertOk();
        $this->assertDatabaseHas('meats', ['user_id' => $meat_attributes['user_id']]);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_store_a_meat_row_in_db_with_null_kilos()
    {
        // $this->withoutExceptionHandling();
        $this->signIn();

        $meat_attributes = [
            'user_id'   => 1,
            'killreport_id' => 1,
            'share_kilogram' => null
        ];

        $this->post('/meat/store', [$meat_attributes])->assertOk();
        $this->assertDatabaseHas('meats', ['share_kilogram' => $meat_attributes['share_kilogram']]);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_store_multiple_rows_in_meats()
    {
        // $this->withoutExceptionHandling();
        $this->signIn();

        $meat_attributes_1 = [
            'user_id'   => 1,
            'killreport_id' => 1,
            'share_kilogram' => 10
        ];

        $meat_attributes_2 = [
            'user_id'   => 2,
            'killreport_id' => 1,
            'share_kilogram' => 10
        ];

        $meat_attributes_3 = [
            'user_id'   => 3,
            'killreport_id' => 1,
            'share_kilogram' => 10
        ];

        $this->post('/meat/store', [$meat_attributes_1, $meat_attributes_2, $meat_attributes_3])->assertOk();
        $this->assertDatabaseHas('meats', ['user_id' => $meat_attributes_1['user_id']]);
        $this->assertDatabaseHas('meats', ['user_id' => $meat_attributes_2['user_id']]);
        $this->assertDatabaseHas('meats', ['user_id' => $meat_attributes_3['user_id']]);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_user_can_update_a_meat()
    {
        // $this->withoutExceptionHandling();
        $this->signIn();

        // Skapar en meat
        $meat = factory(Meat::class)->create();
        
        // Kontrollerar att den ligger i databasen
        $this->assertDatabaseHas('meats', ['share_kilogram' => $meat['share_kilogram']]);

        // Ändrar share_kilogram
        $meat['share_kilogram'] = $meat['share_kilogram'] + 1;

        
        // Uppdaterar och kontrollerar att uppdateringen återspeglas i databasen.
        $this->patch('/meat/'.$meat->id.'/update', ['share_kilogram' => $meat['share_kilogram']]);
        $this->assertDatabaseHas('meats', ['share_kilogram' => $meat['share_kilogram']]);

    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_user_can_delete_a_meat()
    {
        // loggar in
        $this->signIn();

        // skapar en meat och sparar den i databasen
        $meat = factory(Meat::class)->create();

        // kontrollear att den ligger i databasen
        $this->assertDatabaseHas('meats', ['id' => $meat['id']]);

        $this->delete('/meat/'.$meat->id.'/delete', ['id' => $meat['id']]);

        $this->assertDatabaseMissing('meats', ['id' => $meat['id']]);

    }

    // ANVÄND FÖR ATT TESTA UTRÄKNINGEN AV KÖTTABELLERNA
    /**
     * @test
     * 
     * @return void
     */
    // public function calculating_the_users_meat_mean()
    // {

    //     $species = 'Dovvilt';
    //     $species_eng = 'fallowdeer';

    //     $user_attributes = [
    //         'username'      => 'adminmagnus',
    //         'firstname'     => 'Magnus',
    //         'lastname'      => 'Andersson',
    //         'created_at'    => '2011-01-01',
    //         'member_since'  => '2011-01-01'
    //     ];

    //     $user = factory(User::class)->create($user_attributes);


    //     # LÄGGER IN FÖRSTA DOVHJORTEN
    //     $animal_1 = factory(Animal::class)->create([
    //         'species'       => $species,
    //         'engspecies'    => $species_eng
    //     ]);

    //     $killreport_1 = factory(Killreport::class)->create([
    //         'animal_id'     => $animal_1->id
    //     ]);
        
    //     $meat_1 = factory(Meat::class)->create([
    //         'user_id'           => $user->id,
    //         'killreport_id'     => $killreport_1->id,
    //         'share_kilogram'    => 1000,
    //         'created_at'        => '2001-01-01'
    //     ]);


    //     # LÄGGER IN ANDRA DOVHJORTEN
    //     $animal_2 = factory(Animal::class)->create([
    //         'species'       => $species,
    //         'engspecies'    => $species_eng
    //     ]);

    //     $killreport_2 = factory(Killreport::class)->create([
    //         'animal_id'     => $animal_2->id
    //     ]);

    //     $meat_2 = factory(Meat::class)->create([
    //         'user_id'           => $user->id,
    //         'killreport_id'     => $killreport_2->id,
    //         'share_kilogram'    => 1000,
    //         'created_at'        => '2015-01-01'
    //     ]);


    //     # LÄGGER IN TREDJE DOVHJORTEN
    //     $animal_3 = factory(Animal::class)->create([
    //         'species'       => $species,
    //         'engspecies'    => $species_eng
    //     ]);

    //     $killreport_3 = factory(Killreport::class)->create([
    //         'animal_id'     => $animal_3->id
    //     ]);

    //     $meat_3 = factory(Meat::class)->create([
    //         'user_id'           => $user->id,
    //         'killreport_id'     => $killreport_3->id,
    //         'share_kilogram'    => 10,
    //         'created_at'        => '2021-01-02'
    //     ]);

    //     // dd($meat_3);

    //     $year_back = 2;
    //     $user_fallowdeer_average = $this->sumMeatWrapper('Dovvilt', 'average', $year_back);

        // dd($user_fallowdeer_average[0]['kg']);

        // $this->assertEquals(, $user_fallowdeer_average[0]['kg']->kg);
    // }

}
