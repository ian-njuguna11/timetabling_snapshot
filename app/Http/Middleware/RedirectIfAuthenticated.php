<?php

namespace Timetabler\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        // if (Auth::guard($guard)->check()) {
        //     return redirect('/home');
        // }

        switch ($guard){
            case 'hods':
                if(Auth::guard($guard)->check()){
                    return redirect('hods');
                    // ->route('hods');
                }
            break;

            default:
                if (Auth::guard($guard)->check()) {
                    return redirect('/home');
                }
        }

        return $next($request);

    


    }
}
