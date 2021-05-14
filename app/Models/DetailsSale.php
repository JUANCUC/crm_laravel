<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailsSale extends Model
{
    use HasFactory;
    
    protected $table = 'details_sales';

    protected $fillable = [
        'id_sale',
        'id_product',
        'quantity',
        'amount',
        'subtotal'
    ];

    public function detailable() {
        return $this->morphTo();
    }
}
