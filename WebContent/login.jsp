<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="author" content="Apache"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
		<title>登录</title>
	</head>
	<body>
		<jsp:include page="commons/header.jsp"/>
		<section class="container">
		<strong></strong>
			<form name="login">
				<font>帐号:</font>
				<span class="icon-user"></span>
				<input type="text" name="username" placeholder="请输入用户名" required="required"/><br>
				<font>密码:</font>
				<span class="icon-locked"></span>
				<input type="password" name="password" placeholder="请输入密码" required="required"/><br>
				<div class="btn">
					<font style="position: absolute;margin:20px -230px">验证码:</font>
					<img alt="验证码" src="" id="checkPic">
					<input type="text" name="check" placeholder="请输入验证码" required="required"/>
					<a id="change" style="cursor: pointer;">看不清?换张图片</a><br>
					<button class="btn_login">登录</button>
					<button class="btn_submit">注册成为作者</button>
					<a href="forget.jsp">忘记密码?</a>
				</div>
				</form>
		</section>
	</body>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript">var basePath = "${pageContext.request.contextPath}"</script>
</html>