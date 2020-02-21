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
}
