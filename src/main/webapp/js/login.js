document.onkeydown = function(e) {
	if ($("#password").val() == "") {
		return;
	}
	var event = e || window.event;
	var code = event.keyCode || event.which || event.charCode;
	if (code == 13) {
		login();
	}
}
// $(function() {
// $("#username").val("admin");
// $("#password").val("admin");
// });
function change(img) {
	img.src = 'images/AuthImageServlet?random=' + Math.random();
}
function login() {
	var user = {
		username : $("#username").val(),
		password : $("#password").val(),
		vcode : $("#vcode").val()
	};
	if (user.vcode == "") {
		alert("验证码不能为空，请重新输入！");
		return;
	}
	if (user.username == "" || user.password == "") {
		alert("用户名或密码为空，请重新输入！");
		$("#password").val("");
		$("#vcode").val("");
		$("#username").focus();
		return;
	} else {
		$.ajax({
			url : "user/login",
			type : "post",
			data : user,
			success : function(data) {
				if (data.success) {
//					var type =data.attribute.type
//					if(type == 2 || type == 0){
//						window.location.href = "main.jsp";
//					}else{
//						window.location.href= "gssy.jsp";
//					}
					window.location.href= "index.jsp";
				} else {
					$("#password").val("");
					$("#vcode").val("");
					alert(data.msg);
				}
			}
		});
	}
}