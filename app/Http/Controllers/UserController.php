<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Traits\MeatSum;

use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{

    use MeatSum;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function index()
    // {
    //     //
    // }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $attributes = request()->all();

        // dd($attributes);
        $pre_hash = $attributes['password'];
        $attributes['password'] = Hash::make($attributes['password']);

        
        $user = User::create($attributes);

        return redirect($user->path());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        // The over all seasons total summed and sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $user_boar_total                = $this->sumMeatWrapper('Vildsvin', 'total');
        $user_moose_total               = $this->sumMeatWrapper('Älg', 'total');
        $user_reddeer_total             = $this->sumMeatWrapper('Kronvilt', 'total');
        $user_fallowdeer_total          = $this->sumMeatWrapper('Dovvilt', 'total');
        $user_roedeer_total             = $this->sumMeatWrapper('Rådjur', 'total');

        // The over all seasons average sorted list of users shared_kilograms; ['user_id'] => sum (float)
        $year_back = 7; // antalet år bakåt medelvärdet skall räknas på.
        $user_boar_average              = $this->sumMeatWrapper('Vildsvin', 'average', $year_back);
        $user_moose_average             = $this->sumMeatWrapper('Älg', 'average', $year_back);
        $user_reddeer_average           = $this->sumMeatWrapper('Kronvilt', 'average', $year_back);
        $user_fallowdeer_average        = $this->sumMeatWrapper('Dovvilt', 'average', $year_back);
        $user_roedeer_average           = $this->sumMeatWrapper('Rådjur', 'average', $year_back);

        // filtrerar ut enbart användarens värden av totalen
        $user_boar_total = array_filter($user_boar_total, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_boar_total = array_pop($user_boar_total);

        $user_moose_total = array_filter($user_moose_total, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_moose_total = array_pop($user_moose_total);

        $user_reddeer_total = array_filter($user_reddeer_total, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_reddeer_total = array_pop($user_reddeer_total);

        $user_fallowdeer_total = array_filter($user_fallowdeer_total, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_fallowdeer_total = array_pop($user_fallowdeer_total);

        $user_roedeer_total = array_filter($user_roedeer_total, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_roedeer_total = array_pop($user_roedeer_total);


        // filtrerar ut enbart användarens värden av snittet
        $user_boar_average = array_filter($user_boar_average, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_boar_average = array_pop($user_boar_average);

        $user_moose_average = array_filter($user_moose_average, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_moose_average = array_pop($user_moose_average);

        $user_reddeer_average = array_filter($user_reddeer_average, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_reddeer_average = array_pop($user_reddeer_average);

        $user_fallowdeer_average = array_filter($user_fallowdeer_average, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_fallowdeer_average = array_pop($user_fallowdeer_average);
        
        $user_roedeer_average = array_filter($user_roedeer_average, function ($value) {
            return $value['id']== auth()->user()->id;
        });
        $user_roedeer_average = array_pop($user_roedeer_average);
        

        
        $data = [
            'avatar'                        => isset(auth()->user()->avatar) ? auth()->user()->avatar : false,
            'killreports'                   => $user->associated_killreports(),
            'meat_moose_average'            => $user_moose_average,
            'meat_reddeer_average'          => $user_reddeer_average,
            'meat_fallowdeer_average'       => $user_fallowdeer_average,
            'meat_roedeer_average'          => $user_roedeer_average,
            'meat_boar_average'             => $user_boar_average,
            'meat_moose_total'              => $user_moose_total,
            'meat_reddeer_total'            => $user_reddeer_total,
            'meat_fallowdeer_total'         => $user_fallowdeer_total,
            'meat_roedeer_total'            => $user_roedeer_total,
            'meat_boar_total'               => $user_boar_total,
        ];

        return view('users.show', $data);
    }

    /**
     * Show users killreports associated with him/her
     * 
     * @param \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function killreports(User $user)
    {
        $data = [
            'killreports'   => $user->associated_killreports()->sortByDesc('killdate')
        ];

        return view('users.killreports', $data);


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    // public function edit(User $user)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        // dd('$user->id: '.$user->id.' Auth::user()->id: '.Auth::user()->id);
        if($user->id == Auth::user()->id || Auth::user()->role == 'admin') {
            $attributes = request()->all();
        

            // dd($attributes);
            if(request()->exists('password')){
                $pre_hash = $attributes['password'];
                $attributes['password'] = Hash::make($attributes['password']);

            
            }
            // dd($attributes);

            $user->update($attributes);
        }
        

        // return redirect($user->path());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    // public function destroy(User $user)
    // {
    //     //
    // }

    public function resetlink()
    {
        return view('auth.passwords.email');
    }
}
