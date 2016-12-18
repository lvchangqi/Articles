$(function() {
	//参数初始化
	var element = {
			page_url: path+'/file/page', // 翻页参数[固定]
			change_url: path+'/file/list', //翻页事件[固定]
			addClass: ['table', 'table-striped', 'table-bordered', 'table-condensed', 'table-hover'],
			thead: ['文件名','作者','审核编辑','确认委派'],
		}
	
	function createTable(data){
		if(data.length>0){
			var button = '<button type="button" class="btn btn-primary btn-sm">确认委派</button>'
				for (var i = 0, step = data.length; i < step; i++) {
						$('<tr><td data-num="'+ data[i].number +'">' + 
								data[i].filename.split("(1)-")[1] + '</td><td>'
									 + data[i].username + '</td>'
									 + '<td role="select"></td><td>'
									 + button +'</td></tr>'
						).appendTo('tbody');
				}
		} else {
			$('<tr><td colspan="8" style="text-align: center;">暂无稿件</td></tr>').appendTo('tbody')
		}
		
		$('td[role="select"]').append(
				$('<select name="editorName" required="required" role="1" style="width: 139px;">'
				  +	'<option value="">---请选择编辑---</option>' +
				'</select>'))
				
		$('select').bind('mouseover', function() {
			$('select option:first-child').attr('hidden','hidden').siblings().remove()
				$.getJSON(path + "/user/select", {
						role : $(this).attr('role'),
						version: version
					}, function(data) {
						for(var i=0,size=data.length;i<size;i++){
							$('<option></option>').attr('value',data[i].username)
							.text(data[i].realname).appendTo('select')
						}
					}).then(function(){
						$('select').unbind('mouseover')
					});
				});	
		
		$('button').click(function(){
			var ename = $(this).parent().siblings().children().val()
			var number = $(this).parent().siblings().attr('data-num')
			if(ename){
				$.post(path+ "/paper/create", {ename: ename, number: number},
						function(data){
					if(data)
						alert('分配成功')
						window.location.reload(true);
				});
			} else {
				$(this).parent().siblings().children().css('box-shadow','0 1px 7px red,1px 1px 1px red inset ');
			}
			
		});
		$('select').click(function(){$(this).css('box-shadow','0 0 0')})
	}
	
	var tablePlugin = function(element) {
		$('body').append('<table><thead><tr></tr></thead><tbody></tbody></table>');
		
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
		
		$.get(path+"/file/page",function(data){
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
						$.post(path+"/file/list",{prefixLimit: (page-1)*10, progress: 1},function(data){
							if(data){
								$('tbody').children().remove();
								createTable(data)
							}
						});
						$('#pageNumber').text(page+'／'+data[0]+'页');
			  		}
			});				
		})
	}
	
	tablePlugin(element)
})
