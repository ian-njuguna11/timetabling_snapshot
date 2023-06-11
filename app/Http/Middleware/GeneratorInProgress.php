<?php

namespace Timetabler\Http\Middleware;

use Closure;
use Timetabler\Timetable;

class GeneratorInProgress
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
        $timetable = Timetable::with('days', 'days.periods', 'days.periods')
            ->get()->last();

        if($timetable && $timetable->in_progress){
            return redirect(url('timetable/progress'));
        }
        return $next($request);
    }
}
