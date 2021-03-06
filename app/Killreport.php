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

    /**
     * Sätter rätt status för rapporten
     */
    public function set_status()
    {
        // Status Gul om inte djurklassificering är satt
        if($this->animal()->speciestype == 'unknown') {
            $this->report_status = 'yellow';
        }

        // Status Gul om inte skytt satt
        if($this->shooter->occupation == 'anonhunter') {
            $this->report_status = 'yellow';
        }

        
        // Status Gul om det saknas slaktvikt eller uppskattad slaktvikt
        if(is_null($this->animal()->carcass_weight) && is_null($this->animal()->aprox_carcass_weight)) {
            $this->report_status = 'yellow';
        }

        // För Småris gäller att även köttet måste vara tilldelat annars status gul
        if($this->area()->area_name == 'Småris') {
            // Status Gul om köttilldelningen är EJ SATT    
            if(count($this->meat) == 1) {
                if(is_null($this->meat[0]->user_id)) {
                    $this->report_status = 'yellow';
                }
            }
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
