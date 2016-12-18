$(function() {
	
	//参数初始化
	var element = {
		 addClass: ['table', 'table-striped', 'table-bordered', 'table-condensed', 'table-hover'],
		 thead: ['文件名','详情'],
	}
	
	function createTable(data){
		var array = new Array()
		for (var i = 0, step = data.length; i < step; i++) {
			array.push(data[i].number)
			var filename = '<a class="a-'+ data[i].number +'" href='+ path +'/iframe/progressTo.jsp#!/'+BASE64.encoder(data[i].number)+'>'+data[i].filename.split('(1)-')[1]+'</a>'
			$('<tr><td>' + filename + '</td><td>'
						+'<a href="javascript:void(0)" data-name="'+data[i].username+'" class="author">'
						+ data[i].username + '</a></td></tr>'
				).appendTo('tbody');
		}
		
		var args = ''
		$.each(array,function(i,v){
			args += v + ","
			if(i === (array.length-1)){
				args = args.substring(0, args.lastIndexOf(','))
			}
		})
		$.post(path+'/paper/new',{args:args},function(data){
			if(!$.isEmptyObject(data)){
				$.each(data,function(i,v){
					$('.a-'+ v.number).after('<span class="badge" style="margin-left:10px;">&nbsp;'+ v.counts +'&nbsp;</span>')
				})
			}
		})
		
	}
	$('tbody').on('click','.author',function(){
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
		
		$.get(path+'/paper/page', function(data){
			if(data[0]===0&&data[1]===0){
				$('<tr><td colspan="8" style="text-align: center;">暂无被分配稿件</td></tr>').appendTo('tbody')
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
						$.post(path+'/paper/list',{prefixLimit: (page-1)*10},function(data){
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