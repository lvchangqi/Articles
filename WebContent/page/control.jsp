<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%session.setAttribute("login","true");%>
<%@include file="../commons/modal.jsp" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>网上投稿管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link type="text/css" rel="stylesheet" href="../css/style.css" />
		<link rel="stylesheet" type="text/css" href="../css/control/font.css" />
		<link rel="stylesheet" type="text/css" href="../css/control/iframe/file.css" />
	</head>
	<body>
		<div class="top"></div>
		<div id="header">
			<div class="logo"><span class="icon-file-text2"></span> 投稿管理</div>
			<div class="navigation">
				<ul>
					<li>欢迎您！</li>
					<li>${sessionScope.user.realname}</li>
					<li>|&nbsp;&nbsp;<a href="#openModal" onclick="$('#openModal').click()">修改密码</a></li>
					<li>|&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/loginOut">退出</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div class="left_menu">
				<ul id="nav_dot">
					<li>
						<h4 style="margin-top: 4px" id="menu-first"><span class="icon-file-text2"></span>稿件管理</h4>
						<div class="list-item none">
						<shiro:hasRole name="writer">
							<a href='#' class="up_file" class="onload">稿件上传</a>
							<a href='../iframe/progress.jsp' id="progress" class="onload">进度查询</a>
						</shiro:hasRole>
						<shiro:hasAnyRoles name="super_editor,secretary">
							<a href='../iframe/super_editor/allArticles.jsp' class="onload">全部稿件</a>
							<a href='../iframe/super_editor/articleResp.jsp'>稿件分配</a>
						</shiro:hasAnyRoles>
						<shiro:hasRole name="editor">
							<a href='../iframe/editor/article.jsp'>被分配稿件</a>
						</shiro:hasRole>
						</div>
					</li>
					<!--
					<li>
						<h4><span class="icon-chat"></span>留言管理</h4>
						<div class="list-item none">
						<shiro:hasRole name="writer">
							<a href='../iframe/FromMessage.jsp'>留言</a>
							<a href='../iframe/newMessage.jsp'>新消息</a>
						</shiro:hasRole>
						<shiro:lacksRole name="writer">
							<a href='../iframe/newMessage.jsp?isAll=1'>全部留言</a>
						</shiro:lacksRole>
						</div>
					</li>
					 -->
					<shiro:hasRole name="super_editor">
					<li>
						<h4><span class="icon-users"></span>用户管理</h4>
						<div class="list-item none">
							<a href='../iframe/super_editor/rolesServer.jsp'>权限管理</a>
						</div>
					</li>
					</shiro:hasRole>
				</ul>
			</div>
			<div class="m-right">
				<div class="right-nav">
					<ul>
						<li style="margin-left:25px;">您当前的位置：</li>
						<li><a href="#" id="right-nav_first">主页</a></li>
						<li style="display: none;">&gt;&nbsp;<a href="#" id="right-nav_next">最新公告</a></li>
					</ul>
				</div>
				<div class="main">
					<div class="welcome">欢迎来到湖北师范大学学报编辑部</div>
					<iframe src="" width="100%" onload="this.height=this.contentWindow.document.documentElement.scrollHeight" frameborder="0" border="0" marginwidth="0" marginheight="20px" scrolling="auto" allowtransparency="yes" style="display: none;"></iframe>
					<div style="display:none;" id="inner_file">
						<header>
							<div id="main">
								<article class="social" style="display:none">
									<img alt="社会科学投稿须知" src="../img/need/social.png">
								</article>
								<article class="natural" style="display:none">
									<img alt="自然科学投稿须知" src="../img/need/natural.png">								
								</article>
							</div>
						</header>
						<section>
							<button id="agree" onclick="return false;">上传文件</button>
						</section>
					</div>
				</div>
			</div>
		</div>
	<div id="over">
		<div id="alert">
			<div class="alert_top">
				<span>上传</span>
				<span class="icon-cross" id="over_close"></span>
			</div>
			<div class="alert_content">
				请确认您要上传的文件,只能上传doc,docx,pdf,zip,rar格式的文件,文件最大不能超过30M
			</div>
			<form class="box" action="${pageContext.request.contextPath}/file/upload" method="post" enctype="multipart/form-data" id="file">
					<input type="text" name="file" class="textbox" disabled="disabled" required="required"/>
					<a href="javascript:void(0);" class="link">浏览</a>
					<input type="file" class="uploadFile" name="file" required="required"/>
			</form>
			<input type="submit" value="确认上传"/><br>
			<div style="text-align: center; font-weight: 800;">
				<i class=" text-danger"></i>
			</div>
		</div>
	</div>
	</body>
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/menu.js"></script>
	<script type="text/javascript">
		var path = "${pageContext.request.contextPath}"
		var info = "${user.id}"
	</script>
	<script>navList(12);</script>
	<script type="text/javascript">
	$(function(){
		if('${version}' === '0'){
			$('section').css('margin-top','336px')
			$('.natural').css({
				'height': '785px',
				'display': 'block'
			})
			$('.social').css({
				'height':'785px',
				'display': 'none'
			})
		} else {
			$('section').css('margin-top','456px')
			$('.social').css({
				'height':'785px',
				'display': 'block'
			})
			$('.natural').css({
				'height':'785px',
				'display': 'none'
			})
		}
		$('#menu-first').click()
				
		var is = true
		$(".onload").click();
		$('.uploadFile').change(function(){
			$('i').text('')
			$('.textbox').val($(this).val())
			switch ($(this).val().split(".")[1]) {
			case 'doc':break;
			case 'docx':break;
			case 'pdf':break;
			case 'zip':break;
			case 'rar':break;
			default:
				$('i').text("文件格式不正确");
				is = false;
				break;
			}
		})
		$('input[type="submit"]').click(function(){
				if(is){
					var form = new FormData(document.getElementById('file'))
					var size = form.get('file').size
					if(size > 31457280){
						$('i').text('文件大于30M!')
					} else {
						$('#file').submit()
					}
				}
				return false;
		})
	})
	<!--对css进行微调-->
	</script>
</html>