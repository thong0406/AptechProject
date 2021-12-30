<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Admins extends Model
{
    use HasFactory;
	protected $table='admin';
	
	protected $fillable = [
		'admin_name' ,
		'password',
		'name' ,
		'level'
	];
}
