<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sejour extends Model
{
    protected $table = 'sejour';
    protected $primaryKey = 'NumSej';
    public $timestamps = false;
}
