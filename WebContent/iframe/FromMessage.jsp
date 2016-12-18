<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>boostrap</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/iframe/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<style>
	.panel{
		margin: 0;
	}
	span{
		font-size: 20px;
		position: absolute;
		margin-top: 8px;
		margin-left: 8px;
		color:#999999;
	}
	select{
		color: #999999;
		border-radius:3px;
		border: 1px solid;
	}
	.btn{
		letter-spacing: 0.6em;
		line-height: 22px;
		font-size: 18px;
	}
</style>
</head>

<body>
	<form method="POST" action="${pageContext.request.contextPath}/message/insert">
	<input type="hidden" name="title" value=""/>
	<input type="hidden" value="" name="messageOwner"/>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
				<span class="icon-chat5"></span>
					<textarea class="form-control" rows="6" name="message"
						placeholder="请输入留言..." required="required" style="text-indent: 1.7em;font-size: 16px;"></textarea>
				</div>
			</div>
			<div class="panel-footer text-center">
				<button class="form-control btn btn-primary">确认</button>
			</div>
		</div>
	</form>
	<div id="alert" class="alert alert-success" role="alert" style="position: fixed; top:80px;left: 42%; display: none;">
	</div>
</body>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/iframe/fromMessage.js"></script>
<script type="text/javascript">
	
</script>
</html>