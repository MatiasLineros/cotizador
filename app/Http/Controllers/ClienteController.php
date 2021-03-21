<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;
use App\Helpers\ChileRut;
use App\Rules\validarRut;

class ClienteController extends Controller
{
    public function index(){
    	//$clientes = Cliente::all();
    	$clientes = Cliente::get(['id', 'rut', 'nombre', 'apellido', 'telefono', 'direccion']);

    	return response()->json(array(
   			'clientes' => $clientes,
    		'status' => 'success'
   		), 200);
    }

    public function show($id){

        $cliente = Cliente::find($id);
        
        if(is_object($cliente)){
            $cliente = Cliente::find($id);
            return response()->json(array(
                'cliente' => $cliente,
                'status' => 'success'
            ), 200);
        }else{
            return response()->json(array(
                'message' => 'Cliente no existente',
                'status' => 'error'
            ), 300);
        }
    }

    public function store(Request $request){
        //recoger datos por post
        $json = $request->input('json', null); //guarda json q viene por request
        $params = json_decode($json); //guarda parametros
        $params_array = json_decode($json, true); //guarda parametros en array

        //validacion
        $validate = \Validator::make($params_array, [ //validator es eficaz para la validacion en una api
        	'rut' => ['required', 'unique:clientes', new validarRut(new ChileRut)],
            'nombre' => 'required|regex:/^[\pL\s]+$/u',
            'apellido' => 'required|regex:/^[\pL\s]+$/u',
            'telefono' => 'required|numeric',
            'direccion' => 'required',
        ]);
        
        if($validate->fails()){
            $errores = $validate->errors();

            return response()->json(array(
                'errores' => $errores,
                'status' => 'error'
            ), 200);   
        }

        //guardar cliente
        $cliente = new Cliente();
        $cliente->rut = $params->rut;
        $cliente->nombre = $params->nombre;
        $cliente->apellido = $params->apellido;
        $cliente->telefono = $params->telefono;
        $cliente->direccion = $params->direccion;
        $cliente->save();

        $data = array(
            'cliente' => $cliente,
            'status' => 'success',
            'code' => 200,
        );

        return response()->json($data, 200);
    }

    public function edit($id){

    	$cliente = Cliente::where('id', $id)->get(['id', 'rut', 'nombre', 'apellido', 'telefono', 'direccion']);

        if(!$cliente->isEmpty()){
            return response()->json(array(
                'cliente' => $cliente,
                'status' => 'success'
            ), 200);
        }else{
            return response()->json(array(
                'message' => 'Cliente no existe',
                'status' => 'error'
            ), 300);  
        }        
    }

    public function update($id, Request $request){
    
        $cliente = Cliente::find($id);

        if(!is_object($cliente)){
            return response()->json(array(
                'message' => 'Cliente no existente',
                'status' => 'error'
            ), 300);
        }

        $json = $request->input('json', null);
        $params = json_decode($json);
        $params_array = json_decode($json, true);

        //validacion
        $validate = \Validator::make($params_array, [ //validator es eficaz para la validacion en una api
            'rut' => ['required', 'unique:clientes', new validarRut(new ChileRut)],
            'nombre' => 'required|regex:/^[\pL\s]+$/u',
            'apellido' => 'required|regex:/^[\pL\s]+$/u',
            'telefono' => 'required|numeric',
            'direccion' => 'required',
        ]);
        
        if($validate->fails()){
            $errores = $validate->errors();

            return response()->json(array(
                'errores' => $errores,
                'status' => 'error'
            ), 200);  
        }

        $cliente->rut = $params->rut;
        $cliente->nombre = $params->nombre;    
        $cliente->apellido = $params->apellido;
        $cliente->telefono = $params->telefono;
        $cliente->direccion = $params->direccion;
        $cliente->update();

        $data = array(
            'cliente' => $cliente,
            'status' => 'success',
            'code' => 200,
        );

        return response()->json($data, 200);
    }
}
