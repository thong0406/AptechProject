<?php

namespace App\Http\Controllers\bakery;

use App\Http\Controllers\Controller;
use App\Models\Users;
use App\Models\Books;
use App\Models\Orders;
use App\Models\Order_details;
use App\Models\Book_tags;
use App\Models\Tags;
use App\Models\Comments;
use App\Models\Bookstores;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class DetailsController extends Controller
{
    public function details(Request $request, $id){
        $books = Books::where('id' , '=' , $id)->get();

        $stars = 5;
        $book_tags = [];
        foreach ($books as $key => $value) {
        	$bookstores = Bookstores::where("id" , "=" , $value['bookstore_id'])->get();
    		$books[$key]['bookstore_name'] = $bookstores[0]['bookstore_name'];
            $arr = Book_tags::where('book_id' , '=' , $value['id'])->get();
            foreach ($arr as $key => $tag) {
                $tag_arr = Tags::where('id' , '=' , $tag['tag_id'])->get();
                $book_tags[] = [
                    'id'=>$tag['id'] , 
                    'tag_name'=>$tag_arr[0]['tag_name']
                ];
            }
        }

    	$comments_arr = Comments::where('book_id' , '=' , $books[0]['id'])->get();
        $stars = 5;
        $comments = [];
        foreach ($comments_arr as $key => $comment) {
            $stars += $comment['rating'];
        }
        $stars = round($stars/(count($comments_arr)+1));
        $books[0]['stars'] = $stars;

        foreach ($comments_arr as $key => $value) {
        	$users = Users::where('id' , '=' , $value['user_id'])->get();
        	foreach ($users as $user_key => $user) {
        		$comments[] = [
        			'name' => $user['name'] ,
                    'username' => $user['username'] ,
        			'image' => $user['image'] ,
        			'comment' => $value['comment'] ,
        			'stars' => $value['rating'] ,
        			'date' => $value['created_at']
        		];
        	}
        }

        /*
        echo '<pre>';
        print_r($comments);
        echo '</pre>';
        */
        

        return view('bakery.Details.bookdetail' , compact('books' , 'book_tags' , 'comments'));
    }

    public function add_cart(Request $request, $id) {
        if (!$request->session()->has('cart')) {
            $request->session()->put('cart' , []);
        }

        $this->validate($request , [
            'quantity'=>'required'
        ]);

        $books = Books::where('id' , '=' , $id)->get();
        Books::where('id' , '=' , $id)->update([
            'quantity'=>$books[0]['quantity'] - $request->quantity
        ]);
        $arr = $request->session()->get('cart');
        $bookstore = Bookstores::where('id' , '=' , $books[0]['bookstore_id'])->get();

        if (!isset($arr[$id])) {
            $arr[$id] = [
                'id'=>$id ,
                'book_id'=>$books[0]['id'] ,
                'book_name'=>$books[0]['book_name'] ,
                'author'=>$books[0]['author'] ,
                'image'=>$books[0]['image'] , 
                'quantity'=>$request->quantity ,
                'price'=>$books[0]['price'] ,
                'bookstore_name'=>$bookstore[0]['bookstore_name'] ,
                'books_stock'=>$books[0]['quantity']
            ];
        }
        else {
            $arr[$id] = [
                'id'=>$id ,
                'book_id'=>$books[0]['id'] ,
                'book_name'=>$books[0]['book_name'] ,
                'author'=>$books[0]['author'] ,
                'image'=>$books[0]['image'] , 
                'quantity'=>$arr[$id]['quantity'] + $request->quantity ,
                'price'=>$books[0]['price'] ,
                'bookstore_name'=>$bookstore[0]['bookstore_name'] ,
                'books_stock'=>$books[0]['quantity']
            ];
        }

        $request->session()->put('cart' , $arr);

        return redirect()->route('cart')->with('success' , 'Added successfully');
    }

    public function order_now (Request $request , $id) {
        $this->validate($request , [
            'name'=>'required' ,
            'phonenumber'=>'required' ,
            'email'=>'required' ,
            'address'=>'required' ,
            'amount'=>'required'
        ]);
        $books = Books::where('id' , '=' , $id)->get();
        Books::where('id' , '=' , $id)->update([
            'quantity'=>$books[0]['quantity'] - $request->amount
        ]);
        $user_details = $request->session()->get('user_details');
        $order = Orders::create([
            'user_id'=>$user_details->id ,
            'cus_name'=>$request->name ,
            'address'=>$request->address ,
            'phone'=>$request->phonenumber ,
            'email'=>$request->email ,
            'payment'=> $request->amount * $books[0]['price'] ,  
            'status'=>'0'
        ]);
        Order_details::create([
            'order_id'=>$order->id ,
            'book_id'=>$id ,
            'quantity'=>$request->amount ,
            'price'=>$books[0]['price'] * $request->amount
        ]);
        return redirect()->route('book_details' , $id)->with('success' , 'Bought successfully');
    }

    public function create_comment (Request $request , $id) {
        $this->validate($request , [
            'star'=>'required' ,
            'comment'=>'required'
        ]);

        $user = $request->session()->get('user_details');

        Comments::create([
            'book_id' => $id,
            'user_id' => $user->id ,
            'comment' => $request->comment ,
            'rating' => $request->star
        ]);
        return redirect()->route('book_details' , $id);
    }
}