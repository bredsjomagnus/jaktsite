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
            $table->string('kindofhunt')->nullable();
            $table->unsignedBigInteger('animal_id');
            $table->string('image')->nullable();
            $table->string('killdate')->nullable();
            $table->string('season')->nullable();
            $table->unsignedBigInteger('area_id');
            $table->string('place')->nullable();
            $table->float('longitud')->nullable();
            $table->float('latitud')->nullable();
            $table->string('report_status')->nullable();
            $table->string('locked')->nullable();
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
