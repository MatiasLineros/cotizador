<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CortinaPredefinida extends Model
{
    protected $table = 'cortinas_predefinidas';

    public function roller(){
        return $this->belongsTo('App\Roller', 'roller_id');
    }

    public function medida(){
        return $this->belongsTo('App\Medida', 'medida_id');
    }

    public function color(){
        return $this->belongsTo('App\Color', 'color_id');
    }
}
