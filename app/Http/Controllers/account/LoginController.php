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
    public function postLogin(Request $request)
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required'
        ]);
        $credentials = $request->only('username', 'password');
        if (Auth::attempt($credentials)) {
                // Đổi thành Route home nếu có
            return redirect()->route('cart')->with('success','Signed in');
        }
    }
    public function new_user (Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'username'=> 'required',
            'phone' => 'required',
            'email' => 'required|unique:users|email',
            'address' => 'required',
            'password' => 'required|min:6|max:32',
            'confirm' => 'same:password',
        ] , 
        [
            'required' => 'Please fill in your :attribute.' ,
            'same' => 'Password is re-enterd incorectly.'
        ]);

        Users::create([
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'name' => $request->name,
            'address' => $request->address,
            'phone' => $request->phone,
            'email' => $request->email //Hash::make($request->password)
        ]);

            // Đổi thành Route home nếu có
        return redirect()->route('cart')->with('success', 'Created successfully');
    }
}
