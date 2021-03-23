<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CortinaPredefinida;
use App\Color;

class CortinaPredefinidaController extends Controller
{
    public function cortinasSegunRoller($roller_id){
    	$cortinas = CortinaPredefinida::join('medidas', 'medidas.id', '=', 'cortinas_predefinidas.medida_id')
    				->where('cortinas_predefinidas.roller_id', $roller_id)->get();

    	$colores = Color::join('colores_rollers_predefinidos', 'colores_rollers_predefinidos.color_id', '=', 'colores.id')->where('colores_rollers_predefinidos.roller_id', $roller_id)
                         ->groupBy('colores.id', 'colores.color')
                         ->get(['colores.id', 'colores.color']);

    	if(!$cortinas->isEmpty() && !$colores->isEmpty()){
	    	return response()->json(array(
		        'cortinas' => $cortinas,
		        'colores' => $colores,
		        'status' => 'success'
	        ), 200);
	    }else{
	    	return response()->json(array(
		        'message' => 'Roller no existe',
		        'status' => 'success'
	        ), 300);
	    }
    }
}
