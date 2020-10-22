<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Database\Eloquent\Collection;
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
}
