/**
 * 
 */
$(function(){
/*计时重新发送验证码*/
	$('#getCode').click(function() {
		
		var i = 60;
		//邮箱验证
		var rex = new RegExp(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)
		
		if(rex.test($('#email').val())&&$('#username').val()){
			$.get(basePath+"/user/Email",{email:$('#email').val(),username:$('#username').val()},function(data){
				if(data){
					handleCookie.setCookie("random", data, 30)
				} else {
					$('#error').remove()
					$('#email').after('<span id="error" style="color:red; font-size:13px;">账号与邮箱不匹配</span>')
				}
			});
			$(this).attr("disabled", "disabled");
			var shutdown = setInterval(function() {
				$('#getCode').text('重新发送(' + i + 's)');
				if (i == 0) {
					$('#getCode').text('重新获取验证码').removeAttr("disabled");
					clearInterval(shutdown);
				}
				i--;
			}, 1000);
		} else {
			$('#error').remove()
			$('#email').after('<span id="error" style="color:red; font-size:13px;">请输入正确的邮箱/帐号</span>')
		}
		
	});
	
	$('input').focus(function(){
		$('#error').remove()
	});
	
	$('.btnCode').click(function(){
		var ipt = $('#inputCode').val();
		if(ipt&&ipt===handleCookie.getCookie("random")){
			handleCookie.setCookie("jump", $('#username').val(), 30)
			window.location.href = "newpwd.jsp"
		}
	})
})

var handleCookie = {
	//设置cookie
	setCookie :	function (cname, cvalue, exMin) {
				    var d = new Date();
				    d.setTime(d.getTime() + (exMin*60*1000));
				    var expires = "expires="+d.toUTCString();
				    document.cookie = cname + "=" + cvalue + "; " + expires;
				},
	//获取cookie
	getCookie: function (cname) {
				    var name = cname + "=";
				    var ca = document.cookie.split(';');
				    for(var i=0; i<ca.length; i++) {
				        var c = ca[i];
				        while (c.charAt(0)==' ') c = c.substring(1);
				        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
				    }
				    return "";
				},
	//清除cookie  
	clearCookie: function (name) {  
	    			setCookie(name, "", -1);  
				} 
}