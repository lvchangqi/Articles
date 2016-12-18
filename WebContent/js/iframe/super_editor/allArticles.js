$(function() {
	//参数初始化
	var element = {
		addClass: ['table', 'table-striped', 'table-bordered', 'table-condensed', 'table-hover'],
		thead: ['文件名','作者','上传时间','查看详情 '],
	}
	
	function createTable(data){
		if(typeof data == 'object')
		for (var i = 0, step = data.length; i < step; i++) {
			var btn = '<a class="btn btn-primary btn-xs" href='+ path +'/iframe/progressTo.jsp#!/'+BASE64.encoder(data[i].number)+'>查看详情</a>'
			var img = ''
			if(data[i].progress === 0){
				img = '<span style="font-width:400;color:red;font-size:10px;position:absolute;margin:1px 0 0 3px">*new</span>'
			}
			$('<tr><td>' + data[i].filename.split("(1)-")[1] +img
					 + '</td><td><a href="javascript:void(0)" data-name="'+data[i].username+'" class="author">'
					 + data[i].username + '</a></td><td>'
					 + new Date(data[i].time).toLocaleDateString() + '</td><td>'
					 + btn + '</td></tr>'
					 ).appendTo('tbody');
		}
		
		$('.author').on('click',function(){
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
		
	}
	
	function searchFor(element){
		$.get(path+"/file/page" ,function(data){
			if(data[0]===0&&data[1]===0){
				$('<tr><td colspan="8" style="text-align: center;">暂无稿件</td></tr>').appendTo('tbody')
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
						$.post(path+"/file/list",{prefixLimit: (page-1)*10},
								function(data){
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

	var tablePlugin = function(element) {
		$('<table><thead><tr></tr></thead><tbody></tbody></table>').insertBefore('#foot');
		
		for (var i = 0, step = element.addClass.length; i < step; i++) {
			$('table').addClass(element.addClass[i])
		}
		
		for (var i = 0, step = element.thead.length; i < step; i++) {
			$('thead').children().append('<th>'+element.thead[i]+'</th>')
		}
		
		searchFor(element)
	
	}
	
	tablePlugin(element)
	
	var search;
	$('.dropdown-menu').find('a').click(function(){
		search = $(this).attr('data-search')
		$('#chooseBtn').html($(this).text()+'<span class="caret"></span>')
	})
	$('#search').click(function(){
		if(!search || !$('input').val()){
			alert('请确定查询条件和输入查询内容')
			return;
		}
		$.post(path+"/file/search",{condition: search, value: $('input').val()},
				function(data){
			if(data){
				$('tbody').children().remove();
				createTable(data)
			}
		});
		
	})
})