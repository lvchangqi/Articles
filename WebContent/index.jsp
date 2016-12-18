<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<title>Article</title>
	</head>
	<body>
	<jsp:include page="commons/header.jsp"/>
		<section class="container">
			<div class="online">
			<div class="title">
				<span class="icon-earth"></span>
				<span>稿件管理平台</span>
			</div>
			<ul>
				<a href="login.jsp#!"><li>作者投稿</li></a>
				<a href="login.jsp#!/1"><li>编辑办公</li></a>
				<a href="login.jsp#!/0"><li>主编办公</li></a>
			</ul>
			</div>
			<div class="message">
				<div class="title me">
					<span class="icon-unmute"></span>
					<span>信息公告</span>
				</div>
				<div class="title-main">
					<span style="letter-spacing: 2.3px;line-height: 24px; font-size: 17px;">
						<font style="margin-left: 2em;font-weight: 600;">各位作者朋友你们好:</font><br><br>
						<font style="margin-left: 2em; ">您可以通过登录湖北师范大学学报稿件管理平台，注册后，即可通过上传的方式进行投稿，也可通过稿件管理平台查询您的稿件审阅情况，并可随时与我们编辑进行互动交流。</font><br><br>
						<font style="margin-left: 2em;">欢迎投稿</font>
					</span>
				</div>
			</div>
		</section>
		
	</body>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript">
		var path= "${pageContext.request.contextPath}"
		if('${login}'){
			alert('您已经登录，请勿重复登录')
			window.history.go(-1)
		}
	</script>
</html>