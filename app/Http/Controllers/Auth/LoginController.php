<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = '/home';



    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function redirectTo()
    {
        return auth()->user()->path();
    }

    public function username()
    {
        return 'username';
    }

    /**
     * Get the needed authorization credentials from the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected function credentials(\Illuminate\Http\Request $request)
    {
        //return $request->only($this->username(), 'password');


        return ['username' => $request->{$this->username()}, 'password' => $request->password, 'active' => 'yes'];

        
    }

    // public function authenticate(Request $request)
    // {
    //     $credentials = $request->only('username', 'password', 'active');

    //     dd($credentials);

    //     if (Auth::attempt(['username' => $credentials['usename'], 'password' => $credentials['password']]) && $credentials['active'] == 'yes') {
    //         // Authentication passed...
    //         return redirect()->intended('dashboard');
    //     }
    // }

 
}
