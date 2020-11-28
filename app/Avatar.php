<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Avatar extends Model
{
    protected $guarded = [];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function prefix_and_name()
    {
        return 'i'.$this->id.'_u'.$this->user_id.'_'.$this->name;
    }

    public function storage_path()
    {
        return asset('storage/images/avatars').'/'.$this->prefix_and_name();
    }
}
