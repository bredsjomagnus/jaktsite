<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Meat;
use App\Killreport;
use App\User;
use App\Animal;

class DataTest extends TestCase
{
    use RefreshDatabase;
    /**
     * @test
     * 
     * @return void
     */
    public function a_user_can_get_to_data_index_view()
    {
        // $this->withoutExceptionHandling();
        // Loggar in vanlig användare

        
        $user = factory(User::class)->create([
            'role'      => 'user'
        ]);
        $this->signIn($user);

        $this->get('/data')->assertOk();
    }
}
