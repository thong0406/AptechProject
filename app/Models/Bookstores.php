<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bookstores extends Model
{
    use HasFactory;
    protected $table='bookstores';

    protected $fillable = [
		'bookstore_name',	
		'information'
	];

	public function books() {
		return $this->hasMany(
			Books::class , 
			'bookstore_id' , 'id'
		);
	}
}
