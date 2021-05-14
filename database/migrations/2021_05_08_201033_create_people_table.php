<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people', function (Blueprint $table) {
            $table->unsignedBigInteger('dpi')->unique();
            //$table->unsignedBigInteger('id_address');
            //$table->foreign('id_address')->references('id')->on('addresses');
            $table->string('name');
            $table->string('last_name');
            $table->string('nit');
            $table->integer('age');
            $table->string('address');
            $table->string('department');
            $table->string('township');
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
        Schema::dropIfExists('people');
    }
}
