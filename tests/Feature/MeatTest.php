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
}