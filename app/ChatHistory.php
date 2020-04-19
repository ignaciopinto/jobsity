<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ChatHistory extends Model
{
    static function get_chat($user_id){
    	return ChatHistory::where("sender","=",$user_id)->orWhere("reciever","=",$user_id)->orderBy("created_at","asc")->get();
    }
}
