<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Books extends Model
{
    use HasFactory;
    protected $table='books';

    protected $fillable = [
		'book_name',
		'author'	,
		'image',	
		'quantity'	,
		'description'	,
		'price'	,
		'bookstore_id'
	];

	public function bookstores() {
		return $this->belongsTo(
			Bookstores::class , 
			'bookstore_id' , 'id'
		);
	}
	public function book_tags() {
		return $this->hasMany(
			Book_tags::class , 
			'book_id' , 'id'
		);
	}
	public function comments() {
		return $this->hasMany(
			Book_tags::class , 
			'book_id' , 'id'
		);
	}
}
