sessionStorage.clear();
signin = function(option){
	var asking = $('#askforsign').html();
	switch(asking){
		case "username":
		break;
		case "password":
		break;
		case "email":
		break;
		case "currency":
		break;
		case "balance":
		break;
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

command = function(){
	var msg = $('#textchat').val();
	var msg_params = msg.split(" ");
	var com = msg_params[0];
	var curr = msg_params[1];
	var qty = msg_params[2];
	switch(msg_params[0].toLowerCase()) {
		case "/signin":
		msg = "To Sign in please answer the following questions.<br>Username:"
		$('#commands_inputs').hide();
		$('#signin_inputs').show();
		$('#askforsign').html("username");
		$('#mensaje').html(msg);
		break;
		case "/login":
		msg = "What is your e-mail?";
		$('#commandbtn').hide();
		$('#loginbtn').show();
		$('#mensaje').html(msg);
		break;
		case "/logout":
		window.location.href="main/logout";
		break;
		case "/deposit":
		$('#mensaje').html(msg_params.join(","));
		break;
		case "/withdraw":
		$('#mensaje').html(msg_params.join(","));
		break;
		case "/balance":
		$('#mensaje').html("balance");
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
$("#textchat").enterKey(function () {
	command();
})