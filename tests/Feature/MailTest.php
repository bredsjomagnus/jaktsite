<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class MailTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function meat_changed()
    {
        $this->withoutExceptionHandling();
        $user = $this->signIn();

        $this->post('mail/meat')->assertOk();
    }
}
