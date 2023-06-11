<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class   CreateTableGeneratedDocuments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('generated_documents', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->bigInteger('school_id')->unsigned();
            $table->foreign('school_id')->references('id')->on('schools')->onDelete('cascade')->onUpdate('cascade');

//            $table->bigInteger('room_id')->unsigned();
//            $table->foreign('room_code')->references('id')->on('rooms');

            $table->integer('program_id')->unsigned();
            $table->foreign('program_id')->references('id')->on('programs')->onDelete('cascade')->onUpdate('cascade');

            $table->string('description');

            $table->string('document_name');
            $table->boolean('show')->default(true);

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
        Schema::dropIfExists('generated_documents');
    }
}
