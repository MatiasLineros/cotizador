<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CotizacionMedida extends Model
{
    protected $table = 'cotizaciones_a_medida';

    public function cotizacion(){
        return $this->hasOne('App\Cotizacion', 'id'); 
    }

    public function cortinaPredefinida(){
        return $this->belongsTo('App\CortinaPredefinida', 'cortina_predefinida_id');
    }

    public function colorRollerPredefinido(){
        return $this->belongsTo('App\ColorRollerPredefinido', 'color_roller_predefinido_id');
    }
}
