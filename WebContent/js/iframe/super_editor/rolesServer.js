$(function() {
	//参数初始化
	var element = {
			addClass: ['table', 'table-striped', 'table-bordered', 'table-condensed', 'table-hover'],
			thead: ['用户名','当前身份','修改身份 ','确认修改'],
		}
	
	function createTable(data){
		var select = '<select name="role" style="width: 139px"><option value="">---请选择身份---</option></select>'
		var btn = '<button class="btn btn-primary btn-xs">确认修改</button>'
			
		for (var i = 0, step = data.length; i < step; i++) {
			if(data[i].role != 0){
				$('<tr><td><a href="javascript:void(0)" data-name="'+data[i].username+'" class="editor">' + data[i].username + '</a></td><td>'
						 + aliasName(data[i].role) + '</td><td>'
						 + select + '</td><td>'
						 + btn + '</td></tr>'
				).appendTo('tbody');
			}
		}
		$('select').append('<option value="3">作者</option><option value="1">编辑</option>')
		$('select').change(function(){
			$(this).parent().siblings().find('button').attr('role',$(this).val())
		})
		$('button').click(function(){
			var role = $(this).attr('role')
			var username = $(this).parent().siblings()[0].innerHTML
			if(role){
				role = role == 3 ? null : 1
				$.post(path+'/role/role',{role:role ,username:username},function(data){
					if(data) 
						alert('修改成功!')
						window.location.reload(true);
				})
			}
		})
	}
	
	$('tbody').on('click','.editor',function(){
		var _this = $(this)
		$.get(path+'/user/info', {username: _this.attr('data-name')},function(data){
			if(data.address==null){
				data.address = '未填写'
			}
			if(data.qq==null){
				data.qq = '未填写'
			}
		}).then(function(data){
			_this.popover({
				title: '<span style="font-weight:700">个人信息</span>', 
				html: true,
				content: '<span style="font-weight:700">姓名 :</span>'+data.realname+'<br/>'+'<span style="font-weight:700">地址 :</span>'+data.address+'<br/>'+'<span style="font-weight:700">QQ :</span>'+data.qq+'<br/>'+'<span style="font-weight:700">邮箱 :</span>'+data.email+'<br/>'+'<span style="font-weight:700">电话号码 :</span>'+data.phone,
				trigger: 'focus'
			});
			_this.popover('show')
		})
	})
	
	var aliasName = function(role){
		var result = 'bug';
		switch (role) {
		case 1:result = '责任编辑'
			break;
		case 0:result = '主编'
			break;
		default:result = '未分配/读者'
			break;
		}
		return result
	}

	var tablePlugin = function(element) {
		
		for (var i = 0, step = element.addClass.length; i < step; i++) {
			$('table').addClass(element.addClass[i])
		}
		
		for (var i = 0, step = element.thead.length; i < step; i++) {
			$('thead').children().append('<th>'+element.thead[i]+'</th>')
		}
		
		$('<div class="text-right container">'+
			'<div class="form-inline">'+
				'<div class="form-group">'+
					'<span id="pageNumber" class="text-info" style="margin:0 8px 5px 0; font-size: 15px;"></span>'+
				'</div>'+
				'<div class="form-group">'+
					'<ul id="pagination-demo" class="pagination"></ul>'+
				'</div>'+
			'</div>'+
		'</div>').insertAfter('table')
		
		$.get(path+"/role/page" ,function(data){
			if(data[0]===0&&data[1]===0){
				$('<tr><td colspan="8" style="text-align: center;">暂无用户</td></tr>').appendTo('tbody')
			}
			else
			$('#pagination-demo').twbsPagination({
					first: '首页',  
			        prev: '前一页',  
			        next: '下一页',  
			        last: '尾页',
					totalPages: data[0],
					visiblePages: data[1],
					version: 1.1,
					onPageClick: function(event, page) {
						//点击之后分页参数
						$.post(path+"/role/list",{prefixLimit: (page-1)*10},function(data){
							if(data){
								$('tbody').children().remove();
								createTable(data)
							}
						});
						$('#pageNumber').text(page+'/'+data[0]+'页');
			  		}
			});				
		})
	}
	
	tablePlugin(element)
})