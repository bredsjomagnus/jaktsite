<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\User;

class AdminTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function an_admin_can_access_the_admin_gui()
    {
        $this->withoutExceptionHandling();
        $admin = factory(User::class)->create(['role' => 'admin']);
        $this->signIn($admin);
        $response = $this->get('/admin')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function an_user_cannot_access_the_admin_gui()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create(['role' => 'user']);
        $this->signIn($user);
        $response = $this->get('/admin')->assertRedirect('/login');
    }
    
    /**
     * @test
     *
     * @return void
     */
    public function an_guest_cannot_access_the_admin_gui()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create(['role' => 'guest']);
        $this->signIn($user);
        $response = $this->get('/admin')->assertRedirect('/login');
    }

    /**
     * @test
     *
     * @return void
     */
    public function an_user_not_logged_in_cannot_access_the_admin_gui()
    {
        $this->withoutExceptionHandling();
        $response = $this->get('/admin')->assertRedirect('/login');
    }
}
