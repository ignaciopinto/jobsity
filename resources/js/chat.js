var signin_options = ["Username", "Password", "Email", "Currency", "Balance"];

signin = function() {
	var asking = sessionStorage.getItem("signin_option");
	var answer = $('#textchat').val();
	$('#sign_' + asking.toLowerCase()).val(answer);
	var index = signin_options.indexOf(asking);
	if (index == 1) {
		answer = "<i>(I'll keep it a secret)</i>";
	}
	post_message(1, answer);
	$('#textchat').val("");
	sessionStorage.setItem("signin_option", signin_options[index + 1]);
	if (typeof signin_options[index + 1] === "undefined") {
		$('#signin_form').submit();
	} else {
		$('#textchat').attr("type", "text");
		if (index + 1 == 1) {
			$('#textchat').attr("type", "password");
		}
		var question = "and your "+signin_options[index + 1]+"?";
		post_message(0, question);
	}
}

login = function() {
	var txt = $('#textchat').val();
	email = sessionStorage.getItem("email");
	if (email !== "1") {
		post_message(1, txt);
		sessionStorage.setItem("email", "1");
		$('#email').val(txt);
		msg = "What is your password?";
		post_message(0, msg);
		$('#textchat').val("");
		$('#textchat').attr("type", "password");
		$('#textchat').prop("onkeyup", "").off("keyup");
	} else {
		msg = "Login to account";
		post_message(0, msg);
		$('#password').val(txt);
		$('#textchat').val("");
		$('#textchat').attr("type", "text");
		sessionStorage.clear();
		$('#loginform').submit();
	}

}

post_message = function(id, message) {
	var chatbox = $('#mensaje').html();
	var div = '<div class="chatmessage ';
	if (id !== 0) {
		div += 'right';
	} else {
		div += 'left';
	}
	div += '">' + message + '</div>';
	$('#mensaje').append(div);
	$('.box.chat').scrollTop($('.box.chat')[0].scrollHeight);
}


change_balance = function(qty, curr) {
	var old_balance = parseInt($('#balance').html());
	var new_balance = old_balance + qty;
	$('#balance_curr').val(curr);
	$('#balance_qty').val(qty);
	$('#balanceform').submit();
}

command = function() {
	var msg = $('#textchat').val();
	post_message(1, msg);
	var default_balance = $('#balance').html();
	var default_currency = $('#currency').html();
	var msg_params = msg.split(" ");
	var com = msg_params[0];
	var curr = typeof msg_params[2] === 'undefined' || null ? default_currency : msg_params[2];
	var qty = msg_params[1];
	var uname = $('#username_td').html();
	switch (msg_params[0].toLowerCase()) {
		case "/signin":
		sessionStorage.clear();
		$('#textchat').val("");
		if (typeof uname === "undefined") {
			msg = "To Sign in please answer the following questions.<br>What will be your " + signin_options[0] + "?"
			sessionStorage.setItem("signin_option", signin_options[0]);
			$('#commandbtn').attr("onclick", "signin();");
		} else {
			msg = "You can't sign in when already logged in, logout first."
		}
		break;
		case "/login":
		if (typeof uname === "undefined") {
			msg = "What is your e-mail?";
			$('#commandbtn').attr("onclick", "login();");
			$('#commandbtn').prop('disabled', true);
			$('#textchat').val("");
			$('#textchat').attr("onkeyup", "email_form()");
		} else {
			$('#textchat').attr("type", "text");
			msg = "You are Already Logged in."
		}
		break;
		case "/logout":
		window.location.href = "main/logout";
		break;
		case "/deposit":
		if (typeof uname !== "undefined") {
			if (typeof qty !== "undefined" && qty !== null) {
				change_balance(parseFloat(qty) * 1.0, curr);
				msg = "Prossesing Deposit<br>The chat will be cleaned for safety";
			} else {
				msg = "I can't help you, you didn't give me enough parameters for /deposit.<br> Remember the command is /deposit quantity currency<br>Ex: /deposit 2000 USD.<br>Try Again.";
			}
		} else {
			msg = "Sorry I can't help you<br>You must login into an account to make a deposit<br>Type /login to login.";
		}
		break;
		case "/withdraw":
		if (typeof uname !== "undefined") {
			change_balance(parseFloat(qty) * -1.0, curr);
			msg = "Prossesing Withdraw<br>The chat will be cleaned for safety";
		} else {
			msg = "Sorry I can't help you<br>You must login into an account to make a withdraw<br>Type /login to login.";
		}
		break;
		case "/balance":
		if (typeof uname !== "undefined") {
			msg = "Your Actual Balance is: " + default_currency + " " + default_balance
		} else {
			msg = "Sorry I can't help you<br>You must login into an account to check your balance<br>Type /login to login.";
		}
		break;
		default:
		msg = "I'm sorry I don not understand <br>	"+msg_params[0];
		break;
	}
	post_message(0, msg);
}

email_form = function() {
	var email = $('#textchat').val();
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (re.test(String(email).toLowerCase())) {
		$('#commandbtn').prop('disabled', false);
	} else {
		$('#commandbtn').prop('disabled', true);
	}
}


$.fn.enterKey = function(fnc) {
	return this.each(function() {
		$(this).keypress(function(ev) {
			var keycode = (ev.keyCode ? ev.keyCode : ev.which);
			if (keycode == '13') {
				fnc.call(this, ev);
			}
		})
	})
}
$('#textchat').enterKey(function() {
	$('#commandbtn').click();
});

$(function() {
	document.getElementById('textchat').focus();
	var uname = $('#username_td').html();
	if (typeof uname === "undefined") {

	}
});