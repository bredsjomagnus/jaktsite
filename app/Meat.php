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
}
