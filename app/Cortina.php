<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cortina extends Model
{
    protected $table = 'cortinas';

    public function tela(){
        return $this->belongsTo('App\Tela', 'tela_id');
    }

    public function color(){
        return $this->belongsTo('App\Color', 'color_id');
    }

    public function cotizacionesEspecificas(){
        return $this->hasMany('App\CotizacionEspecifica');
    }
}
