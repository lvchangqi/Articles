<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="Apache"/>
		<link rel="stylesheet" href="../../css/iframe/bootstrap.min.css"/>
		<title>Insert title here</title>
	</head>
<body>

</body>
	<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../../js/plug-in/jquery.twbsPagination.js"></script>
	<script type="text/javascript" src="../../js/iframe/super_editor/articleResp.js"></script>
	<script type="text/javascript">
		var path = "${pageContext.request.contextPath}"
		var author = "${sessionScope.user.realname}"
		var version = "${version}"
	</script>
</html>