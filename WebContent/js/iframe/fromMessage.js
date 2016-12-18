	var unicode = BASE64.decoder(window.location.toString().split('#!/')[1]);
	var number = '';  
	for(var i = 0 , len =  unicode.length ; i < len ;++i){  
		number += String.fromCharCode(unicode[i]);  
	}  
$(document).ready(function(event) {
		if(version === '0'){
			$.get(path + "/msg/read",{number: number})
		}
		$('#number').val(number)
		
		$('#again').on('click',function(){
			$('#over').css('display','block');
		})
		$('#over_close').click(function(){
			$('#over').css('display','none');
		});
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
		$('#ok').click(function(){
				if(is){
					var form = new FormData(document.getElementById('s_file'))
					var size = form.get('file').size
					if(size > 31457280){
						$('i').text('文件大于30M!')
					} else {
						document.getElementById('s_file').submit()
					}
				}
		})
		
	$.getJSON(path + "/msg/select",{number:number},function(data){
		var i = 0;
		$.each(data,function(index,val){
			var download = ''
			if(val.message.indexOf('-') != -1&&val.message.indexOf('20') != -1){
				download = '<a class="btn-xs" href="'+path+'/file/download/'+ val.number + '/' + (++i) +'">下载</a>'
			}
			$('.jumbotron .container').append('<div class="page-header">'
				+'<div class="page-title'+ index +'">'
			+'<h4>'+val.username+'&nbsp;&nbsp;&nbsp;&nbsp;<small>'+new Date(val.time).toLocaleString()+'</small></h4>'
		+'</div>'
			+'<div class="page-content">'
				+'<span>'+val.message+'&nbsp;&nbsp;'+ download +'</span>'
			+'</div>'
		+'</div>')
			if(username === val.username){
				$('.page-title'+index).css('color', '#4CAE4C')
			} else {
				$('.page-title'+index).css('color', '#198FEA')
			}
		})
	})
	
	$('form:first').submit(function(e){
		//阻止表单冒泡
		e.preventDefault();
	});
	
	$('input[name="title"]').val(number);
	
//	$('button').click(function(){
//		//AJAX提交表单
//		if($('textarea').val()){
//			$.post(path+'/message/insert',$('form:first').serialize(),function(data){
//				if(data){
//					alertFade($('button'))
//					setTimeout(function(){
//						window.location.reload(true);
//					}, 3300)
//				}
//					
//			})
//		}
//	})
});