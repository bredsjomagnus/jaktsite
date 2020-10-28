<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;

use App\User;
use App\Animal;
use App\Killreport;
use App\Image;

class UserTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_user_has_a_path()
    {
        $user = factory(User::class)->create();

        $this->assertEquals($user->path(), "user/1");
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_be_shooter_in_many_killreports()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport_one = factory(Killreport::class)->create(['shooter_id' => $user->id]);
        $killreport_two = factory(Killreport::class)->create(['shooter_id' => $user->id]);

        $this->assertInstanceOf(Collection::class, $user->killreports_shooter);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_be_reporter_too_many_killreports()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport_one = factory(Killreport::class)->create(['reporter_id' => $user->id]);
        $killreport_two = factory(Killreport::class)->create(['reporter_id' => $user->id]);

        // dd(gettype($user->reporter));

        $this->assertInstanceOf(Collection::class, $user->killreports_authored);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_be_both_shooter_and_reporter_too_a_killreports()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport = factory(Killreport::class)->create(['shooter_id' => $user->id, 'reporter_id' => $user->id]);

        // dd(gettype($user->reporter));

        $this->assertInstanceOf(Collection::class, $user->killreports_shooter);
        $this->assertInstanceOf(Collection::class, $user->killreports_authored);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_have_many_animals()
    {
        $this->withoutExceptionHandling();
        $user = $this->signIn();

        // report_kill(shooter = null, reporter = null, animal = null, area = null)
        $data = $this->report_kill($user, $user); // data['shooter', 'reporter', 'animal', 'area', 'killreport']

        $this->assertCount(1, $data['shooter']->animals);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_user_has_one_or_many_images()
    {
        $user = $this->signIn();

        $image_1 = factory(Image::class)->create(['user_id' => $user->id]);
        $image_2 = factory(Image::class)->create(['user_id' => $user->id]);
        $image_3 = factory(Image::class)->create(['user_id' => 2]);

        $this->assertTrue($user->images->contains($image_1));
        $this->assertEquals(2, $user->images->count());
        $this->assertInstanceOf(Collection::class, $user->images);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_be_a_hunter()
    {
        $this->withoutExceptionHandling();
        $user1 = factory(User::class)->create(['occupation' => 'hunter']);
        $user2 = factory(User::class)->create(['occupation' => 'dancer']);
        $user3 = factory(User::class)->create(['occupation' => 'hunter']);
        $user4 = factory(User::class)->create(['occupation' => 'bartender']);
        $user5 = factory(User::class)->create(['occupation' => 'hunter']);

        $this->assertCount(3, User::where('occupation', 'hunter')->get());
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_user_can_return_name_by_id()
    {
        $user = factory(User::class)->create([
            'firstname'     => 'Magnus',
            'lastname'      => 'Andersson'
        ]);

        $this->assertEquals('Magnus Andersson', $user->get_name());
    }

    

}
