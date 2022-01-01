<?php

namespace App\Http\Controllers\search;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Books;
use App\Models\Orders;
use App\Models\Tags;
use App\Models\Book_tags;
use App\Models\Comments;
use App\Models\Order_details;
use App\Models\Bookstores;
use Illuminate\Support\Facades\Hash;

class search_controller extends Controller
{
	public function search_view (Request $request) {
		$param = [
			'search'=>$request->search ,
			'bookstore'=>$request->bookstore ,
			'tags'=>$request->tags ,
			'type'=>$request->type
		];
		if ($param['type'] == '') $param['type'] = 'book_name';

		$delimeter = ' ';
		$keywords = explode($delimeter, $param['search']);

		$condition = [];
		foreach ($keywords as $keyword) {
			$condition[] = [ $param['type'] , 'like' , '%' .$keyword .'%' ];
		}

		if (($param['bookstore'] != '-1') and ($param['bookstore'] != '')) $condition[] = [ 'bookstore_id' , '=' , $param['bookstore'] ];\
		if (($param['tags'] != '-1') and ($param['tags'] != '')) {

		}
		$arr = Books::where($condition)->get();

		$books = $arr;
		foreach ($books as $key => $value) {
			$bookstores = Bookstores::where("id" , "=" , $value['bookstore_id'])->get();
			$value['bookstore_name'] = $bookstores[0]['bookstore_name'];
			$comments = Comments::where('book_id' , '=' , $value['id'])->get();
			$stars = 5;
			foreach ($comments as $key2 => $comment) {
				$stars += $comment['rating'];
			}
			$stars = round($stars/(count($comments)+1));
			$arr[$key]['stars'] = $stars;
		}

		$bookstores = Bookstores::all();
		$tags = Tags::all();

		return view('bakery.test.search' , compact('books' , 'tags' , 'bookstores' , 'param'));
	}

	public function search_store (Request $request) {
		$this->validate($request , [
			'search' ,
			'bookstore' ,
			'tags' ,
			'type'
		]);

		$return = [
			'search'=>$request->search ,
			'bookstore'=>$request->bookstore ,
			'tags'=>$request->tags ,
			'type'=>$request->type
		];

		return redirect()->route('search_view' , $return);
	}
}
