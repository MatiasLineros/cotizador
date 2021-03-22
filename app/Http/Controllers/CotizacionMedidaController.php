<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Roller;
use App\CortinaPredefinida;
use App\Color;
use App\Medida;

class CotizacionMedidaController extends Controller
{
    public function create(){
		//y mandar solo los q estan vinculado a las cortinas predefinidas
		$rollers = Roller::join('cortinas_predefinidas', 'cortinas_predefinidas.roller_id', '=', 'rollers.id')
                         ->groupBy('rollers.id', 'rollers.tipo')
						 ->get(['rollers.id', 'rollers.tipo']);

        $cortinas_predefinidas = CortinaPredefinida::all();
        $colores = Color::all();
        $medidas = Medida::all();

        return response()->json(array(
            'rollers' => $rollers,
            'colores' => $colores,
            'medidas' => $medidas,
            'cortinas_predefinidas' => $cortinas_predefinidas,
            'status' => 'success'
        ), 200);
        
	}
}
