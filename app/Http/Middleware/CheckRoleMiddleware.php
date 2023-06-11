<?php

namespace Timetabler\Http\Middleware;

use Closure;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Timetabler\department;
use Timetabler\Lectures;

class CheckRoleMiddleware
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

            if (Auth::user()->role == "1") {
                    
                return "admin";
            // $user_name = Auth::user()->name;

            // $request->session()->put('name',$user_name);
        //            $request->session()->put('last_name',  $user[0]->last_name);

                // return view('home')->with(session('name'));
            } elseif (Auth::user()->role == "2") {
                $user_name = Auth::user()->name;

                $request->session()->put('name',$user_name);

                return view('home')->with(session('name'));
            } elseif (Auth::user()->role == "4") {
                $user = Lectures::where('email',Auth::user()->email)->get();
                
                // return $user;
                            
                $request->session()->put('first_name',  $user[0]->first_name);
                $request->session()->put('last_name',  $user[0]->last_name);
                
                return view('lecturers.lecturers')
                ->with(session('first_name','last_name'));

            } elseif (Auth::user()->role == "5") {
                $is_HOD = Lectures::where('email', Auth::user()->email)->get("is_HOD");

                if ($is_HOD[0]->is_HOD == "1") {
                    $dpt_id = Lectures::where('email', Auth::user()->email)->get("deparment_ID");
                    $spec_dpt_id = Crypt::encryptString($dpt_id[0]->deparment_ID);

                    $dpt_obj = department::where('id', $dpt_id[0]->deparment_ID)->get();
                    $dptName = $dpt_obj[0]->name;

                    $user = Lectures::where('email',Auth::user()->email)->get();
                    $f_name = $user[0]->first_name;

                    $request->session()->put('first_name',$f_name);
                    $request->session()->put('last_name',  $user[0]->last_name);

                    $request->session()->put('hods', $spec_dpt_id);
                    $request->session()->put('depart_name', $dptName);


                    return view('hod')
                        ->with(session('hods', 'depart_name'))
                        ->with(session('first_name','last_name'));

                }else{
            //                return back()->with('hod_login', 'Something went wrong please try again');
                    $user = Lectures::where('email',Auth::user()->email)->get();
                                
                    // return $user;
                                
                    $request->session()->put('first_name',  $user[0]->first_name);
                    $request->session()->put('last_name',  $user[0]->last_name);

                    return view('lecturers.lecturers')
                    ->with(session('first_name','last_name'));
                }
            }
            
        return redirect('login')->with('error','You have not admin access');
    }
}
