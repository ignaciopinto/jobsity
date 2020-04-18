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

}
