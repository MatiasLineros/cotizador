<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Roller extends Model
{
    protected $table = 'rollers';

    public function telas(){
        return $this->hasMany('App\Tela');
    }

    public function cortinasPredefinidas(){
        return $this->hasMany('App\CortinaPredefinida');
    }

    public function colorRollerPredefinido(){
        return $this->hasMany('App\ColorRollerPredefinido');
    }
}
