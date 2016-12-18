$(function(){
	$('a').attr('href',function(){
		return this.href + window.location.toString().split('#!')[1]
	})
})