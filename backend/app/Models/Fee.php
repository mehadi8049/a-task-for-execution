<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fee extends Model
{
    use HasFactory;

    protected $fillable = ['code_id', 'year_id', 'fee'];

    public function fcode()
    {
        return $this->belongsTo(Code::class,'code_id');
    }

    public function fyear()
    {
        return $this->belongsTo(Year::class,'year_id');
    }
}
