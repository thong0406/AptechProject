<?php

namespace App\Http\Controllers\bakery;

use App\Http\Controllers\Controller;
use App\Models\Books;
use App\Models\Comments;
use App\Models\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function home(Request $request)
    {
        $books = Books::all()->take(12);
        foreach ($books as $key => $value) {
            $comments = Comments::where('book_id' , '=' , $value['id'])->get();
            $stars = 5;
            foreach ($comments as $key2 => $comment) {
                $stars += $comment['rating'];
            }
            $stars = round($stars/(count($comments)+1));
            $books[$key]['stars'] = $stars;
        }
        return view('bakery.test.demo' , compact('books'));
    }
    public function admin()
    {
        return view('admin.demo.test');
    }

    public function details ($id) {
        $book = Books::find($id)->get();
        return view('bakery.Details.bookdetail');
    }

    public function user_settings (Request $request) {
        /*
        echo "<pre>";
        print_r(Users::where('id' , '=' , $request->session()->get('user_details')->id)->get());
        print_r($request->session()->get('user_details'));
        echo "</pre>";
        */
        
        return view('bakery.test.edit_profile');
    }

    public function user_update_image (Request $request) {
        $this->validate($request , [
            'image'=>'required'
        ]);

        $image = $request->file('image');
        $name = basename($request->session()->get('user_details')->image);
        $store = $image->move('img/pfp', $name);
        $SQLstore = 'img/pfp/' . $name;

        Users::where('id' , '=' , $request->session()->get('user_details')->id)->update([
            'image'=>$SQLstore
        ]);

        $request->session()->put('user_details' , Auth::user());

        return redirect()->route('user_settings');
    }

    public function user_update_details (Request $request){
        $this->validate($request, [
            'name' => 'required',
            'username'=> 'required',
            'address'=> 'required',
            'phone' => 'required|max:10',
            'email' => 'required|unique:users|email'
        ] , 
        [
            'required' => 'Please fill in your :attribute.'
        ]);

        Users::where('id' , '=' , $request->session()->get('user_details')->id)->update([
            'name' => $request->name ,
            'username'=> $request->username ,
            'phone' => $request->phone ,
            'email' => $request->email ,
            'address' => $request->address
        ]);

        $request->session()->put('user_details' , Auth::user());

        return redirect()->route('user_settings');
    }
}
