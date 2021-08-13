<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    public $fillable=['name','message','email','read_at', 'order_id'];

    public function order()
    {
        return $this->belongsTo('App\Models\Order', 'order_id');
    }
}
