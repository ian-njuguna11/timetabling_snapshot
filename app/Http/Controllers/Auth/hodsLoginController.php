<?php

namespace Timetabler\Http\Controllers\Auth;

use Illuminate\Http\Request;
use Timetabler\Http\Controllers\Controller;
// use Illuminate\Facades\Auth;

use Timetabler\HOD;
use Timetabler\department;

// use Auth;
use Illuminate\Support\Facades\Auth;

class hodsLoginController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest:hods')->except('logout');
    }

    public function showLoginController(){
        return view('auth.hod-login');
    }

    public function login(Request $request){

        //validate the form data
        $this->validate($request,[
            'email' => 'required|email',
            'password' => 'required|min::6',
        ]);

        // Auth::gaurd('hods')->attempt(['email'=>$request->email,'password'=>$request->password],$remember)){}
        //Attempt to login the user
        if (Auth::guard('hods')->attempt(['email'=> $request->email,'password'=>$request->password],$request->remember)){
            //if success, redirect to intended location

            //include session here
            $get_HOD_ID = HOD::where('email',$request->email)->get();
            $cross_site_data = $get_HOD_ID[0]->deparment_ID;

            $dpt_obj = department::where('id',$cross_site_data)->get();
            $dptName = $dpt_obj[0]->name;

            $request->session()->put('hods',$cross_site_data);
            $request->session()->put('depart_name',$dptName);
//            return session('hods');
            return redirect('hods')->with(session('hods','depart_name'));
//                ->intended(url('/hods'));
        }

        //if unsuccessfull, redirect back with form data
        return back()->withInput($request->only('email','remember'));
    }

}
