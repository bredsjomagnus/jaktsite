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
            $table->string('sex')->nullable();
            $table->string('age')->nullable();
            $table->float('live_weight')->nullable();
            $table->float('aprox_live_weight')->nullable();
            $table->float('passad_weight')->nullable();
            $table->float('aprox_passad_weight')->nullable();
            $table->float('carcass_weight')->nullable();
            $table->float('aprox_carcass_weight')->nullable();
            $table->float('cut_weight')->nullable();
            $table->float('heart_weight')->nullable();
            $table->float('waste')->nullable();
            $table->string('waste_notes')->nullable();
            $table->string('antlers')->nullable();
            $table->integer('points')->nullable();
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
