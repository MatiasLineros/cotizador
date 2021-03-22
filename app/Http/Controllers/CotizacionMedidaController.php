<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Roller;

class CotizacionMedidaController extends Controller
{
    public function create(){
		//y mandar solo los q estan vinculado a las cortinas predefinidas
		$rollers = Roller::join('cortinas_predefinidas', 'cortinas_predefinidas.roller_id', '=', 'rollers.id')
                         ->groupBy('rollers.id', 'rollers.tipo')
						 ->get(['rollers.id', 'rollers.tipo']);

        return response()->json(array(
            'rollers' => $rollers,
            'status' => 'success'
        ), 200);
        
	}
}
