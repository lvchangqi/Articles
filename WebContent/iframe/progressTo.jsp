<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../css/iframe/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../css/control/font.css" />
		<style type="text/css">
			.page-header {
				margin-top: 10px;
			}
			
			.page-content {
				text-indent: 1em;
			}
			.page-content span{
				font-size: 16px;
			}
			#alert{
				top: 40% !important;
			}
		</style>
		<title>chat</title>
	</head>

	<body>
		<div id="alert" class="alert alert-success" role="alert" style="position: fixed; top:80px;left: 42%; display: none;"></div>
		<div class="jumbotron" style="padding: 10px;margin-bottom: 0;">
		<shiro:hasRole name="writer">
			<button class="btn btn-default" style="float: right;" id="again">再次上传</button>
		</shiro:hasRole>
			<div class="container" style="margin:0;padding: 0"></div>
		</div>
		<div id="over">
		<div id="alert">
			<div class="alert_top">
				<span>上传</span>
				<span id="over_close" style="font-weight: 900;">X</span>
			</div>
			<div class="alert_content">
				请确认您要上传的文件,只能上传doc,docx,pdf,zip,rar格式的文件,文件最大不能超过30M
			</div>
			<form class="box" action="${pageContext.request.contextPath}/file/upload" method="post" enctype="multipart/form-data" id="s_file">
					<input type="text" class="textbox" disabled="disabled" required="required"/>
					<input type="hidden" name="number" id="number"/>
					<a href="javascript:void(0);" class="link">浏览</a>
					<input type="file" class="uploadFile" name="file" required="required"/>
			</form>
			<input type="submit" value="确认上传" id="ok"/><br>
			<div style="text-align: center; font-weight: 800;">
				<i class=" text-danger"></i>
			</div>
		</div>
	</div>
		<iframe src="./umeditor/index.jsp"  scrolling="no" frameborder="0" width="100%"  onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe>
	</body>
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/plug-in/jbase64.js"></script>
	<script type="text/javascript" src="../js/iframe/fromMessage.js"></script>
	<script type="text/javascript">
		var path = '${pageContext.request.contextPath}'
		var username = '${user.username}'
		var version = '${version}'
	</script>
</html>