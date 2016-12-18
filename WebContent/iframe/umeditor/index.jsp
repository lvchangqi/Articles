<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="./themes/default/css/umeditor.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="./third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="./umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="./umeditor.min.js"></script>
<script type="text/javascript" src="./lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
section {
	float: right;
	margin-top: 20px;
	margin-right: 10px;
}

section button {
	margin-left: 45px;
	background-color: #198fea;
	border-radius: 4px;
	width: 140px;
	height: 40px;
	color: #FFFFFF;
	font-size: 17px;
	letter-spacing: 2px;
	cursor: pointer;
	border: 0;
	font-weight: 700;
}
</style>
</head>
<body>
	<!--style给定宽度可以影响编辑器的最终宽度-->
	<script type="text/plain" id="myEditor"
		style="width: 99%; height: 300px;"></script>

	<div class="clear"></div>
	<section>
		<button id="sub" onclick="alertFade()">提交留言</button>
	</section>
	<script type="text/javascript">
		var um = UM.getEditor('myEditor');
		function getContent(content, number) {
			$.post('${pageContext.request.contextPath}/msg/insert', 
					{number:number,message:content,username:'${user.username}'},
					function(data) {
						$('button').attr('disabled','disabled');
						var alert = $(window.parent.document).find('#alert');
						alert.removeClass("alert-warning").addClass("alert-success")
						alert.html('<strong style="font-weight: 700;">留言成功</strong>')
						window.parent.location.reload();
					})
		}

		function alertFade(){
			var alert = $(window.parent.document).find('#alert');
			var number = window.parent.number
			var content = um.getContent()
			if(content){
				getContent(content, number)
			}else{
				alert.removeClass("alert-success").addClass("alert-warning")
				alert.html('<strong style="font-weight: 700;">留言失败</strong> 请填写所有必选项')
			}
			alert.fadeIn(1300,function(){
				$(this).fadeOut(3000);
			})
		}
	</script>

</body>
</html>