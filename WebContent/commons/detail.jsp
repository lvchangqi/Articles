<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<title>留言列表</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/iframe/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
		<style>
			p{
				text-indent: 2em;
				color:#999999;
				font-size: 15px;
				line-height: 1.8em;
			}
			time,span{
				font-size: 18px;
			}
		</style>
	</head>

	<body>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="container" style="width: 100%;">
					<div class="row">
						<div class="col-md-5">
							<span class="text-danger" id="title">这个页面是bug</span>
							<span class="text-danger">&nbsp;&nbsp;|&nbsp;</span>
							<small class="text-danger">已回复</small>
						</div>
						<div class="col-md-offset-10">
							<time style="color: #999999;">
								<span class="icon-calendar"></span>
								<small>2016-1-13 10:20</small>
							</time>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<div class="container" style="width: 100%;">
					<p id="question">如果看到这个页面说明程序出了bug<p>
				<div id="anwser-panel">
							<hr/>
					<div class="row" style="margin-bottom: 20px;">
						<span class="col-md-10 text-danger">回复:</span>
						<span style="color: #999999;"><small id="editor">回复编辑: 作者</small></span>
					</div>
					<p style="color:#101010" id="answer">但是有什么卵用呢,反正有bug我也不会改的╮(╯▽╰)╭</p>
				</div>
				</div>
			</div>
		</div>
		
		<shiro:lacksRole name="writer">
			<div class="panel panel-default" id="forAnswer" style="display: none">
			  <div class="panel-body">
			    <textarea class="form-control" placeholder="编辑请在这里回复/修改留言.." required="required"></textarea>
			   </div>
			  <div class="panel-footer text-right">
			  	<button type="button" class="btn btn-primary">回   复</button>
			  </div>
			</div>
		</shiro:lacksRole>
		</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/iframe/detail.js"></script>
	<script type="text/javascript">
		var jsonObj = ${requestScope.json};
		var path =	"${pageContext.request.contextPath}"
	</script>
</html>