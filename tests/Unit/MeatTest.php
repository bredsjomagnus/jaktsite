<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Meat;
use App\Killreport;
use App\User;
use App\Animal;

class MeatTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     *
     * @return void
     */
    public function meat_has_a_report()
    {
        $this->withoutExceptionHandling();
        $meat = factory(Meat::class)->create();

        $this->assertInstanceOf(Killreport::class, $meat->killreport);
    }

    /**
     * @test
     *
     * @return void
     */
    public function meat_has_a_hunter()
    {
        $this->withoutExceptionHandling();
        $meat = factory(Meat::class)->create();

        $this->assertInstanceOf(User::class, $meat->hunter);
    }

    /**
     * @test
     *
     * @return void
     */
    public function meat_has_an_animal()
    {
        $this->withoutExceptionHandling();
        $meat = factory(Meat::class)->create();

        $this->assertInstanceOf(Animal::class, $meat->animal());
    }

    /**
     * @test
     *
     * @return void
     */
    public function meat_has_a_path()
    {
        $this->withoutExceptionHandling();
        $meat = factory(Meat::class)->create();

        $this->assertEquals($meat->path(), 'meat/'.$meat->killreport_id);
    }

    /**
     * @test
     *
     * @return void
     */
    public function meat_can_get_the_season()
    {
        $this->withoutExceptionHandling();
        $meat = factory(Meat::class)->create();

        $this->assertEquals($meat->season(), '19/20');
    }
}
