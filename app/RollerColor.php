<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RollerColor extends Model
{
    protected $table = 'rollers_colores';

    public function roller(){
        return $this->belongsTo('App\Roller', 'roller_id');
    }

    public function color(){
        return $this->belongsTo('App\Color', 'color_id');
    }
}
