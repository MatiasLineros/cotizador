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

            $cortina_predefinida = CortinaPredefinida::find($params->cortina_predefinida_id);
            $color_roller_predefinido = ColorRollerPredefinido::where('roller_id', $cortina_predefinida->roller_id)->where('color_id', $params->color_id)->first();

            if(!is_object($cortina_predefinida) || !is_object($color_roller_predefinido)){
                return response()->json(array(
                    'message' => 'Cortina predefinida inexistente',
                    'status' => 'error'
                ), 300);   
            }

            //validar datos
            $validate = \Validator::make($params_array, [ //validator es eficaz para la validacion en una api
                'cortina_predefinida_id' => 'required|numeric|exists:cortinas_predefinidas,id',
                'color_id' => 'required|exists:colores_rollers_predefinidos,color_id',
                'margen_ganancia' => 'required|numeric',
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
            $cotizacion->precio_total = $params->precio_total; //(((precio_cortina x margen)/100) + precio_cortina)
            $cotizacion->save();

            $cotizacion_medida = new CotizacionMedida();
            $cotizacion_medida->id = $cotizacion->id;
            $cotizacion_medida->cortina_predefinida_id = $cortina_predefinida->id;
            $cotizacion_medida->color_roller_predefinido_id = $color_roller_predefinido->id;
            $cotizacion_medida->save();

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
}
