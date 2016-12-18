
$(document).ready(function(event) {
	var isOk = new Array();
	//正则表达式验证
	var regExp={
			username: new RegExp('^[^\u4e00-\u9fa5]{0,}$'),
			password: new RegExp('^[0-9_a-zA-Z]{6,20}$'),
			phone: new RegExp('^[1][358][0-9]{9}$')
	}
	// ajax检验用户名是否冲突
	var title = "您已注册,请勿重复注册";
	var flag = false;
	var isFalse =  '<span style="color: green; font-size: 17px;" class="icon-checkmark" name="check-icon"></span>';
	var isTrue =  '<span style="color: red; font-size: 17px;" class="icon-cross	" title='+title+' name="check-icon"></span>';
	
	$('input[name="role_version"]').val(window.location.toString().split('#!/')[1]);
	
	$('input[name="username"]').blur(function() {
		if(regExp.username.test($(this).val())){
			$.post(path + "/user/check", {
				username : $(this).val()
			}, function(data) {
				$("span[name='check-icon']").remove();
				if(data){
					$('input[name="username"]').after(isTrue);
					isOk[0] = false
				} else {
					$('input[name="username"]').after(isFalse);
					isOk[0] = true;
				}
			});
		} else {
			isOk[0] = false;
			$("span[name='check-icon']").remove();
			title = "请勿使用中文名"
			$('input[name="username"]').after(isTrue);
		}
	});
	//判断两次密码一致性
	var p = $('input[name="password"]');
	var r = $('input[name="repassword"]');
	p.blur(function(){reCheck()});
	r.blur(function(){reCheck()});
	function reCheck(){
		title = "两次密码不一致";
		if(p.val()&&r.val()){
			p.siblings("span[name='check-icon']").remove()
			r.siblings("span[name='check-icon']").remove()
			if(p.val()!=r.val()){
				p.after(isTrue);
				r.after(isTrue);
				isOk[1] = false;
			}else{
				p.after(isFalse);
				r.after(isFalse);
				isOk[1] = true;
			}
		}
	}
	//判断真实姓名
	var realName = $('input[name="information.realname"]');
	realName.blur(function(){
		$(this).siblings("span[name='check-icon']").remove()
		if($(this).val())
		$.post(path + "/user/check",{realName: realName.val()},function(data){
			if(data){
				realName.after(isTrue);
				isOk[2] = false;
			} else {
				realName.after(isFalse);
				isOk[2] = true;
			}
		})
	})
	//判断手机号码
	var phone = $('input[name="information.phone"]');
	phone.blur(function(){
		$("span[name='check']").remove();
		if(phone.val()&&!regExp.phone.test($(this).val())){
			phone.after('<span style="color:red" name="check">不正确的号码</span>')
			isOk[3] = false;
		}else{
			phone.after(isFalse);
			isOk[3] = true;
		}
	})
	
	$('.submit:odd').click(function(){
		window.location.href = 'index.jsp#!/'+window.location.toString().split('#!/')[1];
	});
	$('form:first').submit(function(){
		for(var f=0;f<isOk.length;f++){
			flag = isOk[f]
			if(!flag){
				break;
			}
		}
		if(!flag){
			alert('请正确填写所有的必选项')
		}
		return flag;
	});
});
