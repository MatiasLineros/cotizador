<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;

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
}
