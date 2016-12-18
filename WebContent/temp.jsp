<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>没标题</title>
		<style>
			
			a:link, a:visited {
				 text-decoration: none;
				 color:black;
			}
			a:hover{
				color: red;
			}
			.container {
				width: 1340px;
				height: auto;
			}
			
			.container .banner {
				background-image: url(img/banner.jpg);
				background-repeat: no-repeat;
				height: 290px;
				width: 998px;
				margin: 0 auto;
			}
			
			.container .left-box {
				width: 270px;
				height: 162px;
				float: right;
				margin-top: 20px;
				margin-right: 170px;
				background: url(img/left.jpg) no-repeat;
			}
			.container .left-box .left{
				margin-top: 40px;
				margin-right: 20px;
			}
			
			.container .left-box .left li {
				list-style-type: none;
				margin: 4px 20px 4px 0;
				height: 40px;
				border: 1px solid #F1F1F1;
				border-radius: 5px;
				background-color: #F8F9FB;
				font-size: 19px;
				font-weight: 600;
				text-align: center;
				line-height: 39px;
				cursor: pointer;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="banner">

			</div>
			<div class="left-box">
			<ul class="left">
				<a href="${pageContext.request.contextPath}/commons/session/natural"><li>自然科学版</li></a>
				<a href="${pageContext.request.contextPath}/commons/session/social"><li>社会哲学版</li></a>
			</ul>
			</div>
		</div>
	</body>
</html>