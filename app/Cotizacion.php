<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cotizacion extends Model
{
	protected $table = 'cotizaciones';

    public function cliente(){
        return $this->belongsTo('App\Cliente', 'cliente_id');
    }

    public function usuario(){
        return $this->belongsTo('App\User', 'usuario_id');
    }

    public function cotizacionEspecifica(){
            return $this->hasOne('App\CotizacionEspecifica', 'id');
    }

    public function cotizacionMedida(){
            return $this->hasOne('App\CotizacionMedida', 'id');
    }
}
