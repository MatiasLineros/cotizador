<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
   	public function index(){
    	
    	$usuarios = User::all()->load('rol');

    	return response()->json(array(
   			'usuarios' => $usuarios,
    		'status' => 'success'
   		), 200);
    }

    public function show($id){

        $usuario = User::find($id);
        
        if(is_object($usuario)){
            $usuario = User::find($id)->load('rol');
            return response()->json(array(
                'usuario' => $usuario,
                'status' => 'success'
            ), 200);
        }else{
            return response()->json(array(
                'message' => 'Usuario no existente',
                'usuario' => $usuario,
                'status' => 'error'
            ), 200);
        }
    }

    public function store(Request $request){

    }

    public function update($id, Request $request){

    }

    public function destroy($id, Request $request){
    	
    }

    public function login(Request $request){
    	//recibir por post
        $json = $request->input('json', null); //almacena lo que llega por json
        $params = json_decode($json); //almacena los parametros decodificando el json

        $email = (!is_null($json) && isset($params->email)) ? $params->email : null;
        $password = (!is_null($json) && isset($params->password)) ? $params->password : null;

        //cifrar pwd
        $pwd = hash('sha256', $password);

        if(!is_null($email) && !is_null($password)){
        	$usuario = User::where('email', $email)->where('password', $pwd)->first();
        	if(is_object($usuario)){
        		$signup = array('status' => 'success', 'message' => 'Usuario identificado correctamente');
        	}else{
        		$signup = array('status' => 'error', 'message' => 'email/contraseña no corresponden');
        	}
        }else{
            $signup = array('status' => 'error', 'message' => 'Datos insuficientes para logear al usuario');
        }

        return response()->json($signup, 200);
    }
}
