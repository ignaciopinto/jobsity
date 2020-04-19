var signin_options = ["Username","Password","Email","Currency","Balance"];

function camelize(str) {
	return str.split(' ').map(function(word,index){
    // If it is the first word make sure to lowercase all the chars.
    if(index == 0){
    	return word.toLowerCase();
    }
    // If it is not the first word only upper case the first char and lowercase the rest.
    return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
}).join('');
}

signin = function(){
	var asking = sessionStorage.getItem("signin_option");
	var	answer = $('#signinput').val();
	$('#sign_'+asking.toLowerCase()).val(answer);
	var index =  signin_options.indexOf(asking);
	if(index == 1){
		answer = "<i>(Secret)</i>";
	}
	$('#mensaje').append(" "+answer);
	$('#signinput').val("");
	sessionStorage.setItem("signin_option", signin_options[index+1]);	
	if(typeof signin_options[index+1] === "undefined"){
		$('#signin_form').submit();
	}else{
		$('#signinput').attr("type","text");
		if(index+1 == 1){
			$('#signinput').attr("type","password");
		}
		$('#mensaje').append("<br>"+signin_options[index+1]+": ");
	}
}

login = function(){
	var txt = $('#textchat').val();
	email = sessionStorage.getItem("email");
	if(email !== "1"){
		sessionStorage.setItem("email", "1");
		$('#email').val(txt);
		msg = "<br>What is your password?";
		$('#mensaje').append(msg);
		$('#textchat').val("");
		$('#textchat').attr("type","password");
	}else{
		msg = "Login to account";
		$('#mensaje').html(msg);
		$('#password').val(txt);
		$('#textchat').val("");
		$('#textchat').attr("type","text");
		sessionStorage.clear();
		$('#loginform').submit();
	}
	
}

change_balance = function(qty,curr){
	var old_balance = parseInt($('#balance').html());
	var new_balance = old_balance + qty;
	$('#balance_curr').val(curr);
	$('#balance_qty').val(qty);
	$('#balanceform').submit();
}

command = function(){
	var msg = $('#textchat').val();
	var default_balance = $('#balance').html();
	var default_currency = $('#currency').html();
	var msg_params = msg.split(" ");
	var com = msg_params[0];
	var curr = typeof msg_params[2] === 'undefined' || null ? default_currency : msg_params[2];
	var qty = msg_params[1];
	var uname = $('#username_td').html();
	switch(msg_params[0].toLowerCase()) {
		case "/signin":
		sessionStorage.clear();
		if(typeof uname === "undefined"){
			msg = "To Sign in please answer the following questions.<br>"+signin_options[0]+":"

			sessionStorage.setItem("signin_option", signin_options[0]);
			$('#commands_inputs').hide();
			$('#signin_inputs').show();
			$('#mensaje').html(msg);
		}else{
			msg = "You can't sign in when already logged in, logout first."
			$('#mensaje').html(msg);
		}
		break;
		case "/login":
		if(typeof uname === "undefined"){
			msg = "What is your e-mail?";
			$('#textchat').val("");
			$('#commandbtn').hide();
			$('#loginbtn').show();
			$('#mensaje').html(msg);
		}else{
			msg = "You are Already Logged in."
			$('#mensaje').html(msg);
		}
		break;
		case "/logout":
		window.location.href="main/logout";
		break;
		case "/deposit":
		if(typeof uname !== "undefined"){
			if(typeof qty!=="undefined" && qty !== null){
				change_balance(parseFloat(qty)*1.0,curr);
			}else{
				$('#mensaje').html("Not enough parameters");

			}
		}else{
			msg ="Sorry I can't help you<br>You must login into an account to make a deposit<br>Type /login to login.";
			$('#mensaje').html(msg);
		}
		break;
		case "/withdraw":
		if(typeof uname !== "undefined"){
			change_balance(parseFloat(qty)*-1.0,curr);
			$('#mensaje').html(msg_params.join(","));
		}else{
			msg ="Sorry I can't help you<br>You must login into an account to make a withdraw<br>Type /login to login.";
			$('#mensaje').html(msg);
		}
		break;
		case "/balance":
		if(typeof uname !== "undefined"){
			msg = "Your Actual Balance is: "+default_currency+" "+default_balance
			$('#mensaje').html(msg);
		}else{
			msg ="Sorry I can't help you<br>You must login into an account to check your balance<br>Type /login to login.";
			$('#mensaje').html(msg);
		}
		break;
		default:
		$('#mensaje').html("Comando no reconocido");
		break;
	}
}


$.fn.enterKey = function (fnc) {
	return this.each(function () {
		$(this).keypress(function (ev) {
			var keycode = (ev.keyCode ? ev.keyCode : ev.which);
			if (keycode == '13') {
				fnc.call(this, ev);
			}
		})
	})
}