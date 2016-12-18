$(function(){
	
	if(jsonObj.message){
		var pro = jsonObj.message.hasread == 'NO' ? '未回复' : '已回复';
		$('#title').text(jsonObj.message.title).siblings('small').text(pro);
		$('time small').text(new Date(jsonObj.message.messageDate).toLocaleDateString().replace('/', '-').replace('/', '-'))
		$('#question').text(jsonObj.message.message);
		if(jsonObj.message.answer){
			$('#editor').text('回复编辑: '+jsonObj.message.editorName.substring(0,1)+"编辑")
			$('#answer').text(jsonObj.message.answer);
		} else {
			$('#anwser-panel').css('display','none');
		}
	}
	
	$('#forAnswer').css('display',jsonObj.display)
	$('button').click(function(){
		//回复留言事件
		var textVal = $('textarea').val()
		if(textVal){
			$.post(path+'/message/updateAnswer',{answer:textVal,title:jsonObj.message.title},function(data){
				if(data){
					window.location.reload(true)
				}
			});
		}
	})
})