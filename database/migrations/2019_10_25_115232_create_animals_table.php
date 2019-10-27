<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnimalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('animals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('shooter_id');
            $table->string('species');
            $table->string('speciestype');
            $table->string('engspecies');
            $table->string('sex');
            $table->string('age');
            $table->float('live_weight');
            $table->float('aprox_live_weight');
            $table->float('passad_weight');
            $table->float('aprox_passad_weight');
            $table->float('carcass_weight');
            $table->float('aprox_carcass_weight');
            $table->float('cut_weight');
            $table->float('heart_weight');
            $table->float('waste');
            $table->string('waste_notes');
            $table->string('antlers');
            $table->integer('points');
            $table->dateTime('deleted_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('animals');
    }
}
