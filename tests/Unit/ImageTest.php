<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

use App\Image;
use App\Killreport;
use App\User;

class ImageTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function a_image_belongs_to_a_killreport()
    {
        // $this->withoutExceptionHandling();
        $image = factory(Image::class)->create();

        $this->assertInstanceOf(Killreport::class, $image->killreport);
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_image_belongs_to_a_user()
    {
        $this->withoutExceptionHandling();
        $image = factory(Image::class)->create();

        $this->assertInstanceOf(User::class, $image->hunter);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function an_image_has_a_name_prefix()
    {
        $image = factory(Image::class)->create([
            'killreport_id'     => 98,
            'user_id'           => 1,
            'name'              => 'name.jpg',
            'path'              => 'images/killreports'
        ]);

        $this->assertEquals('k98_i1_u1_name.jpg', $image->prefix_and_name());
    }

    /**
     * @test
     * 
     * @return void
     */
    public function an_image_has_the_image_storage_path()
    {
        $image = factory(Image::class)->create([
            'killreport_id'     => 98,
            'user_id'           => 1,
            'name'              => 'name.jpg',
            'path'              => 'images/killreports'
        ]);
        
        // dd(storage_path("images/killreports"));
        // dd(asset('images/huntingimages/default_display.jpg'));
        
        $this->assertEquals(asset('storage/images/killreports').'/'.$image->prefix_and_name(), $image->storage_path());
    }
}
