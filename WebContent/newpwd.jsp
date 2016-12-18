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
				<label for="pwd">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</label>
				<span class="icon-user"></span>
				<input type="password" placeholder="请输入新密码" id="pwd" required="required" />
			</div>
			<div class="form-group">
				<label for="newpwd">确认密码：&nbsp; </label>
				<span class="icon-email"></span>
				<input type="password" placeholder="请确认您的新密码" id="newpwd" required="required" />
			</div>
			<div class="form-group">
				<button class="btnCode">确认修改</button>
			</div>
		</div>
	</section>
</body>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/newpwd.js"></script>
	<script type="text/javascript">var basePath = "${pageContext.request.contextPath}"</script>
</html>