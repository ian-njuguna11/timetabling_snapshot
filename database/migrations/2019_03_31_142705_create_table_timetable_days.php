<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableTimetableDays extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('timetable_days', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('timetable_id')->unsigned();
            $table->string('day');
            $table->double('period_length', 5, 2)->default(3.00);
            $table->timestamps();

            $table->foreign('timetable_id')->references('id')->on('timetables')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('timetable_days');
    }
}
