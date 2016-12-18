$(document).ready(function(event) {
			/* *
			 * *分页
			 * *对插件参数封装
			 * */
			//初始化查询
			$.get(path+"/file/page",{username:username},function(data){
				if(data[0]===0&&data[1]===0){
					$('<tr><td colspan="8" style="text-align: center;">您还未上传稿件</td></tr>').appendTo('tbody')
				} else
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
						$.post(path+"/file/list",{prefixLimit: (page-1)*10,username:username},function(data){
							if(data){
								$('tbody').children().remove();
								createTable(data)
							}
						});
						$('#pageNumber').text(page+'/'+data[0]+'页');
			  	  }
				});
			})
			
			function createTable(data){
				var arr = new Array();
				for (var i = 0, step = data.length; i < step; i++) {
					arr[i] = data[i].changes
					 var filename = '<a href='+ path +'/iframe/progressTo.jsp#!/'+BASE64.encoder(data[i].number)+'>'+data[i].filename.split('(1)-')[1]+'</a>'
					 var model_button = '<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target=".bs-example-modal-lg" data-i='+i+'>查看详情</button>'
					$('<tr><td>' + filename + '</td><td>'
								 + new Date(data[i].time).toLocaleDateString() + '</td><tr>'
								 ).appendTo('tbody');
				}
				$('button').click(function(){
					var i = $(this).attr('data-i')
					$('.inner').html(arr[i])
				})
			}
			
		});