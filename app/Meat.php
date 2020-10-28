<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Killreport;
use App\User;

class Meat extends Model
{
    protected $guarded = [];

    public function killreport()
    {
        return $this->belongsTo(Killreport::class);
    }

    public function hunter()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function animal()
    {
        return $this->killreport->animal();
    }

    public function path()
    {
        return 'meat/'.$this->killreport_id;
    }

    public function isSpecies($value)
    {
        return $this->animal()->getAttributes()['species'] == $value;
    }

    public function season()
    {
        return $this->killreport->season;
    }

    public function get_users_name()
    {
        return $this->hunter->get_name();
    }
}
