<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Medida extends Model
{
	protected $table = 'medidas';

	public function cortinasPredefinidas(){
        return $this->hasMany('App\CortinaPredefinida');
    }
}
