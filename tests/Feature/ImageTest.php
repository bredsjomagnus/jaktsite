<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Image;
use App\User;
use App\Killreport;

class ImageTest extends TestCase
{
    use RefreshDatabase;
    
    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_add_an_image_to_a_killreport()
    {
        $user = $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $this->get('/image/'.$killreport->id.'/edit')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_guest_cannot_add_an_image_to_a_killreport()
    {
        $killreport = factory(Killreport::class)->create();

        $this->get('/image/'.$killreport->id.'/edit')->assertRedirect('/login');
    }
}
