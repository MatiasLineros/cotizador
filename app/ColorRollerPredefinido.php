<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ColorRollerPredefinido extends Model
{
    protected $table = 'colores_rollers_predefinidos';

    public function roller(){
        return $this->belongsTo('App\Roller', 'roller_id');
    }

    public function color(){
        return $this->belongsTo('App\Color', 'color_id');
    }
}
