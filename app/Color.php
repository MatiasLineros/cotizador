<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
	protected $table = 'colores';

    public function cortinas(){
        return $this->hasMany('App\Cortina');
    }

    public function rollerColores(){
        return $this->hasMany('App\RollerColor');
    }
}
