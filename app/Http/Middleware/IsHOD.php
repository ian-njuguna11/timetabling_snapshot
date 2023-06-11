<?php

namespace Timetabler\Http\Middleware;

use Closure;

class IsHOD
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
    
        if(auth()->user()->role == "1"){
            return $next($request);
        }
        
        return redirect("login")->with("error","You don't have admin access.");  
    }
}
