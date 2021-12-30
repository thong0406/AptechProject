<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    use HasFactory;
    protected $table='comments';

    protected $fillable = [
		'id'	,
		'book_id'	,
		'user_id'	,
		'comment'	,
		'rating'	,
	];

	public function books() {
		return $this->belongsTo(
			Books::class , 
			'book_id' , 'id'
		);
	}
	public function users() {
		return $this->belongsTo(
			Users::class , 
			'user_id' , 'id'
		);
	}
}
