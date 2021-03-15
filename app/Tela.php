<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tela extends Model
{
    protected $table = 'telas';

    public function roller(){
        return $this->belongsTo('App\Roller', 'roller_id');
    }

    public function cortinas(){
        return $this->hasMany('App\Cortina');
    }
}
