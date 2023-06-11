<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTimeTablePeriodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    // <th>Day</th>
    // <th>Time</th>
    // <th>Unit</th>
    // <th>Room</th>
    // {{-- <th>Room Capacity</th> --}}
    // <th>Group</th>
    // {{-- <th>No. of students</th> --}}
    // <th>Programs</th>
    public function up()
    {
        Schema::create('time_table_periods', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string("day");
            $table->string("time");
            $table->string("unit");
            $table->string("room");
            $table->string("group");
            $table->string("number_of_students");
            $table->string("Programs");
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
        Schema::dropIfExists('time_table_periods');
    }
}
