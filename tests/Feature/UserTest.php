<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Hash;
use Tests\TestCase;
use App\User;

class UserTest extends TestCase
{

    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_log_in()
    {
        // $this->withoutExceptionHandling();

        

        $user_attributes = [
            "active"        =>  "yes",
            "role"          =>  "user",
            "occupation"    =>  "hunter",
            "username"      =>  "user_username",
            "email"         =>  "user_email",
            "firstname"     =>  "user_firstname",
            "lastname"      =>  "user_lastname",
            "password"      =>  "user_password",
            "postnumber"    =>  null,
            "address"    =>  null,
            "last_logged_in"    =>  null,
            "logged_in_now"    =>  null,
            "mobilenumber"    =>  null,
            "phonenumber"    =>  null,
            "notes"    =>  null,
            "member_since"    =>  null,
            "city"    =>  null
        ];

        $user = factory(User::class)->create($user_attributes);

        $user = $this->signIn(); // sign in $user

        $this->signIn($user);

        $this->get($user->path(), $user->toArray())->assertOk();


            
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_update_profile_data()
    {
        $this->withoutExceptionHandling();
        $user = $this->signIn(); // sign in $user

        $new_attributes = [
            "firstname"     =>  "new_firstname",
            "lastname"      =>  "new_lastname",
            "address"       =>  "new_address",
            "city"          =>  "new_city",
            "mobilenumber"  =>  "new_mobilenumber",
            "phonenumber"   =>  "new_phonenumber"
        ];

        // dd($user->path());

        $this->patch($user->path()."/update", $new_attributes);

        $this->assertDatabaseHas('users', $new_attributes);
            
    }


    /**
     * @test
     *
     * @return void
     */
    public function a_user_cannot_update_another_users_profile_data()
    {
        // $this->withoutExceptionHandling();
        $johan = factory(User::class)->create();    // Johan
        $magnus = factory(User::class)->create();   // Magnus
        $this->signIn($magnus);                     // Magnus är inloggad

        $new_attributes = [
            "firstname"     =>  "new_firstname",
            "lastname"      =>  "new_lastname",
            "address"       =>  "new_address",
            "city"          =>  "new_city",
            "mobilenumber"  =>  "new_mobilenumber",
            "phonenumber"   =>  "new_phonenumber"
        ];

        $this->patch($johan->path()."/update", $new_attributes)
            ->assertRedirect('login');

        $this->assertDatabaseMissing('users', $new_attributes);
            
    }


    /**
     * @test
     *
     * @return void
     */
    public function an_admin_can_update_another_users_profile_data()
    {
        // $this->withoutExceptionHandling();
        $johan = factory(User::class)->create();    // Johan
        $magnus = factory(User::class)->create(['role'  => 'admin']);   // Magnus
        $this->signIn($magnus);                     // Magnus är inloggad

        $new_attributes = [
            "firstname"     =>  "new_firstname",
            "lastname"      =>  "new_lastname",
            "address"       =>  "new_address",
            "city"          =>  "new_city",
            "mobilenumber"  =>  "new_mobilenumber",
            "phonenumber"   =>  "new_phonenumber"
        ];

        $this->patch($johan->path()."/update", $new_attributes);

        $this->assertDatabaseHas('users', $new_attributes);
            
    }

    /**
     * @test
     *
     * @return void
     */
    public function an_admin_can_register_a_new_user()
    {
        $this->withoutExceptionHandling();
        $admin = factory(User::class)->create(['username' => 'adminuser', 'role'  => 'admin']);   // Admin
        $this->signIn($admin);                                         // Admin logged in

        // new users attributes
        // $user_attributes = factory(User::class)->raw(['username' => 'newuser', 'password'   => '1234abdc']);
        $user_attributes = [
            "active"        =>  "yes",
            "occupation"    =>  "hunter",
            "role"          =>  "user",
            'username'      => "newuser",
            'email'         => "email@domain.com",
            'firstname'     => "firstname",
            'lastname'      => "lastname",
            "password"      => "abcd1234"
        ];

        // storing new user
        $this->post('/user/store', $user_attributes)->assertRedirect('/user/2');

        // new user in database
        $this->assertDatabaseHas('users', ['username' => $user_attributes['username']]);      
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_guest_cannot_register_as_a_new_user()
    {
        // $this->withoutExceptionHandling();
        $guest = factory(User::class)->make(); // user object but not created and stored to database

        // Guests attributes
        $guest_attributes = $guest->toArray();

        // Setting Guest password
        $guest_attributes['password'] = 'new_password123';

        // trying to store guest redirects to 'home'
        $this->post('/user/store', $guest_attributes)->assertRedirect('/login');

        // guest is not in database
        $this->assertDatabaseMissing('users', ['username' => $guest_attributes['username']]);      
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_cannot_register_a_new_user()
    {
        $this->withoutExceptionHandling();


        $user = factory(User::class)->create(); // user
        $this->signIn($user);                   // user is signed in

        $guest = factory(User::class)->make();  // guest that user will try to register

        // Guests attributes
        $guest_attributes = $guest->toArray();

        // Setting Guest password
        $guest_attributes['password'] = 'new_password123';

        // trying to store guest redirects to 'home'
        $this->post('/user/store', $guest_attributes)->assertRedirect('/login');

        // guest is not in database
        $this->assertDatabaseMissing('users', ['username' => $guest_attributes['username']]);      
    }


    /**
     * @test
     * 
     * @return void
     */
    public function a_user_can_change_its_own_password()
    {   
        $old_password = Hash::make('123456');
        $user = factory(User::class)->create([
            'password'  =>  $old_password
        ]);

        $this->signIn($user);

        $attributes = [
            'password'  => '654321'
        ];

        $this->patch('user/'.$user->id.'/update', $attributes);

        $this->assertDatabaseMissing('users', ['password'   => $old_password]);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_user_cannot_change_another_users_password()
    {   
        $old_password = Hash::make('123456');
        $user_1 = factory(User::class)->create([
            'password'  =>  $old_password
        ]);

        $user_2 = factory(User::class)->create();

        $this->signIn($user_2);

        $attributes = [
            'password'  => '654321'
        ];

        $this->patch('user/'.$user_1->id.'/update', $attributes);

        $this->assertDatabaseHas('users', ['password'   => $old_password]);
    }    

}
