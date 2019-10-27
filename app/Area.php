<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    protected $guarded = [];

    public function killreports()
    {
        return Killreport::where('area_id', $this->id)->get();
    }
}
