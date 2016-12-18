<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="../../css/iframe/bootstrap.min.css"/>
		<title>全部稿件</title>
	</head>
<body style="height: 480px;">
	<div class="col-md-3 col-md-push-8" style="margin: 70px 0;" id="foot">
			<div class="input-group">
				<div class="input-group-btn">
					<button id="chooseBtn" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">查询条件 <span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li><a href="#" data-search="filename">文件名</a></li>
						<li><a href="#" data-search="username">作者</a></li>
					</ul>
				</div>
				<input type="text" class="form-control" aria-label="..." placeholder="输入查询内容"/>
				<span class="input-group-btn">
			       <button class="btn btn-default" type="button" id="search">查找</button>
			    </span>
			</div>
		</div>
		<div class="text-right container">
			<div class="form-inline">
				<div class="form-group">
					<span id="pageNumber" class="text-info" style="margin:0 8px 5px 0; font-size: 15px;"></span>
				</div>
				<div class="form-group">
					<ul id="pagination-demo" class="pagination"></ul>
				</div>
			</div>
		</div>
</body>
	<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../../js/plug-in/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/plug-in/jquery.twbsPagination.js"></script>
	<script type="text/javascript" src="../../js/plug-in/jbase64.js"></script>
	<script type="text/javascript" src="../../js/iframe/super_editor/allArticles.js"></script>
	<script type="text/javascript">
		var path = "${pageContext.request.contextPath}"
		var author = "${sessionScope.user.realname}"
	</script>
</html>