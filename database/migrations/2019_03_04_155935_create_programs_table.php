<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('programs', function (Blueprint $table) {
            $table->increments('id')->onDelete('cascade')->onUpdate('cascade');
            $table->string("name");
            $table->integer('semesters');
            $table->integer('years');
            //$table->string('program_code');
            //$table->integer('department_ID');
            $table->timestamps();
//            $table->integer('deparment_ID')->unsigned()->nullable();
//            $table->foreign('deparment_ID')->references('id')->on('departments')->onDelete("cascade")->onUpdate("cascade");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('programs');
    }
}
