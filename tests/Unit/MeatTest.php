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

    /**
     * @test
     *
     * @return void
     */
    public function calculate_year_back_to_reach_for_meats_rows()
    {
        $this->withoutExceptionHandling();
        $year_back = 7;

        $season_1 = app('App\Http\Controllers\KillreportController')->getSeason("2019-02-13");
        $from_year_1 = intval(substr($season_1, 0, 2)) - $year_back + 1;
        $from_date_1 = "20".strval($from_year_1)."-07-01";
        $this->assertEquals("2012-07-01", $from_date_1);

        $season_2 = app('App\Http\Controllers\KillreportController')->getSeason("2019-07-13");
        $from_year_2 = intval(substr($season_2, 0, 2)) - $year_back + 1;
        $from_date_2 = "20".strval($from_year_2)."-07-01";
        $this->assertEquals("2013-07-01", $from_date_2);

        $season_3 = app('App\Http\Controllers\KillreportController')->getSeason("2020-07-13");
        $from_year_3 = intval(substr($season_3, 0, 2)) - $year_back + 1;
        $from_date_3 = "20".strval($from_year_3)."-07-01";
        $this->assertEquals("2014-07-01", $from_date_3);
    }
}
