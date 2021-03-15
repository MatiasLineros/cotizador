<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Roller extends Model
{
    protected $table = 'rollers';

    public function telas(){
        return $this->hasMany('App\Tela');
    }

    public function rollerColores(){
        return $this->hasMany('App\RollerColor');
    }

    public function rollerMedidas(){
        return $this->hasMany('App\RollerMedida');
    }
}
