<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
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
        // dd("user->id: ".$user->id.", auth()->user()->id: ".auth()->user()->id);
        // $this->authorize('update', $user);
        // if($user->id !== auth()->user()->id && !auth()->user()->is_admin()){
        //     return redirect('home');
        // }
        
        $data = [
            'avatar'    => isset(auth()->user()->avatar) ? auth()->user()->avatar : false
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
            'killreports'   => $user->associated_killreports()
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
