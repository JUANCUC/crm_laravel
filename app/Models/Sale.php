<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;
    protected $fillable = [
        'id_client',
        'id_user',
        'total_quantity',
        'total_amount',
    ];

    public function details_sales(){
        return $this->morphMany('App\Models\DetailsSale', 'id_sale');
    }
}
