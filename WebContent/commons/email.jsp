<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>文本编辑</title>
<link rel="stylesheet" href="../css/commons/font-awesome.css" />
<link rel="stylesheet" href="../css/commons/simditor.css" />
<style>
.simditor-placeholder {
	margin-top: -7px;
}

p {
	line-height: 10px;
}

.btn {
	margin-top: 10px;
	float: right;
	width: 100%;
	height: 38px;
	border-radius: 5px;
	background-color: #337AB7;
	border: 1px solid #ccc;
	color: #FFFFFF;
	font-size: 19px;
}

.btn:hover {
	background-color: #286090;
}
</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/commons/email" method="post">
		<textarea id="editor" name="mail" required="required"></textarea>
		<input type="hidden" name="article" />
		<input type="hidden" name="progress" />
		<button class="btn">确认并发送邮件</button>
	</form>
	<div id="alert" class="alert alert-success" role="alert" style="position: fixed; top:80px;left: 42%; display: none;"></div>
</body>
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/plug-in/simditor-all.min.js"></script>
<script>
	$(function() {
		toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough',
				'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', 'hr',
				'|', 'indent', 'outdent' ];
		var editor = new Simditor({
			textarea : $('#editor'),
			placeholder : '请在这里输入需要反馈给作者的内容...(输入时请先按空格)',
			toolbar : toolbar, //工具栏
		});
		$('input[name="article"]').val(getUrlParam('article'));
		$('input[name="progress"]').val(getUrlParam('progress'));
		
		$('button').click(function(){
			$('#alert').html('<strong style="font-weight:700; color:#66cc33">正在发送邮件</strong>').fadeIn(1300,function(){
				$(this).fadeOut(3000);
			})
		})
	})
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return unescape(r[2]); return null;
		}
</script>
</html>