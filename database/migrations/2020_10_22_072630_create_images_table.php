<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('imagesv2', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('killreport_id');
            $table->unsignedBigInteger('user_id');
            $table->string('name');
            $table->string('path');
            $table->string('display')->default('no');
            $table->text('description')->nullable();
            $table->bigInteger('filesize')->default(0);
            $table->string('filesize_readable')->nullable();
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
        Schema::dropIfExists('images');
    }
}
