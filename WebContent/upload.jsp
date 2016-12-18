<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="Apache"/>
		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/temp.css" />
		<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="js/fileUpload/upload.js"></script>
		<title>Insert title here</title>
	</head>
<body>
	<div id="over">
		<div id="alert">
			<div class="alert_top">
				<span>上传</span>
				<span class="icon-cross" id="over_close"></span>
			</div>
			<div class="alert_content">
				请确认您要上传的文件,只能上传doc,docx,pdf,zip,rar格式的文件,文件最大不能超过30M
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript">var path= "${pageContext.request.contextPath}"</script>
</html>