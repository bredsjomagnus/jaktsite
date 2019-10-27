<?php

namespace App;

use App\Killreport;

use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{
    protected $guarded = [];

    public function shooter()
    {
        return $this->belongsTo(User::class, 'shooter_id');
    }

    public function killreport()
    {
        return Killreport::where('animal_id', $this->id)->first();
    }

}
