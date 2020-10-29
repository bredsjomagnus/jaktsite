<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

use App\Killreport;
use App\User;

class Image extends Model
{
    protected $guarded = [];
    protected $casts = [
        'id'                => 'integer',
        'killreport_id'     => 'integer',
        'user_id'           => 'integer'
    ];

    public function killreport()
    {
        return $this->belongsTo(Killreport::class, 'killreport_id');
    }

    public function hunter()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function prefix_and_name()
    {
        return 'k'.$this->killreport_id.'_i'.$this->id.'_u'.$this->user_id.'_'.$this->name;
    }

    public function storage_path()
    {
        return asset('storage/images/killreports').'/'.$this->prefix_and_name();
    }
}
