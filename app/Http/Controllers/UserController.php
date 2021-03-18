<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\User;
use App\Rol;

class UserController extends Controller
{
   	public function index(){
    	
    	$usuarios = User::join('roles', 'roles.id', '=', 'users.role_id')->where('users.estado', 'Activo')->get(['users.id', 'name', 'email', 'nombre']);

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
            ), 300);
        }
    }

    public function create(){

        //identificar si el usuario existe y si tiene permiso

        //datos para cargar el formulario
        $roles = Rol::all();

        return response()->json(array(
            'roles' => $roles,
            'status' => 'success'
        ), 200);        
    }

    public function store(Request $request){
        //recoger datos por post
        $json = $request->input('json', null); //guarda json q viene por request
        $params = json_decode($json); //guarda parametros
        $params_array = json_decode($json, true); //guarda parametros en array
        
        //identificar usuario
        //validar que tenga permiso para realizar esta petición

        //validacion
        $validate = \Validator::make($params_array, [ //validator es eficaz para la validacion en una api
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
            'role_id' => 'required|numeric|exists:roles,id',
        ]);
        
        if($validate->fails()){
            $errores = $validate->errors();

            return response()->json(array(
                'errores' => $errores,
                'status' => 'error'
            ), 200);  
        }

        //guardar usuario
        $usuario = new User();
        $usuario->name = $params->name;
        $usuario->email = $params->email;
        $usuario->password = hash('sha256', $params->password);
        $usuario->role_id = $params->role_id;
        $usuario->estado = 'Activo';
        $usuario->save();

        $data = array(
            'usuario' => $usuario,
            'status' => 'success',
            'code' => 200,
        );

        return response()->json($data, 200);
    }

    public function edit($id){
        //identificar si el usuario existe y si tiene permiso

        //datos para cargar el formulario
        $roles = Rol::all();
        $usuario = User::join('roles', 'roles.id', '=', 'users.role_id')->where('users.id', $id)->get(['users.id', 'name', 'email', 'nombre', 'estado', 'role_id', 'nombre']);

        if(!$usuario->isEmpty()){
            return response()->json(array(
                'roles' => $roles,
                'usuario' => $usuario,
                'status' => 'success'
            ), 200);  
        }else{
            return response()->json(array(
                'message' => 'Usuario no existe',
                'status' => 'error'
            ), 300);  
        }  
    }

    public function update($id, Request $request){
        
        //identificar si el usuario existe y si tiene permiso

        $usuario = User::find($id);

        if(!is_object($usuario)){
            return response()->json(array(
                'message' => 'Usuario no existente',
                'status' => 'error'
            ), 300);
        }

        $json = $request->input('json', null);
        $params = json_decode($json);
        $params_array = json_decode($json, true);

        //validacion
        $validate = \Validator::make($params_array, [ //validator es eficaz para la validacion en una api
            'name' => 'required',
            'email' => [
                        'required',
                        Rule::unique('users')->ignore($usuario->id),
                       ],
            'password' => 'required',
            'role_id' => 'required|numeric|exists:roles,id',
            'estado' => 'required',
        ]);
        
        if($validate->fails()){
            $errores = $validate->errors();

            return response()->json(array(
                'errores' => $errores,
                'status' => 'error'
            ), 200);  
        }

        $usuario->name = $params->name;
        $usuario->email = $params->email;
        if(isset($params->password)){
            $usuario->password = hash('sha256', $params->password);
        }
        $usuario->role_id = $params->role_id;
        $usuario->estado = $params->estado;
        $usuario->update();

        $data = array(
            'usuario' => $usuario,
            'status' => 'success',
            'code' => 200,
        );

        return response()->json($data, 200);
    }

    public function destroy($id, Request $request){
    	//identificar usuario
        //validar que tenga permiso para realizar esta petición
        
        $usuario = User::find($id);
        //comprobar que exista
        if(is_object($usuario)){
            //borrarlo
            $usuario->estado = 'Inactivo';
            $usuario->update();

            //devolverlo
            $data = array(
                'usuario' => $usuario,
                'status' => 'success',
                'code' => 200,
            );
        }else{
            //devolverlo
            $data = array(
                'message' => 'El usuario no existe',
                'status' => 'error',
                'code' => 300,
            );
        }
          
        return response()->json($data, 200);
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
        	if(is_object($usuario) && ($usuario->estado == 'Activo')){
                $signup = array('status' => 'success', 'message' => 'Usuario identificado correctamente');
            }elseif (is_object($usuario) && ($usuario->estado != 'Activo')) {
                $signup = array('status' => 'error', 'message' => 'Usuario desvinculado del sistema');
            }else{
                $signup = array('status' => 'error', 'message' => 'email/contraseña no corresponden');
            }
        }else{
            $signup = array('status' => 'error', 'message' => 'Datos insuficientes para logear al usuario');
        }

        return response()->json($signup, 200);
    }
}
