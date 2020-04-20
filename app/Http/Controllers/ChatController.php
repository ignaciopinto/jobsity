<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use App\Currencies;
use App\BalanceHistories;
use App\User;
use App\ChatHistory;

class ChatController extends Controller
{
	function index()
	{	
		$chat = ChatHistory::get_chat(1);
		if($chat->count()){
			// return view('mainchat',["chat"=>$chat]);
		}
		return view('mainchat');
	}

	function balance_change(Request $request){
		$def_curr = $request->get('default_curr');
		$in_curr = $request->get('balance_curr');
		$qty = $request->get('balance_qty');
		$user_id = $request->get('user_id');
		$transaction = $this->currency_exchange($def_curr,$in_curr,$qty,$user_id);
		if($transaction>0){
			$msg = "The transaction was a success. To check your new balance type /balance";
		}else{
			$msg = "I'm sorry but the transaction failed";
			if($transaction === -1){
				$msg .= " your account doesn't have enougth for the withdraw";
			}else{
				$msg .= " an error happened during the transaction. Try again please.<br>The problem with the transaction was: \n".$transaction;
			}
			
		}
		return redirect('mainchat')->with("msg",$msg);
	}

	function currency_exchange($def_curr,$in_curr,$qty,$user_id){
		if(Currencies::currency_exists($def_curr) && Currencies::currency_exists($in_curr)){
			$api_key = "Aq9g5mCabHziDdjEyMRciGdtq5qNpf";
			$url="https://www.amdoren.com/api/currency.php?api_key=$api_key&from=$in_curr&to=$def_curr&amount=$qty";
			$ch = curl_init();  
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15); 
			curl_setopt($ch, CURLOPT_TIMEOUT, 30);
			$json_string = curl_exec($ch);
			$parsed_json = json_decode($json_string);
			$error = $parsed_json->error;
			$error_message = $parsed_json->error_message;
			$amount = $parsed_json->amount;
			//Test
			if($in_curr=="USD"){
				$amount = $qty*854.10253;
			}else{
				$amount = $qty;
			}
			$error = 0;
			if($error==0){
				$transaction = BalanceHistories::balance_change($user_id,$amount);
				if($transaction){
					$newbalance = User::balance_update($user_id,$amount);
					return $newbalance;
				}
			}
		}else{
			return "Currency doesnt Exists";
		}
	}

	function signin(Request $request){
		$currency = $request->get('sign_currency');
		$user = $request->get('sign_username');
		$email = $request->get('sign_email');
		$msg = "Ok";
		if(!Currencies::currency_exists($currency)){
			$msg = "Currency is not a valid one.";
			return redirect('mainchat')->with("msg",$msg);
		}
		if(User::user_exists($user,$email)){
			$msg = "<b>Username</b> or <b>E-Mail</b> already exists.";
			return redirect('mainchat')->with("msg",$msg);
		}
		if(User::signin($request)){
			$msg = "Signin Succesful. Type /login to login.";
			return redirect('mainchat')->with("msg",$msg);
		}

	}

}
