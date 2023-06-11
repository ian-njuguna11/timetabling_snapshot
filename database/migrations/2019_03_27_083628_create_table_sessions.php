<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableSessions extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sessions', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('period_id')->unsigned();
            $table->integer('unit_id')->unsigned()->nullable();
            $table->integer('lecture_id')->unsigned()->nullable();
            $table->integer('room_id')->unsigned()->nullable();
            $table->string("group")->nullable();
            $table->integer("groups")->default(1);
            $table->timestamps();
            $table->foreign("room_id")->references('id')->on('rooms')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sessions');
    }
}
