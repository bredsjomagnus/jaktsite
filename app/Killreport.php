<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

use App\User;
use App\Animal;
use App\Area;
use App\Meat;
use App\Image;

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

    public function path()
    {
        return "killreports/".$this->id;
    }

    public function meat()
    {
        return $this->hasMany(Meat::class);
    }

    public function images()
    {
        return $this->hasMany(Image::class)->orderBy('created_at', 'desc');
    }

    public function display_image()
    {
        $image = Image::where('killreport_id', $this->id)->where('display', 'yes')->first();
        if( $image ) {
            return $image;
        } else {
            return 'default_display.jpg';
        }
    }

    public function display_path()
    {
        if( $this->display_image() == 'default_display.jpg' ) {
            return asset('storage/images/killreports/default_display.jpg');
        } else {
            return $this->display_image()->storage_path();
        }
        
    }

    public static function boot ()
    {
        parent::boot();


        static::deleting(function($killreport) {
            Animal::find($killreport->animal_id)->delete();
            foreach($killreport->meat as $meat) {
                $meat->delete();
            }
            foreach($killreport->images as $image) {
                $image->delete();
                
                $name = 'k'.$image->killreport_id.'_i'.$image->id.'_u'.$image->user_id.'_'.$image->name;
                Storage::disk('local')->delete('public/images/killreports/'.$name);
            }
        });
    }
}
