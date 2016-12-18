$(function() {
	//参数初始化
	var element = {
		page_url: path+'/commons/page', // 翻页参数[固定]
		change_url: path+'/commons/list', //翻页事件[固定]
		addClass: ['table', 'table-striped', 'table-bordered', 'table-condensed', 'table-hover'],
		thead: ['文件名','作者','上传时间','类型'],
		tablename: 'u_file', //表名
	}
	
	function createTable(data){
		if(typeof data == 'object')
		for (var i = 0, step = data.length; i < step; i++) {
			if(data[i].progress=='未通过'){
				continue;
			}
			var download_file = '<a href='+ path +'/file/download/'+data[i].filename+'>'+data[i].filename+'</a>'
			var pass = '<button class="btn btn-info btn-xs" data-name='+data[i].filename+'>通过</button>'
			var nopass = '<button class="btn btn-danger btn-xs" data-name='+data[i].filename+'>不通过</button>' 
			var buttonPlace = data[i].progress == '通过'||data[i].progress == '未通过' ? '审核已结束' : pass+ '&nbsp;&nbsp;' +nopass
					
			$('<tr><td>' + download_file + '</td><td>'
					 + data[i].author + '</td><td>'
					 + new Date(data[i].date).toLocaleDateString() + '</td><td>'
					 + data[i].species + '</td></tr>'
					 ).appendTo('tbody');
		}
		
		var comButton = $('<button class="btn btn-info btn-xs">是</button>');
		var nagButtom = $('<button class="btn btn-danger btn-xs">否</button>');
		var $no = '';
		$('button').click(function(){
			$no = $(this).attr('data-name').substring(0,9)
			if($(this).text() === '通过'){
				$(this).parent().html('<small class="text-warning">是否确认?</small>')
				nagButtom.insertAfter('small')
				nagButtom.before('&nbsp;')
				comButton.insertAfter('small')
			} else if($(this).text() === '不通过'){
				window.location.href = path + '/commons/email.jsp?article=' + $no ;
			}
		})
		
		comButton.click(function(){
			$.post(path+'/article/updateStatus',{article: $no,progress: '通过'},function(data){
				if(data) window.location.reload(true);
			})
		})
		nagButtom.click(function(){
			window.location.reload(true)
		})
	}
	
	function searchFor(element){
		$.get(element.page_url,{tableName: element.tablename},function(data){
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
						$.get(element.change_url,{prefixLimit: (page-1)*10, tableName: element.tablename},
								function(data){
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
		if(!search || !$('input').val()) return;
		$.get(element.change_url,{search: search, tableName: element.tablename, val: $('input').val()},
				function(data){
			if(data){
				$('tbody').children().remove();
				createTable(data)
				
//				$.get(element.page_url,{tableName: element.tablename},function(data){
//					if(data[0]===0&&data[1]===0){
//						$('<tr><td colspan="8" style="text-align: center;">暂无稿件</td></tr>').appendTo('tbody')
//					}else{
//						$('#pageNumber').text(page+'／'+data[0]+'页');
//					}
//				});
			}
		});
		
	})
})