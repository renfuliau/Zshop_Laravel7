<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserLevel extends Model
{
    protected $fillable=['name','level_up_line'];

    public function users(){
        return $this->hasMany('App\User','id','user_level_id')->where('status','active');
    }

    public static function getUserLevelName($user_level_id)
    {
        return UserLevel::where('id',$user_level_id)->first();
    }
}
