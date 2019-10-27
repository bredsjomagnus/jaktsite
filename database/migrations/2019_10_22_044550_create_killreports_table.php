<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKillreportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('killreports', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('reporter_id');
            $table->unsignedBigInteger('shooter_id');
            $table->string('kindofhunt');
            $table->unsignedBigInteger('animal_id');
            $table->string('image');
            $table->date('killdate');
            $table->string('season');
            $table->unsignedBigInteger('area_id');
            $table->string('place');
            $table->float('longitud');
            $table->float('latitud');
            $table->string('report_status');
            $table->string('locked');
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
        Schema::dropIfExists('killreports');
    }
}
