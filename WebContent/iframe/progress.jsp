<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="../css/iframe/bootstrap.min.css" />
	</head>

	<body style="height: 480px;">
		<table class="table table-striped table-bordered table-condensed table-hover">
			<thead>
				<tr>
					<th>文件名</th>
					<th>上传时间</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
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
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="inner" style="text-indent: 2em;margin: 40px 0;">
		      	
		      </div>
		    </div>
		  </div>
		</div>
	</body>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/plug-in/jbase64.js"></script>
<script type="text/javascript" src="../js/iframe/progress.js"></script>
<script type="text/javascript" src="../js/plug-in/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/plug-in/jquery.twbsPagination.js"></script>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath}"
	var username = "${sessionScope.user.username}"
</script>
</html>