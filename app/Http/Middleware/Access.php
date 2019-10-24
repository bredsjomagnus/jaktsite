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
        // if guest
        if(auth()->user() === null) {
            return redirect('home');
        }

        if($object === 'user') {
            // user id of object in route
            $router_user_id = $request->route()->parameter('user')->id;
        }
        
        if($key === 'admin') {
            if(!auth()->user()->is_admin()){
                return redirect('home');
            }
        } else if($key === 'both') {
            if($object === 'user') {
                if($router_user_id !== auth()->user()->id && !auth()->user()->is_admin()){
                    return redirect('home');
                }
            }
            
        } else if ($key === 'user') {
            if($object === 'user') {
                if($router_user_id !== auth()->user()->id){
                    return redirect('home');
                }
            }
            
        }

        return $next($request);
    }
}
