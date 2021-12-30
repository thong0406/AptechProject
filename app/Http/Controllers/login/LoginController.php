<?php

namespace App\Http\Controllers\login;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function signup()
    {
        return view('loginform.view.signup');
    }

    public function auth_user()
    {
        return view('loginform.view.signup');
    }
}
