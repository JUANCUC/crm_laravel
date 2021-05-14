<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetailsSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('details_sales', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_sale');
            $table->unsignedBigInteger('id_product');
            $table->foreign('id_sale')->references('id')->on('sales');
            $table->foreign('id_product')->references('id')->on('products');
            $table->integer('quantity');
            $table->double('amount', 8,2);
            $table->double('subtotal', 8,2);
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
        Schema::dropIfExists('details_sales');
    }
}
