<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AvatarTest extends TestCase
{

    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_get_to_avatar_edit_view()
    {
        $this->withoutExceptionHandling();
        $user = $this->signIn();

        $this->get("avatar/".$user->id."/edit", [])->assertOk();
    }
}
