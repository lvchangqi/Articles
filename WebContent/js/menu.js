$(document).ready(function(event){
	$('#content').find('a').not($('.up_file')).click(function(){
		$('#inner_file').css('display','none');
		$('.welcome').css('display','none');
		$('iframe').css('display','block').attr('src',$(this).attr('href'));
		//消息提示清空
		if($('iframe').attr('src').indexOf("newMessage")+1){
			$('.oval').children('span').text('0')
		}
		return false;
	});
	$('.up_file').click(function(){
		$('iframe').css('display','none');
		$('.welcome').css('display','none');
		$('#inner_file').css('display','block');
		return false;
	});
	var child;
	$('#agree').click(function(){
//		$.get(path+'/file/uuid',function(data){
//			if(data){
//				$('input[name="uuid"]').val(data)
//				$('#uuid').text(data)
//			}
//			
//		})
		$('input[name="file"]').val('')
//		$('#uuid-group').html(child)
		$('#over').css('display','block');
	});
//	$('#reagree').click(function(){
//		var element ='编号: '+'<input id="ipt-uuid" type="text"required="required" maxlength="9"/><br/><span style="color:red;">再次上传时,请在上方输入您首次上传稿件时的稿件编号</span>'
//		child = $('#uuid-group').html()
//		$('#uuid-group').html(element)
//		$('#uuid-group').css({
//			'padding-top':'10px',
//			'margin-left':'-10px',
//		})
//		$('#ipt-uuid').keyup(function(){
//			if($(this).val().length===9){
//				if($(this).val().match( new RegExp('20+[1-9]{2}-[0-9]{4}'))){
//					$('input[name="uuid"]').val($(this).val())
//				} else {
//					alert('编号格式不正确');
//					$(this).val('')
//				}
//			}
//			
//		})
//		
//		$('input[name="file"]').val('')
//		$('#over').css('display','block');
//	});
	
	$('#over_close').click(function(){
		$('#over').css('display','none');
	});
	//面包屑导航
	$('h4').click(function(){
		$('#right-nav_first').text($(this).text());
		$('#right-nav_next').parent().css('display','none');
	});
	$('h4').siblings().find('a').click(function(){
		$('#right-nav_next').text($(this).text().replace("0","")).parent().css('display','block');
	});
	$('a').click(function(){
		if(!info){
			window.location.replace(path + "/index.jsp");
		}
	})
});

//导航菜单
function navList(id) {
    var $obj = $("#nav_dot"), $item = $("#J_nav_" + id);
    $item.addClass("on").parent().removeClass("none").parent().addClass("selected");
    $obj.find("h4").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });
    $obj.find("p").hover(function () {
        if ($(this).hasClass("on")) { return; }
        $(this).addClass("hover");
    }, function () {
        if ($(this).hasClass("on")) { return; }
        $(this).removeClass("hover");
    });
    $obj.find("h4").click(function () {
        var $div = $(this).siblings(".list-item");
        if ($(this).parent().hasClass("selected")) {
            $div.slideUp(600);
            $(this).parent().removeClass("selected");
        }
        if ($div.is(":hidden")) {
            $("#nav_dot li").find(".list-item").slideUp(500);
            $("#nav_dot li").removeClass("selected");
            $(this).parent().addClass("selected");
            $div.slideDown(500);

        } else {
            $div.slideUp(600);
        }
    });
}

/****表格隔行高亮显示*****/
window.onload=function(){
	oTable=document.getElementById("tab");//找表格
	aTr=document.getElementsByTagName("tr");//找所有的行
	for(i=0;i<aTr.length;i++){
		if(i%2==0){
			aTr[i].style.background="#fff";	
		}else{
			aTr[i].style.background="#ccc";	
		};
	};
};
