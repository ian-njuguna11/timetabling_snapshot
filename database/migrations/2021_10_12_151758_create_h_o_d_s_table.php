<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHODSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('h_o_d_s', function (Blueprint $table) {
            // $table->bigIncrements('id');
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('role')->default(0);
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            
            $table->integer('lecturer_ID')->unsigned()->nullable();
            $table->foreign('lecturer_ID')->references('id')->on('lectures')->onDelete("cascade")->onUpdate("cascade");

            $table->integer('deparment_ID')->unsigned()->nullable();
            $table->foreign('deparment_ID')->references('id')->on('departments')->onDelete("cascade")->onUpdate("cascade");

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
        Schema::dropIfExists('h_o_d_s');
    }
}
