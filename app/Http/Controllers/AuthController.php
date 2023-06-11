<?php

namespace Timetabler\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

use Timetabler\Accesstoken;
use Timetabler\User;
use Timetabler\Mail\resetPassword;

use Image;


class AuthController extends Controller
{
    public function index(){
        return view('auth.login');
    }

    public function login(Request $request){
        $this->validate($request, [
            'username'=> 'required',
            'password'=> 'required'
        ]);

        $credentials = [
            'username'=> $request->username,
            'password'=> $request->password
        ];

        if(Auth::guard('user')->attempt($credentials)){
            return redirect(url('schools'));
        }

        if(Auth::guard('lecturer')->attempt($credentials)){
            return redirect(url('units'));
        }


        return back()->withErrors(['error'=> "Invalid credentials"]);
    }
    
    public function profile(Request $request)
    {
        # code...
        if($request->hasFile("avatar")){
            
            // return  $request->fullName;
            
            $avatar = $request->file("avatar");
            
            $file_name = time().".".$avatar->getClientOriginalExtension();
            
            Image::make($avatar)->resize(300, 300)->save(public_path("/uploads/".$file_name));
            
            $user = Auth::user();
            $user->avatar = $file_name;
            $user->name = $request->fullName;
            $user->email = $request->email;
            
            $user->save();
            
        }
        
        return back();
    }

    public function admin(){

        return view('home');
    }

    public function logout(){
        Auth::logout();

        Session::forget("first_name");
        Session::forget("last_name");
        Session::forget("name");
        Session::forget("depart_name");

        return redirect(url('login'));
    }
    
    public function forgotPassword()
    {
       return view('auth.forgotpassword');
    }
    
    public function genAccessToken(Request $request)
    {
        //check if email exists in our db;
        
        $userAcc = User::where("email",$request->email)->get("id");
    
        $token = (string) Str::uuid();
        // bcrypt("Reset".rand(1000,9999));
        
        
        if($userAcc->count() > 0){
            
            $access_token = Accesstoken::updateOrCreate(["user_id" => $userAcc[0]->id],["user_id" => $userAcc[0]->id, "token" => $token]);
            // return ($access_token->token);
            
            $this->emailReset($request->email, $access_token->token);
            return view("auth.forgotpassword")->with("emailResetSuccess","Password Recovery, Email sent Successfully. Please check your email adress.");    
            
        }else{
            return view("auth.forgotpassword")->with("emailResetFailure","The email address you entered does not exist");   
        }
    }
    
    public function emailReset($email,  $access_token)
    {
        
        $confirmation_url = "http://127.0.0.1:8000/token/".$access_token;
        
        $details = [
            'title' => 'Kabarak Timetabing Password Reset',
            'body' => 'Please click on the button below to reset your password. The session will expire after 1hr' ,
            "confirmation_url" => $confirmation_url,
        ]; 
        
          
        Mail::to($email)->send(new resetPassword($details));
    }
    
    public function confirm(Request $request)
    {
        // return $request->any;
        $acctoken = $request->any;
        $acc = Accesstoken::where("token",$acctoken)->get();
        
        $userid = $acc[0]->id;
        $accuser = Accesstoken::find($userid);
        
        $user_details = [
            "user-id" => $userid,
        ];
        
        return view('auth.resetPassword', compact("userid", "acctoken"));
    }
    
    public function passReset(Request $request)
    {
        
        $request->validate([
            'userId' => 'required',
            'password' => 'required|min:6',
            'confirmedpassword' => 'required|min:6'
        ]);
        
        // $url = "http://127.0.0.1:8000/token/"
        // return $request->password;
        
        if($request->password != $request->confirmedpassword){
            Session::flash("passnotmatch","Password are not equal, please try again."); 
            return redirect("token/".$request->acctoken);
        }
        
        // return $request->password;
        
        User::where("id",$request->userId)->update(["password" => Hash::make($request->password)]);
        
        return redirect("login");
    }
    
}
