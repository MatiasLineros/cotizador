<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cotizacion;
use App\CotizacionMedida;

class CotizacionController extends Controller
{
    public function index(){
    	$cotizaciones = Cotizacion::join('clientes', 'clientes.id', '=', 'cotizaciones.id')
        ->get(['cotizaciones.id', 'tipo_cotizacion', 'margen_ganancia', 'precio_cortinas', 'precio_total', 'clientes.nombre', 'clientes.apellido']);

    	return response()->json(array(
   			'cotizaciones' => $cotizaciones,
    		'status' => 'success'
   		), 200);
    }

    public function show($id){
        $cotizacion = Cotizacion::find($id);
        if(is_object($cotizacion)){
            if($cotizacion->tipo_cotizacion == "A medida"){
                
                $cotizacion = $cotizacion->join('clientes', 'clientes.id', '=', 'cotizaciones.cliente_id')
                ->join('users', 'users.id', '=', 'cotizaciones.usuario_id')
                ->first([
                    'cotizaciones.id',
                    'cotizaciones.tipo_cotizacion',
                    'cotizaciones.precio_cortinas',
                    'cotizaciones.margen_ganancia',
                    'cotizaciones.precio_total',
                    'users.email',
                    'clientes.rut',
                    'clientes.nombre',
                    'clientes.apellido'
                ]);

                $cortinas = CotizacionMedida::join('colores_rollers_predefinidos', 'colores_rollers_predefinidos.id', '=', 'cotizaciones_a_medida.color_roller_predefinido_id')
                ->join('colores', 'colores.id', '=', 'colores_rollers_predefinidos.color_id')
                ->join('cortinas_predefinidas', 'cortinas_predefinidas.id', '=', 'cotizaciones_a_medida.cortina_predefinida_id')
                ->join('medidas', 'medidas.id', '=', 'cortinas_predefinidas.medida_id')
                ->join('rollers', 'rollers.id', '=', 'cortinas_predefinidas.roller_id')
                ->where('cotizacion_id', $cotizacion->id)
                ->get([
                    'cotizaciones_a_medida.id',
                    'rollers.tipo', 
                    'colores.color', 
                    'medidas.alto', 
                    'medidas.ancho', 
                    'cortinas_predefinidas.precio', 
                ]);

                return response()->json(array(
                    'cotizacion' => $cotizacion,
                    'cortinas' => $cortinas,
                    'status' => 'success'
                ), 200);

            }else{
                return 'en producción...';
            }
        }else{
            return response()->json(array(
                'message' => 'cotización no existe',
                'status' => 'error'
            ), 300);
        }
    }
}
