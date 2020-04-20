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

	function __construct(){
		$this->rates=["AED"=>3.992011,"AFN"=>82.384625,"ALL"=>124.71746,"AMD"=>524.435324,"ANG"=>1.951289,"AOA"=>614.934625,"ARS"=>71.709808,"AUD"=>1.703581,"AWG"=>1.956362,"AZN"=>1.84167,"BAM"=>1.957123,"BBD"=>2.19495,"BDT"=>92.341396,"BGN"=>1.955923,"BHD"=>0.410339,"BIF"=>2075.917724,"BMD"=>1.086868,"BND"=>1.546321,"BOB"=>7.495351,"BRL"=>5.759533,"BSD"=>1.087118,"BTC"=>0.000153,"BTN"=>83.241485,"BWP"=>13.305688,"BYN"=>2.656455,"BYR"=>21302.6112,"BZD"=>2.191247,"CAD"=>1.52831,"CDF"=>1867.239123,"CHF"=>1.051735,"CLF"=>0.033729,"CLP"=>930.681873,"CNY"=>7.686983,"COP"=>4303.583947,"CRC"=>610.993582,"CUC"=>1.086868,"CUP"=>28.802,"CVE"=>110.588608,"CZK"=>27.404254,"DJF"=>193.157929,"DKK"=>7.457745,"DOP"=>59.180125,"DZD"=>139.194914,"EGP"=>17.121967,"ERN"=>16.302897,"ETB"=>36.149234,"EUR"=>1,"FJD"=>2.468821,"FKP"=>0.873044,"GBP"=>0.872978,"GEL"=>3.412511,"GGP"=>0.873044,"GHS"=>6.282245,"GIP"=>0.873044,"GMD"=>55.463022,"GNF"=>10270.901352,"GTQ"=>8.381336,"GYD"=>227.440231,"HKD"=>8.423607,"HNL"=>27.07391,"HRK"=>7.550438,"HTG"=>105.240508,"HUF"=>353.380997,"IDR"=>16874.113523,"ILS"=>3.859197,"IMP"=>0.873044,"INR"=>83.283971,"IQD"=>1293.372823,"IRR"=>45762.573627,"ISK"=>156.889588,"JEP"=>0.873044,"JMD"=>151.516083,"JOD"=>0.770608,"JPY"=>117.121941,"KES"=>116.079482,"KGS"=>86.444363,"KHR"=>4410.509647,"KMF"=>492.188398,"KPW"=>978.211809,"KRW"=>1323.674897,"KWD"=>0.338494,"KYD"=>0.905898,"KZT"=>465.407418,"LAK"=>9749.204726,"LBP"=>1644.430862,"LKR"=>209.261626,"LRD"=>215.199863,"LSL"=>20.465617,"LTL"=>3.209238,"LVL"=>0.657435,"LYD"=>1.537939,"MAD"=>11.091477,"MDL"=>19.141444,"MGA"=>4075.754915,"MKD"=>61.655726,"MMK"=>1543.644055,"MNT"=>3025.062679,"MOP"=>8.678232,"MRO"=>388.01188,"MUR"=>43.422325,"MVR"=>16.75934,"MWK"=>798.847583,"MXN"=>26.069397,"MYR"=>4.7545,"MZN"=>73.173416,"NAD"=>20.466005,"NGN"=>420.071643,"NIO"=>37.361118,"NOK"=>11.263305,"NPR"=>133.185968,"NZD"=>1.789055,"OMR"=>0.418586,"PAB"=>1.087018,"PEN"=>3.702414,"PGK"=>3.733412,"PHP"=>55.186257,"PKR"=>181.126535,"PLN"=>4.525348,"PYG"=>7045.854089,"QAR"=>3.957286,"RON"=>4.838305,"RSD"=>117.522739,"RUB"=>80.921013,"RWF"=>1018.938673,"SAR"=>4.078759,"SBD"=>9.025245,"SCR"=>18.9664,"SDG"=>60.095094,"SEK"=>10.875086,"SGD"=>1.544178,"SHP"=>0.873044,"SLL"=>10548.053336,"SOS"=>630.383276,"SRD"=>8.105852,"STD"=>23966.944146,"SVC"=>9.511282,"SYP"=>557.664986,"SZL"=>20.465397,"THB"=>35.305804,"TJS"=>11.139758,"TMT"=>3.814906,"TND"=>3.150876,"TOP"=>2.527674,"TRY"=>7.548064,"TTD"=>7.345051,"TWD"=>32.614191,"TZS"=>2515.491564,"UAH"=>29.434443,"UGX"=>4098.307098,"USD"=>1.086868,"UYU"=>47.315254,"UZS"=>11009.972217,"VEF"=>10.855096,"VND"=>25492.839171,"VUV"=>131.411792,"WST"=>2.992464,"XAF"=>656.390566,"XAG"=>0.071088,"XAU"=>0.000643,"XCD"=>2.937315,"XDR"=>0.797727,"XOF"=>658.095353,"XPF"=>119.827078,"YER"=>272.096996,"ZAR"=>20.398118,"ZMK"=>9783.114419,"ZMW"=>20.138002,"ZWL"=>349.971471];
	}
	

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

	function force_exchange($def_curr,$in_curr,$qty){
		return ($qty/($this->rates[$in_curr]))*($this->rates[$def_curr]);
	}


	function fixerio($def_curr,$in_curr,$qty){
		// set API Endpoint, access key, required parameters
		$endpoint = 'convert';
		$access_key = '8ae7671a42590a94bd92491d90c138e2';

		$from = strtoupper($in_curr);
		$to = strtoupper($def_curr);
		$amount = $qty;

		// initialize CURL:
		$ch = curl_init('http://data.fixer.io/api/'.$endpoint.'?access_key='.$access_key.'&from='.$from.'&to='.$to.'&amount='.$amount.'');   
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

		// get the JSON data:
		$json = curl_exec($ch);
		curl_close($ch);

		// Decode JSON response:
		$conversionResult = json_decode($json, true);

		// access the conversion result
		return $conversionResult;
	}

	function amdoren($def_curr,$in_curr,$qty){
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
		return $parsed_json;
	}
	function currency_exchange($def_curr,$in_curr,$qty,$user_id){
		$fixer =  $this->fixerio($def_curr,$in_curr,$qty);
		$error = 1;
		if(Currencies::currency_exists($def_curr) && Currencies::currency_exists($in_curr)){
			if($fixer["success"]===true){
				$error = 0;
				$amount = $fixer["result"];
			}else{
				$amdoren = $this->amdoren($def_curr,$in_curr,$qty);
				if($amdoren->error===0){
					$amount = $amdoren->amount;					
					$error=0;
				}else{
					$amount = $this->force_exchange($def_curr,$in_curr,$qty);
					$error = 0;
				}

			}
			
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
