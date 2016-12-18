<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE Html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Apache" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../css/iframe/bootstrap.min.css" />
</head>

<body>
	<table
		class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>留言</th>
				<th>回复进度</th>
				<th>留言时间</th>
				<shiro:hasAnyRoles name="super_editor,editor">
					<th>回复留言</th>
				</shiro:hasAnyRoles>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	<div class="text-right container">
		<div class="form-inline">
			<div class="form-group">
				<span id="pageNumber" class="text-info"
					style="margin: 0 8px 5px 0; font-size: 15px;"></span>
			</div>
			<div class="form-group">
				<ul id="pagination-demo" class="pagination"></ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/iframe/newMessage.js"></script>
<script type="text/javascript" src="../js/plug-in/jquery.twbsPagination.js"></script>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath}"
	var author = "${sessionScope.user.information.realname}"
</script>
</html>