$(document).ready(function(){
	//向后台请求验证码
	$('#change').click(function(e){
		$('img').attr("src", basePath + "/safecode/create_sc?K=" + Math.random());
		$("#tip").html('');
		e.preventDefault();
	});
	$('#change').click();
	
	//-----验证码验证开始----//
	var isValid = true;
	$('.btn_login').click(function(){
		if($("input[name='check']").val()){
		$.ajax({
			type: "post",
	        url: basePath + "/safecode/check_sc",
	        data: "safecode=" + $("input[name='check']").val(),
	        dataType: "text",
	        success: function(data){
	        	if(data=='false'){
	        	  /*验证码错误时触发事件*/
	        	  $("strong").html('验证码错误').css("color","#A94442");
	        	  setTimeout(function(){
	        		  $("strong").html('');
	        	  }, 5000);
	        	  isValid = false;
	        	}else{
	        	  isValid = true;
	        	}
	        }
		});
		} else {
			isValid = false;
			$("strong").html('请输入验证码').css("color","#A94442");
		}
	});
	//-----验证码验证结束----//
	
	//阻止事件冒泡
	var u_name = $('input[name="username"]');
	var u_pass = $('input[name="password"]');
	var role_version = window.location.toString().split('#!/')[1];
	$('.btn_login').click(function(){
		if(u_name.val()&&u_pass.val()&&isValid){
			$.post(basePath + '/user/login',{
				username: u_name.val(),
				password: u_pass.val(),
				role_version: role_version
			},function(data){
				switch(data){
				case 'token': window.location.replace(basePath+'/page/control.jsp'); break;
				case 'UsernamePassword is wrong': 
					$("strong").html('帐号密码错误').css("color","#A94442");break;
				case 'UsernamePassword is unable':
					$("strong").html('帐号不存在').css("color","#A94442");break;
				case 'NotMatch':
					$("strong").html('您的权限不匹配,无法登录').css("color","#A94442");break;
				case 'no user':
					$("strong").html('此帐号不存在').css("color","#A94442");break;
				default: alert('未知错误,\n请稍后再试');
				}
			});
			return false;
		}else
			return isValid;
	});
	
	if(role_version.indexOf('/') != -1){
		if(role_version.split('/')[0]==='1'){
			$('.btn_submit').text('注册成为编辑')
		} else if(role_version.split('/')[0]==='0'){
			$('.btn_submit').css('display','none').siblings('.btn_login').css('margin-left','160px')
		}
	}
	
	$('.btn_submit').click(function(){
		window.location.href='submit.jsp#!/' + role_version.split('#!/');
		return false;
	});
	
});