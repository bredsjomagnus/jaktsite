<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\Auth;

use Closure;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(auth()->user() === null) {
            // return redirect('home');
            return edirect('welcome');
        }
        if(!auth()->user()->is_admin()){
            // return redirect('home');
            return auth()->user()->path();
        }
   
        return $next($request);
    }
}
