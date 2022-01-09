<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Users;
use App\Models\Books;
use App\Models\Tags;
use App\Models\Book_tags;
use App\Models\Comments;
use App\Models\Orders;
use App\Models\Order_details;
use App\Models\Bookstores;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;

class admin_controller extends Controller
{
    public function admin(){
        return view('admin.demo.test');
    }

    	// Users
    public function admin_user_lists(){
    	$users = Users::all();
        return view('admin.demo.user_lists' , compact('users'));
    }
    public function admin_user_add(){
        return view('admin.demo.user_add');
    }

    public function admin_user_store(Request $request){
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
            'required' => 'Please fill in your :attribute.'
        ]);     

        Users::create([
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'name' => $request->name,
            'address' => $request->address,
            'phone' => $request->phone,
            'email' => $request->email //Hash::make($request->password)
        ]);

        return redirect()->route('admin_user_lists')->with('success', 'Created successfully');
    }
    public function admin_user_delete ($id){
    	Users::find($id)->delete();
        return redirect()->route('admin_bookstore_lists')->with('success', 'Created successfully');
    }





    	// Bookstores
    public function admin_bookstore_lists(){
    	$bookstores = Bookstores::all();
        return view('admin.demo.bookstore_lists' , compact('bookstores'));
    }
    public function admin_bookstore_add(){
        return view('admin.demo.bookstore_add');
    }

    public function admin_bookstore_store(Request $request){
        $this->validate($request, [
            'name' => 'required',
            'description'=> 'required'
        ] , 
        [
            'required' => 'Please fill in your :attribute.'
        ]);     

        Bookstores::create([
            'bookstore_name' => $request->name,
            'information' => $request->description
        ]);

        return redirect()->route('admin_bookstore_lists')->with('success', 'Created successfully');
    }
    public function admin_bookstore_delete ($id){
    	Bookstores::find($id)->delete();
        return redirect()->route('admin_bookstore_lists')->with('success', 'Created successfully');
    }





    	// Books
    public function admin_book_lists(){
    	$books = Books::all();
    	foreach ($books as $key => $value) {
    		$bookstores = Bookstores::where("id" , "=" , $value['bookstore_id'])->get();
    		$value['bookstore_name'] = $bookstores[0]['bookstore_name'];
    	}
        $book_tags = [];
        foreach ($books as $key => $value) {
            $arr = Book_tags::where('book_id' , '=' , $value['id'])->get();
            foreach ($arr as $key => $tag) {
                $tag_arr = Tags::where('id' , '=' , $tag['tag_id'])->get();
                $book_tags[$value['id']][] = [
                    'id'=>$tag['id'] , 
                    'tag_name'=>$tag_arr[0]['tag_name']
                ];
            }
        }

        return view('admin.demo.book_lists' , compact('books' , 'book_tags'));
    }
    public function admin_book_add(){
    	$bookstores = Bookstores::all();
        $tags = Tags::all();
        return view('admin.demo.book_add' , compact("bookstores" , "tags"));
    }
    public function admin_book_store(Request $request){
        $this->validate($request , [
                'book_name' => "required",
                'author' => "required",
                'image' => "required",
                'quantity' => "required",
                'description' => "required",
                'price' => "required",
                'bookstore_id' => "required|min:0",
                'tag_id' => "required"
            ],
            [
                'required' => 'Please fill in your :attribute.',
                'min' => 'Please pick the :attribute.'
            ]
        );
        $image = $request->file('image');
        $extension = $image->getClientOriginalExtension();
        $name = time() . "." . $extension;
        $store = $image->move('img', $name);
        $SQLstore = 'img/' . $name;
        $books = Books::create([
            'book_name' => $request->book_name,
            'author' => $request->author,
            'image' => $SQLstore,
            'quantity' => $request->quantity,
            'description' => $request->description,
            'price' => $request->price,
            'bookstore_id' => $request->bookstore_id
        ]);

        foreach ($request->tag_id as $value) {
            if ($value != -1) {
                Book_tags::create([
                    "book_id" => $books->id,
                    'tag_id' => $value
                ]);
            }
        }

        return redirect()->route('admin_book_lists')->with('success', 'Created successfully');
    }
    public function admin_book_edit(Request $request , $id) {
        $book = Books::where('id' , '=' , $id)->get();
        $bookstore = Bookstores::where('id' , '=' , $book[0]['bookstore_id'])->get();
        $book[0]['bookstore_name'] = $bookstore[0]['name'];
        $bookstores = Bookstores::all();
        $tags = Tags::all();
        return view('admin.demo.book_edit' , compact('book' , 'bookstores' , 'tags'));
    }
    public function admin_book_update(Request $request , $id) {
        $this->validate($request , [
                'book_name' => "required",
                'author' => "required",
                'image' ,
                'quantity' => "required",
                'description' => "required",
                'price' => "required",
                'bookstore_id' => "required|min:0",
                'tag_id' => "required"
            ],
            [
                'required' => 'Please fill in your :attribute.',
                'min' => 'Please pick the :attribute.'
            ]
        );

        $books = Books::where('id' , '=' , $id)->get();
        foreach ($request->tag_id as $value) {
            if ($value != -1) {
                Book_tags::where('book_id' , '=' , $id)->delete();
            }
        }
        foreach ($request->tag_id as $value) {
            if ($value != -1) {
                Book_tags::create([
                    "book_id" => $books[0]['id'],
                    'tag_id' => $value
                ]);
            }
        }

        /*
        if ($request->image != '') {
            File::delete(Books::find($id)->image);
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $name = time() . "." . $extension;
            $store = $image->move('img', $name);
            $SQLstore = 'img/' . $name;
        }
        else {
            $SQLstore = Books::find($id)->image;
        }
        */

        Books::where('id' , '=' , $id)->update([
            'book_name' => $request->book_name,
            'author' => $request->author,
            'image' => $request->image , //$SQLstore,
            'quantity' => $request->quantity,
            'description' => $request->description,
            'price' => $request->price,
            'bookstore_id' => $request->bookstore_id
        ]);

        return redirect()->route('admin_book_lists')->with('success', 'Deleted successfully');
    }
    public function admin_book_delete ($id){
    	Books::find($id)->delete();
        return redirect()->route('admin_book_lists')->with('success', 'Deleted successfully');
    }
    public function admin_book_comments ($id){
        $comments = Comments::where('book_id' , '=' , $id)->get();
        $books = Books::find($id);
        return view('admin.');
    }





        // Tags
    public function admin_tag_lists(){
        $tags = Tags::all();
        return view('admin.demo.tag_lists' , compact('tags'));
    }
    public function admin_tag_add(){
        return view('admin.demo.tag_add');
    }

    public function admin_tag_store(Request $request){
        $this->validate($request, [
            'tag_name' => 'required'
        ] , 
        [
            'required' => 'Please fill in your :attribute.'
        ]);     

        Tags::create([
            'tag_name' => $request->tag_name,
            'information' => $request->description
        ]);

        return redirect()->route('admin_tag_lists')->with('success', 'Created successfully');
    }
    public function admin_tag_delete ($id){
        Tags::find($id)->delete();
        return redirect()->route('admin_tag_lists')->with('success', 'Created successfully');
    }





        // Orders
    public function admin_order_lists(){
        $orders = Orders::all();
        return view('admin.demo.order_lists' , compact('orders'));
    }
    public function admin_order_details(Request $request , $id){
        $order = Orders::where('id' , '=' , $id)->get();
        $order_details = Order_details::where('order_id' , '=' , $order[0]['id'])->get();
        foreach ($order_details as $key => $value) {
            $book = Books::where('id' , '=' , $value['book_id'])->get();
            $bookstore = Bookstores::where('id' , '=' , $book[0]['bookstore_id'])->get();
            $value['image'] = $book[0]['image'];
            $value['book_name'] = $book[0]['book_name'];
            $value['bookstore_name'] = $bookstore[0]['bookstore_name'];
            $value['author'] = $book[0]['author'];
            $value['price'] = $book[0]['price'];
        }
        return view('admin.demo.order_details' , compact('order' , 'order_details'));
    }
    public function admin_order_delete ($id){
        $order_details = Order_details::where('order_id' , '=' , $id)->get();
        foreach ($order_details as $key => $value) {
            $book = Books::where('id' , '=' , $value['book_id'])->get();
            Books::where('id' , '=' , $value['book_id'])->update([
                'quantity'=>$book[0]['quantity'] + $value['quantity']
            ]);
        }
        Orders::where('id' , '=' , $id)->delete();
        return redirect()->route('admin_order_lists')->with('success', 'Order cancelled successfully');
    }
    public function admin_order_confirm ($id){
        Orders::where('id' , '=' , $id)->update([
            'status' => '1'
        ]);
        return redirect()->route('admin_order_lists')->with('success', 'Order confirmed successfully');
    }
    public function admin_order_disconfirm ($id){
        Orders::where('id' , '=' , $id)->update([
            'status' => '0'
        ]);
        return redirect()->route('admin_order_lists')->with('success', 'Order disconfirmed successfully');
    }
}
