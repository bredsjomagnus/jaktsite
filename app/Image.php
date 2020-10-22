<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Killreport;
use App\User;

class Image extends Model
{
    protected $guarded = [];

    public function killreport()
    {
        return $this->belongsTo(Killreport::class, 'killreport_id');
    }

    public function hunter()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
