<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\User;
use App\Animal;
use App\Area;

class Killreport extends Model
{
    protected $guarded = [];

    public function shooter()
    {
        return $this->belongsTo(User::class, 'shooter_id');
    }

    public function reporter()
    {
        return $this->belongsTo(User::class, 'reporter_id');
    }

    public function animal()
    {
        return Animal::find($this->animal_id);
    }

    public function area()
    {
        return Area::find($this->area_id);
    }
}
