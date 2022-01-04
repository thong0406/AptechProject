<?php

namespace App\Http\Controllers\account;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Users;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function signin()
    {
        return view('loginform.view.signin');
    }
    public function signup()
    {
        return view('loginform.view.signup');
    }
    public function auth_user (Request $request)
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required'
        ]);
        $credentials = $request->only('username', 'password');
        if (Auth::attempt($credentials)) {
                // Đổi thành Route home nếu có
            return redirect()->route('home')->with('success','Signed in');
        }
    }
    public function create_user (Request $request)
    {
        $this->validate($request , [
            'name' => 'required',
            'username'=> 'required',
            'phone' => 'required',
            'email' => 'required|unique:users|email',
            'address' => 'required',
            'pass' => 'required|min:6|max:32',
            're-pass' => 'same:pass',
        ] , 
        [
            'required' => 'Please fill in your :attribute.'
        ]);

        Users::create([
            'username' => $request->username,
            'password' => bcrypt($request->pass),
            'name' => $request->name,
            'address' => $request->address,
            'phone' => $request->phone,
            'email' => $request->email
        ]);

        return redirect()->route('home');
    }
}
