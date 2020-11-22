<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class Access
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $key='user', $object='none')
    {
        // if outsider
        if(auth()->user() === null) {
            return redirect('login');
        }

        // En role = 'guest' skall loggas ut och hänvisas tillbaka till loginsidan.
        if(auth()->user()->role == 'guest') {
            Auth::logout();
            return redirect('login');
        }

        // En inloggad användare som sätts som 'active' = 'no' kommer att loggas ut
        if(auth()->user()->active == 'no') {
            Auth::logout();
            return redirect('login');
        }

        if($object === 'user') {
            // user id of object in route
            $router_user_id = $request->route()->parameter('user')->id;
        }
        
        if($key === 'admin') {
            // Om det enbart är öppet för admin och user inte är admin
            if(!auth()->user()->is_admin()){
                return redirect('login');
            }
        } else if($key === 'both') {
            if($object === 'user') {
                // om det är öppet för admin OCH användare men är ingetdera
                if($router_user_id !== auth()->user()->id && !auth()->user()->is_admin()){
                    return redirect('login');
                }
            }
            
        } else if ($key === 'user') {
            if($object === 'user') {
                // om det är öppet för användare men inte är det
                if($router_user_id !== auth()->user()->id){
                    return redirect('login');
                }
            }
            
        }

        return $next($request);
    }
}
