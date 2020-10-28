<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use App\Killreport;

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
        return $this->hasMany(Killreport::class, 'shooter_id')->latest('created_at');
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

    public function get_name()
    {
        return $this->firstname." ".$this->lastname;
    }
}
