<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class Requests extends Model
{
    
    public $fillable = ['book_id','user_id','approved'];

   
}
