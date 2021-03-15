<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CotizacionMedida extends Model
{
    protected $table = 'cotizaciones_a_medida';

    public function cotizacion(){
        return $this->hasOne('App\Cotizacion', 'id'); 
    }

    public function rollerColor(){
        return $this->belongsTo('App\RollerColor', 'roller_color_id');
    }

    public function rollerMedida(){
        return $this->belongsTo('App\RollerMedida', 'roller_medida_id');
    }
}
