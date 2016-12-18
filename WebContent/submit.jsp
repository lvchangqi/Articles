<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="css/submit.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<title>注册</title>
	</head>

	<body>
		<header>
			<span>注册页面</span>
		</header>
		<section class="container">
			<span style="position: absolute; margin-left: 276px; color:#FF0000"><span style="margin-left: 18px;">注意：*为必填字段</span><br/>若注册为编辑需要主编审核<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span>请勿使用中文用户名</span></span>
			<form method="post" action="${pageContext.request.contextPath}/user/submit">
				<input type="hidden" name="role_version"/>
				<ul class="public left">
					<li> 
						<span class="title">
							<font color="#FF0000">*</font>用户名:
						</span>
						<span class="icon icon-user"></span>
						<input type="text" name="username" placeholder="请输入用户名" required="required"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000">*</font>密&nbsp;&nbsp;&nbsp;码:
						</span>
						<span class="icon icon-locked"></span>
						<input type="password" name="password" placeholder="请输入密码" required="required"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000">*</font>确认密码:
						</span>
						<span class="icon icon-locked"></span>
						<input type="password" name="repassword" placeholder="请确认密码" required="required"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000">*</font>真实姓名:
						</span>
						<span class="icon icon-user-check"></span>
						<input type="text" name="realname" placeholder="请输入姓名" required="required"/>
					
					</li>
					<li>
						<span class="title">
						<font color="#FF0000">&nbsp;</font>
							性别:
						</span>
						<span class="icon  icon-man-woman"></span>
						<select name="sex">
							<option value="" selected="selected" hidden="hidden">--请选择性别--</option>
							<option value="man">男</option>
							<option value="woman">女</option>
						</select>
					</li>
					<li>
						<span class="title">
							<font color="#FF0000">&nbsp;&nbsp;</font>职称:
						</span>
						<span class="icon icon-archive"></span>
						<input type="text" name="zhicheng" placeholder="请输入职称"/>
					</li>
				</ul>
				<ul  class="public right">
					<li>
						<span class="title">
							<font color="#FF0000">*</font>手机号:
						</span>
						<span class="icon icon-mobile"></span>
						<input type="text" name="phone" placeholder="请输入手机号码" required="required"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000">*</font>邮&nbsp;&nbsp;&nbsp;箱:
						</span>
						<span class="icon icon-email"></span>
						<input type="email" name="email" placeholder="请输入邮箱" required="required"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000"></font>联系地址:
						</span>
						<span class="icon icon-location2"></span>
						<input type="text" name="address" placeholder="请输入联系地址"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000"></font>单位名称: 
						</span>
						<span class="icon icon-profile"></span>
						<input type="text" name="company" placeholder="请输入单位名称"/>
					
					</li>
					<li>
						<span class="title">
							<font color="#FF0000">&nbsp;&nbsp;</font>QQ:
						</span>
						<span class="icon icon-chat2"></span>
						<input type="text" name="qq" placeholder="请输入QQ号码"/>
					</li>
					<li>
						<span class="title">
							<font color="#FF0000"></font>学位:
						</span>
						<span class="icon icon-graduate"></span>
						<input type="text" name="degree" placeholder="请输入学位"/>
					</li>
				</ul>
				<div class="btn">
					<input type="submit" class="submit" value="确认"/>
					<input type="reset" class="submit reset" value="返回首页"/>
				</div>
			</form>
		</section>
	</body>
<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="js/submit.js" ></script>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath}"
	var version ="${version}"
</script>
</html>