<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BalanceHistories extends Model
{
	protected $table = 'balance_histories';

	static function balance_change($userid,$qty){
		$balance = new BalanceHistories;
		$balance->users_id = $userid;
		$balance->balance_change = $qty;
		$balance->save();
		return $balance->id;
	}

	static function is_valid($balance_id){
		$balance = BalanceHistories::find($balance_id);
		$balance->is_valid_transaction = true;
		$balance->save();
	}

	static function show_history($user_id){
		$balance = BalanceHistories::where("user_id","=",$user_id)->get();
		return $balance;
	}

}
