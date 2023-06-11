<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ModifyTableProgramLevels extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('program_levels', function (Blueprint $table) {
            $table->foreign('program_id')->references('id')->on('programs')->onDelete('cascade')->onUpdate('cascade');
            // $table->foreign('depart_ID')->references('id')->on('departments')->onDelete('cascade')->onUpdate('cascade');
            // $table->foreign('program_id')->references('id')->on('programs')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('program_levels', function (Blueprint $table) {
            //
        });
    }
}
