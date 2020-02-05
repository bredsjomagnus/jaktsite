<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Meat;
use App\Killreport;
use App\User;

class meatTest extends TestCase
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
}
