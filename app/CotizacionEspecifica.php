<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CotizacionEspecifica extends Model
{
    protected $table = 'cotizaciones_especificas';

    public function cotizacion(){
        return $this->hasOne('App\Cotizacion', 'id'); 
    }

    public function cortina(){
        return $this->belongsTo('App\Cortina', 'cortina_id');
    }
}
