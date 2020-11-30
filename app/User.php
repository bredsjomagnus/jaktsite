<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use App\Killreport;
use App\Avatar;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    // protected $fillable = [
    //     'name', 'email', 'password',
    // ];

    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function path()
    {
        return 'user/'.$this->id;
    }

    public function killreports_shooter()
    {
        return $this->hasMany(Killreport::class, 'shooter_id')->where('deleted_at', NULL)->latest('created_at');
    }

    public function killreports_authored()
    {
        return $this->hasMany(Killreport::class, 'reporter_id')->latest('created_at');
    }

    public function animals()
    {
        return $this->hasMany(Animal::class, 'shooter_id')->latest('created_at');
    }

    public function is_admin()
    {
        return $this->role == 'admin';
    }

    public function images()
    {
        return $this->hasMany(Image::class);
    }

    public function avatar()
    {
        return $this->hasOne(Avatar::class);
    }

    public function avatar_path()
    {
        if(isset($this->avatar))
            return asset("storage/".$this->avatar->path).'/i'.$this->avatar->id.'_u'.$this->id.'_'.$this->avatar->name;
        else{
            return false;
        }
    }

    public function get_name()
    {
        return $this->firstname." ".$this->lastname;
    }

    /**
     * Get all killreports where user was allocated meat
     * 
     * @return Collection Killreports
     */
    public function meat()
    {
        $killreports = Killreport::all();
        return $killreports->filter(function ($value) {
                $found = false;
                foreach($value->meat as $meat) {
                    if($meat->user_id == $this->id) {
                        $found = true;
                    }
                }
                return $found;
                
            });
    }

    /**
     * Get a users associated killreports
     * 
     * @return Collection killreports
     */
    public function associated_killreports()
    {
        $killreports = $this->killreports_shooter->merge($this->meat());

        return $killreports->unique();
    }
}
