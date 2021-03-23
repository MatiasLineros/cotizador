<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
	protected $table = 'colores';

    public function cortinas(){
        return $this->hasMany('App\Cortina');
    }

    public function cortinasPredefinidas(){
        return $this->hasMany('App\CortinaPredefinida');
    }
    
    public function colorRollersPredefinidos(){
        return $this->hasMany('App\ColorRollerPredefinido');
    }
}
