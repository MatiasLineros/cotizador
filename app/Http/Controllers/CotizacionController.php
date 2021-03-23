<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cotizacion;

class CotizacionController extends Controller
{
    public function index(){
    	$cotizaciones = Cotizacion::join('clientes', 'clientes.id', '=', 'cotizaciones.id')
    	->get(['cotizaciones.id', 'tipo_cotizacion', 'margen_ganancia', 'precio_total', 'clientes.nombre', 'clientes.apellido']);

    	return response()->json(array(
   			'cotizaciones' => $cotizaciones,
    		'status' => 'success'
   		), 200);
    }

    public function show($id){
    	$cotizacion = Cotizacion::find($id);
    	if($cotizacion->tipo_cotizacion == "A medida"){
    		//redirigir a ruta 
    		return redirect()->route('cotizacion-medida.show', [$cotizacion->id]);
    	}else{
    		return 'en producción...';
    	}
    }
}
