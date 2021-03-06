<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RewardMoneyHistory extends Model
{
    protected $fillable = ['user_id', 'reward_item', 'amount', 'total'];

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }
}
