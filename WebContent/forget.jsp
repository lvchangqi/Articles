<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="Apache"/>
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/forget.css"/>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<title>修改密码</title>
	</head>
<body>
	<jsp:include page="commons/header.jsp"/>
	<section class="container">
		<div class="main">
			<div class="form-group">
				<label for="username">账&nbsp;&nbsp;&nbsp;号：</label>
				<span class="icon-user"></span>
				<input type="text" placeholder="请输入账号" id="username" required="required" />
			</div>
			<div class="form-group">
				<label for="email">邮&nbsp;&nbsp;&nbsp;箱：</label>
				<span class="icon-email"></span>
				<input type="email" placeholder="请输入注册时的email" id="email" required="required" />
			</div>
			<div class="form-group">
				<label for="inputCode">验证码：</label>
				<span class="icon-github"></span>
				<input type="text" placeholder="请输入验证码" id="inputCode" required="required" />
				<button class="getCode" id="getCode">发送验证码</button>
			</div>
			<div class="form-group">
				<button class="btnCode btn btn-default">确定</button>
			</div>
		</div>
	</section>
</body>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/forget.js"></script>
	<script type="text/javascript">var basePath = "${pageContext.request.contextPath}"</script>
</html>