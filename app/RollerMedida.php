<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RollerMedida extends Model
{
    protected $table = 'rollers_medidas';

    public function roller(){
        return $this->belongsTo('App\Roller', 'roller_id');
    }

    public function medida(){
        return $this->belongsTo('App\Medida', 'medida_id');
    }
}
