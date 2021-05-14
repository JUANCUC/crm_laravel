<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class People extends Model
{
    use HasFactory;
    protected $fillable = [
        'dpi',
        'name',
        'last_name',
        'age',
        'nit',
        'address',
        'department',
        'township'
    ];
}
