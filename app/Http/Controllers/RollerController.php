<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Roller;

class RollerController extends Controller
{
    public function show($id){
    	$roller =  Roller::find($id);
    	if(is_object($roller)){
    		return response()->json(array(
	            'roller' => $roller,
	            'status' => 'success'
        	), 200);
    	}else{
    		return response()->json(array(
	            'message' => "Roller no existe",
	            'status' => 'error'
        	), 300);
    	}
    }
}
