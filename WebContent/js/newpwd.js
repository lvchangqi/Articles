$(function(){
	if(!handleCookie.getCookie("random")||!handleCookie.getCookie("jump")){
		handleCookie.clearCookie("jump")
		handleCookie.clearCookie("random")
		window.history.back()
	} else {
		var pwd = $('#pwd').val()
		var newpwd = $('#newpwd').val()
		
		var rex = new RegExp(/^[A-Za-z0-9]{4,10}/)
		
		$('#pwd').blur(function(){
			
			if(!rex.test($(this).val())){
				$(this).after('<span id="error" style="color:red; font-size:13px;">密码必须数字和字母,且长度为4~10位</span>')
			}
			
		}).focus(function(){
			$('#error').remove();
		})
		
		var flag = false
		$('#newpwd').blur(function(){
			if(pwd==newpwd){
				flag = true	
			} else {
				$(this).after('<span id="error" style="color:red; font-size:13px;">两次密码不一致</span>')
			}
		}).focus(function(){
			$('#error').remove();
		})
		
		$('.btnCode').click(function(){
			pwd = $('#pwd').val()
			newpwd = $('#newpwd').val()
			if(flag){
				$.post(basePath+'/user/updatePwdo',{pwd:newpwd,name:handleCookie.getCookie("jump")},function(data){
					if(data){
						$('.btnCode').after('<div class="form-group"><span style="color:green; font-size:13px;">修改密码成功,正在跳转首页...</span></div>')
						handleCookie.clearCookie("jump")
						handleCookie.clearCookie("random")
						setInterval(function(){
							window.location.href = "index.jsp"
						}, 1500)
					}
				})
			}
		});
	}
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
	    			this.setCookie(name, "", -1);  
				} 
}
