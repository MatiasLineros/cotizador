<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Medida extends Model
{
	protected $table = 'medidas';

	public function rollerMedida(){
        return $this->hasMany('App\RollerMedida');
    }
}
