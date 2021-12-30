<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book_tags extends Model
{
    use HasFactory;
    protected $table='book_tags';

    protected $fillable = [
		'book_id'	,
		'tag_id'
	];

	public function book() {
		return $this->belongsTo(
			Books::class , 
			'book_id' , 'id'
		);
	}
	public function tags() {
		return $this->belongsTo(
			Tags::class , 
			'tag_id' , 'id'
		);
	}
}
