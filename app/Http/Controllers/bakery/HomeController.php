<?php

namespace App\Http\Controllers\bakery;

use App\Http\Controllers\Controller;
use App\Models\Books;
use App\Models\Comments;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home()
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
}
