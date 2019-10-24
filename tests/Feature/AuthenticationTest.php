<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\User;

class AuthenticationTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_logged_in_user_redirects_to_account_page()
    {
        $user = $this->signIn();
        $this->post('/login')->assertRedirect($user->path());
    }

    /**
     * @test
     *
     * @return void
     */
    public function authenticated_users_can_visit_their_account_page()
    {
        // $this->withoutExceptionHandling();
        $user = $this->signIn(); // signed in user

        $this->get($user->path())->assertOk();


    }

    /**
     * @test
     *
     * @return void
     */
    public function you_can_not_visit_another_users_account_page()
    {
        $john = factory(User::class)->create(); // not signed in user
        $jane = $this->signIn(); // signed in user
        $this->get($john->path())->assertRedirect('home');

    }

    /**
     * @test
     *
     * @return void
     */
    public function admin_can_visit_another_users_account_page()
    {
        $john = factory(User::class)->create(); // not signed in user
        $admin = factory(User::class)->create(['role' => 'admin']); // admin user
        $this->signIn($admin); // sign in admin

        $this->get($john->path())->assertOk();

    }

    /**
     * @test
     *
     * @return void
     */
    public function admin_can_see_admin_link_in_navbar()
    {
        $admin = factory(User::class)->create(['role' => 'admin']); // admin user
        $this->signIn($admin); // sign in admin

        $this->get('/home')->assertSee('Admin');

    }

    /**
     * @test
     *
     * @return void
     */
    public function user_cannot_see_admin_link_in_navbar()
    {
        $admin = factory(User::class)->create(['role' => 'user']); // non admin user
        $this->signIn($admin); // sign in

        $this->get('/home')->assertDontSee('Admin');

    }



}
