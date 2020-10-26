<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

use App\Killreport;
use App\User;
use App\Animal;
use App\Area;
use App\Meat;
use App\Image;



class KillreportTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_belongs_to_a_shooter()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport = factory(Killreport::class)->create(['shooter_id' => $user->id]);

        $this->assertInstanceOf(User::class, $killreport->shooter);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_belongs_to_a_reporter()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $killreport = factory(Killreport::class)->create(['reporter_id' => $user->id]);

        $this->assertInstanceOf(User::class, $killreport->reporter);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_can_belong_to_a_different_reporter_and_a_shooter()
    {
        // $this->withoutExceptionHandling();
        $magnus = factory(User::class)->create(['id' => 1]);
        $johan = factory(User::class)->create(['id' => 2]);
        $killreport = factory(Killreport::class)->create(['shooter_id' => $magnus->id, 'reporter_id' => $johan->id]);

        $this->assertEquals(2, $killreport->reporter->id);
        $this->assertEquals(1, $killreport->shooter->id);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_has_an_animal()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $animal = factory(Animal::class)->create([
            'shooter_id'    => $user->id
        ]);
        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $user->id, 
            'reporter_id'   => $user->id, 
            'animal_id'     => $animal->id 
            ]);

        $this->assertInstanceOf(Animal::class, $killreport->animal());
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_has_one_area()
    {
        // $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $area = factory(Area::class)->create([
            'area_name'     => 'Småris'
        ]);
        $killreport = factory(Killreport::class)->create([
            'shooter_id'    => $user->id, 
            'reporter_id'   => $user->id, 
            'area_id'       => $area->id 
            ]);

        $this->assertInstanceOf(Area::class, $killreport->area());
    }


    /**
     * @test
     *
     * @return void
     */
    public function a_killreports_has_one_or_many_meats()
    {
        $this->withoutExceptionHandling();
        
        $user = $this->signIn();

        $killreport = factory(Killreport::class)->create();
        $meat_1 = factory(Meat::class)->create(['killreport_id' => $killreport->id, 'user_id' => $user->id]);
        $meat_2 = factory(Meat::class)->create(['killreport_id' => $killreport->id, 'user_id' => 2]);
        $meat_3 = factory(Meat::class)->create(['killreport_id' => 2, 'user_id' => $user->id]);
    

        // Testar hasMany relation
        // Method 1: A comment exists in a post's comment collections.
        $this->assertTrue($killreport->meat->contains($meat_1));

        // Method 2: Count that a post comments collection exists.
        $this->assertEquals(2, $killreport->meat->count());

        // Method 3: Comments are related to posts and is a collection instance.
        $this->assertInstanceOf('Illuminate\Database\Eloquent\Collection', $killreport->meat);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_killreport_has_one_or_many_images()
    {
        $this->withoutExceptionHandling();
        $user = $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $image_1 = factory(Image::class)->create([
            'killreport_id' => $killreport->id,
            'user_id'       => $user->id
            ]);
        $image_2 = factory(Image::class)->create([
            'killreport_id' => $killreport->id,
            'user_id'       => 2
            ]);
        

        $this->assertTrue($killreport->images->contains($image_1));

        $this->assertEquals(2, $killreport->images->count());

        $this->assertInstanceOf(Collection::class, $killreport->images);
    }


    /**
     * @test
     *
     * @return void
     */
    public function a_killreport_has_a_path()
    {
        $this->withoutExceptionHandling();
        $killreport = factory(Killreport::class)->create();

        $this->assertEquals($killreport->path(), "killreports/1");
    }

    /**
     * @test
     *
     * @return void
     */
    public function get_correct_season()
    {
        $this->withoutExceptionHandling();
        $season_1819_1 = "2018-07-01";
        $season_1819_2 = "2018-06-30";

        $this_season = date('Y-m-d');
  
        $res_1 = app('App\Http\Controllers\KillreportController')->getSeason($this_season);
        $res_2 = app('App\Http\Controllers\KillreportController')->getSeason($season_1819_1);
        $res_3 = app('App\Http\Controllers\KillreportController')->getSeason($season_1819_2);


        $this->assertEquals($res_1, "20/21");
        $this->assertEquals($res_2, "18/19");
        $this->assertEquals($res_3, "17/18");
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_killreport_can_get_its_display_image()
    {
        $killreport = factory(Killreport::class)->create();
        $image_display = factory(Image::class)->create([
            'killreport_id'     => $killreport->id,
            'display'           => 'yes',
            'name'              => 'image_display.jpg',
        ]);

        $image_no_display = factory(Image::class)->create([
            'killreport_id'     => $killreport->id,
            'display'           => 'no',
            'name'              => 'image_no_display.jpg',
        ]);

        
        $this->assertEquals($image_display->getAttributes(), $killreport->display_image()->getAttributes());
        $this->assertNotEquals($image_no_display->getAttributes(), $killreport->display_image()->getAttributes());
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_killreport_can_get_its_display_image_path()
    {
        $killreport = factory(Killreport::class)->create();
        $image_display = factory(Image::class)->create([
            'killreport_id'     => $killreport->id,
            'display'           => 'yes',
            'name'              => 'image_display.jpg',
        ]);

        $image_no_display = factory(Image::class)->create([
            'killreport_id'     => $killreport->id,
            'display'           => 'no',
            'name'              => 'image_no_display.jpg',
        ]);

        $this->assertEquals(asset('storage/images/killreports').'/'.$image_display->prefix_and_name(),$killreport->display_path());
        $this->assertNotEquals(asset('storage/images/killreports').'/'.$image_no_display->prefix_and_name(), $killreport->display_path());
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_killreport_get_defult_display_image_if_now_other_is_set()
    {
        $this->withoutExceptionHandling();
        $killreport = factory(Killreport::class)->create();
        $image_1 = factory(Image::class)->create([
            'killreport_id'     => $killreport->id,
            'display'           => 'no',
            'name'              => 'image_1.jpg',
        ]);

        $image_2 = factory(Image::class)->create([
            'killreport_id'     => $killreport->id,
            'display'           => 'no',
            'name'              => 'image_2.jpg',
        ]);

        // dd($killreport->display_path());
        
        // dd(Storage::path('public/images/killreports/default_display.jpg'));
        $this->assertEquals(asset('storage/images/killreports/default_display.jpg'), $killreport->display_path());
        $this->assertNotEquals(asset('storage/images/killreports/').'/'.$image_1->prefix_and_name(),$killreport->display_path());
    }
}
