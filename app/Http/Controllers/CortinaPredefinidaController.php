<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CortinaPredefinida;

class CortinaPredefinidaController extends Controller
{
    public function cortinasSegunRoller($roller_id){
    	$cortinas = CortinaPredefinida::where('roller_id', $roller_id)->get();
    	if(!$cortinas->isEmpty()){
	    	return response()->json(array(
		        'cortinas' => $cortinas,
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
