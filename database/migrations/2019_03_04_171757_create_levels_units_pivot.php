<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLevelsUnitsPivot extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('levels_units_pivot', function (Blueprint $table) { 
            $table->increments('id'); 
            $table->integer('unit_id')->unsigned(); 
            $table->integer('level_id')->unsigned(); 
            $table->timestamps(); 

            $table->foreign('unit_id')->references('id')->on('units')->onDelete('cascade')->onUpdate('cascade'); 
            $table->foreign('level_id')->references('id')->on('program_levels')->onDelete('cascade')->onUpdate('cascade'); 
        });
    } 

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('levels_units_pivot');
    }
}
