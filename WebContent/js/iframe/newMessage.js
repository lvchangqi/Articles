$(document).ready(function(){
	
	$.get(path+"/message/read",function(data){
		if(data[0]===0&&data[1]===0){
			$('<tr><td colspan="8" style="text-align: center;">您还未留过言</td></tr>').appendTo('tbody')
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
				$.get(path+"/message/list",{prefixLimit: (page-1)*10,messageOwner: author,isAll:getUrlParam('isAll')},function(data){
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
		var button = '<button type="button" class="btn btn-info btn-xs">回复留言</button>'
		for (var i = 0, step = data.length; i < step; i++) {
			var title = '<a href='+ path +'/message/detail/'+data[i].title+'/none'+' '+'title="点击查看详情"'+'>'+data[i].title+'</a>' 
			
			$('<tr><td>' + title + '</td><td>'
						 + data[i].hasread + '</td><td class="forAnswer">'
						 + new Date(data[i].messageDate).toLocaleDateString() + '</td></tr>'
						 ).appendTo('tbody');
			
		}
		if($('th').size()===4){
			$('.forAnswer').after('<td>'+ button +'</td>')
		}
		$('button').click(function(){
			window.location.href = $(this).parent().siblings().children('a').attr('href').replace('none','block');
			//TODO:button使回复界面出现
		})
	}
	//得到URL入参
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return unescape(r[2]); return null;
	}
	
	$('a').click(function(e){
		e.stopPropagation();
	})
})