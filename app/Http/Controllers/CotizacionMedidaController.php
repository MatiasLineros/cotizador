<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Roller;
use App\Color;
use App\Cotizacion;
use App\CortinaPredefinida;
use App\ColorRollerPredefinido;
use App\CotizacionMedida;
use App\Helpers\JwtAuth;

class CotizacionMedidaController extends Controller
{
    public function create(){
		//y mandar solo los q estan vinculado a las cortinas predefinidas
		$rollers = Roller::join('cortinas_predefinidas', 'cortinas_predefinidas.roller_id', '=', 'rollers.id')
                         ->join('colores_rollers_predefinidos', 'colores_rollers_predefinidos.roller_id', '=', 'rollers.id')
                         ->groupBy('rollers.id', 'rollers.tipo')
                         ->get(['rollers.id', 'rollers.tipo']);

        return response()->json(array(
            'rollers' => $rollers,
            'status' => 'success'
        ), 200);
        
	}

    public function store(Request $request){
        //recoger datos por post
        $json = $request->input('json', null); 
        $params = json_decode($json); 
        $params_array = json_decode($json, true); 

        //identificar usuario
        $hash = $request->header('Authorization', null);
        $JwtAuth = new JwtAuth();
        $usuario = $JwtAuth->checkToken($hash, true);

        if($usuario){
            foreach ($params->cortinas as $cortina) {
                $cortina_predefinida = CortinaPredefinida::find($cortina->cortina_predefinida_id);
                $color_roller_predefinido = ColorRollerPredefinido::where('roller_id', $cortina_predefinida->roller_id)->where('color_id', $cortina->color_id)->first();

                if(!is_object($cortina_predefinida) || !is_object($color_roller_predefinido)){
                    return response()->json(array(
                        'message' => 'Cortina predefinida inexistente',
                        'status' => 'error'
                    ), 300);   
                }
            }

            //validar datos
            $validate = \Validator::make($params_array, [ //validator es eficaz para la validacion en una api
                //'cortina_predefinida_id' => 'required|numeric|exists:cortinas_predefinidas,id',
                //'color_id' => 'required|exists:colores_rollers_predefinidos,color_id',
                'margen_ganancia' => 'required|numeric',
                'precio_cortinas' => 'required|numeric',
                'precio_total' => 'required|numeric',
                'cliente_id' => 'required|numeric|exists:clientes,id',
            ]);
                
            if($validate->fails()){
                $errores = $validate->errors();

                return response()->json(array(
                    'errores' => $errores,
                    'status' => 'error'
                ), 300);   
            }

            $cotizacion = new Cotizacion();
            $cotizacion->usuario_id = $usuario->id;
            $cotizacion->cliente_id = $params->cliente_id;
            $cotizacion->tipo_cotizacion = "A medida";
            $cotizacion->margen_ganancia = $params->margen_ganancia;
            $cotizacion->precio_cortinas = $params->precio_cortinas;
            $cotizacion->precio_total = $params->precio_total; //(((precio_cortinas x margen)/100) + precio_cortinas)
            $cotizacion->save();

            foreach ($params->cortinas as $cortina) {
                $cotizacion_medida = new CotizacionMedida();
                $cotizacion_medida->cotizacion_id = $cotizacion->id;
                $cotizacion_medida->cortina_predefinida_id = $cortina->cortina_predefinida_id;
                $cotizacion_medida->color_roller_predefinido_id = $cortina->color_id;
                $cotizacion_medida->save();
            }

            return response()->json(array(
                'message' => 'Cotización almacenada correctamente',
                'status' => 'success'
            ), 200); 

        }else{
            return response()->json(array(
                'message' => 'Usuario no reconocido',
                'status' => 'error'
            ), 300); 
        }
    }   

    public function show($id){
        $cotizacion = CotizacionMedida::
        join('colores_rollers_predefinidos', 'colores_rollers_predefinidos.id', '=', 'cotizaciones_a_medida.color_roller_predefinido_id')
        ->join('colores', 'colores.id', '=', 'colores_rollers_predefinidos.color_id')
        ->join('cortinas_predefinidas', 'cortinas_predefinidas.id', '=', 'cotizaciones_a_medida.cortina_predefinida_id')
        ->join('medidas', 'medidas.id', '=', 'cortinas_predefinidas.medida_id')
        ->join('rollers', 'rollers.id', '=', 'cortinas_predefinidas.roller_id')
        ->where('cotizaciones_a_medida.id', $id)
        ->first([
            'cotizaciones_a_medida.id',
            'rollers.tipo', 
            'colores.color', 
            'medidas.alto', 
            'medidas.ancho', 
            'cortinas_predefinidas.precio', 
        ]);
        if(is_object($cotizacion)){
            return response()->json(array(
                'cotizacion' => $cotizacion,
                'status' => 'success'
            ), 200);  
        }else{
            return response()->json(array(
                'message' => 'No existen registros',
                'status' => 'error'
            ), 300); 
        }
    }

}
