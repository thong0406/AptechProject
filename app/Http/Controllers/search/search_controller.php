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
use Illuminate\Support\Facades\DB;
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

		if (($param['bookstore'] != '-1') and ($param['bookstore'] != '')) $condition[] = [ 'bookstore_id' , '=' , $param['bookstore'] ];
		if (($param['tags'] != '-1') and ($param['tags'] != '')) {
			
		}

		$tags_not_empty = 0;
		if ($param['tags'] != '') {
			foreach ($param['tags'] as $value) {
				if ($value != -1) {
					$tags_not_empty = 1;
					break;
				}
			}
		}
		$condition_or = [];
		if ($tags_not_empty == 1) {
			$book_tags = DB::table('book_tags');
			foreach ($param['tags'] as $value) {
				$book_tags->orWhere('tag_id' , '=' , $value);
			}
			foreach ($book_tags->get() as $key => $value) {
				$condition_or[] = ['id' , '=' , $value->book_id];
			}
		}
		$books = Books::query();
		foreach ($condition as $value) {
			$books = $books->where($value[0] , $value[1] , $value[2]);
		}
		$books = $books->where(function ($query) use ($condition_or) {
				foreach ($condition_or as $value) {
					$query->orWhere($value[0] , $value[1] , $value[2]);
				}
			}
		);
		/*
		foreach ($condition_or as $key => $value) {
			$books = $books->orWhere($value[0] , $value[1] , $value[2]);
		}
		*/
		$books = $books->get();

		foreach ($books as $key => $value) {
			$bookstores = Bookstores::where("id" , "=" , $value['bookstore_id'])->get();
			$value['bookstore_name'] = $bookstores[0]['bookstore_name'];
			$comments = Comments::where('book_id' , '=' , $value['id'])->get();
			$stars = 5;
			foreach ($comments as $key2 => $comment) {
				$stars += $comment['rating'];
			}
			$stars = round($stars/(count($comments)+1));
			$books[$key]['stars'] = $stars;
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
