<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎访问湖北师范学院学报！</title>
<style type="text/css">
/* common styling */
/* set up the overall width of the menu div, the font and the margins */
#header {	background-image: url(images/bj2.jpg);
	background-repeat: repeat;
	margin: 0 auto;
	padding: 0px;
	width: 1000px;
	height:320px;
}
#header #title {float: right;height: 30px;width:300px;font-size:12px;padding-top:5px;margin:0px;
}
#header #banner {background-image: url(images/header.gif);background-repeat: no-repeat;height: 239px;width: 993px;margin:0px 3px;-margin:0px 2px;float:left;
}
.menu {
	font-family: arial, sans-serif;
	width:814px;
	height:40px;
	float:left;
	margin-top: 5px;
	margin-right: 0px;
	margin-bottom: 5px;
	margin-left: 5px;
	-margin-left: 2px;
}
/* remove the bullets and set the margin and padding to zero for the unordered list */
.menu ul {
padding:0; 
margin:0;
list-style-type: none;
}
/* float the list so that the items are in a line and their position relative so that the drop down list will appear in the right place underneath each list item */
.menu ul li {
float:left; 
position:relative;
}
/* style the links to be 104px wide by 30px high with a top and right border 1px solid white. Set the background color and the font size. */
.menu ul li a, .menu ul li a:visited {
display:block; 
text-align:center; 
text-decoration:none; 
width:90px; 
height:34px; 
color:#000; 
border:1px solid #C1C0C0;
border-width:1px 1px 0 0;
background:url(images/nav.gif) repeat-x;
line-height:30px; 
font-size:11px;
}
 .menu .bg1 a, .menu .bg1 a:visited{
display:block; 
text-align:center; 
text-decoration:none; 
width:85px; 
height:34px; 
color:#000; 
border:1px solid #C1C0C0;
border-width:1px 1px 0 0;
background:url(images/nav11.gif);
line-height:30px; 
font-size:11px;
}
 .menu .bg2 a, .menu .bg2 a:visited{
display:block; 
text-align:center; 
text-decoration:none; 
width:175px; 
height:34px; 
color:#EE2B11; 
border:1px solid #C1C0C0;
border-width:1px 1px 0 0;
background:url(images/bg2.gif);
line-height:30px; 
font-size:11px;
}
/* make the dropdown ul invisible */
.menu ul li ul {
display: none;
}

/* specific to non IE browsers */
/* set the background and foreground color of the main menu li on hover */
.menu ul li:hover a {
color:#fff; 
background: url(images/bg3.gif) repeat-x;
}
 .menu .bg1:hover a{
color:#fff; 
background: url(images/bg3.gif) repeat-x;
}
/* make the sub menu ul visible and position it beneath the main menu list item */
.menu ul li:hover ul {
display:block; 
position:absolute; 
top:34px; 
left:0; 
width:105px;
}
/* style the background and foreground color of the submenu links */
.menu ul li:hover ul li a {
display:block; 
background:#faeec7; 
color:#000;
}
 .menu .bg1:hover ul li a{
display:block; 
background:#faeec7; 
color:#000;
}

/* style the background and forground colors of the links on hover */
.menu ul li:hover ul li a:hover {
background:#dfc184; 
color:#000;
}
 .menu .bg1:hover ul li a:hover {
background:#dfc184; 
color:#000;
}
#header .bg3 {width:170px; height:35px;background: url(images/nav18.gif) no-repeat; margin-top:5px; padding:0; float:left; line-height:35px; color:#FF0000; font-size:12px; text-align:center;
}
</style>
<!--[if lte IE 6]>

<style type="text/css">

/* styling specific to Internet Explorer IE5.5 and IE6. Yet to see if IE7 handles li:hover */

/* Get rid of any default table style */
table {
border-collapse:collapse;
margin:0; 
padding:0;
}
/* ignore the link used by 'other browsers' */
.menu ul li a.hide, .menu ul li a:visited.hide {
display:none;
}
/* set the background and foreground color of the main menu link on hover */
.menu ul li a:hover {
color:#fff; 
background:#ed6116;
}

/* make the sub menu ul visible and position it beneath the main menu list item */
.menu ul li a:hover ul {
display:block; 
position:absolute; 
top:34px; 
left:0; 
width:105px;
}
/* style the background and foreground color of the submenu links */
.menu ul li a:hover ul li a {
background:#faeec7; 
color:#000;
}
/* style the background and forground colors of the links on hover */
.menu ul li a:hover ul li a:hover {
background:#dfc184; 
color:#000;
}

</style>

<![endif]-->
 <script language="">function click() {if (event.button==2) {window.external.addFavorite('http://localhost:8080/<%=basePath%>') }}document.onmousedown=click</script>
</head>

<body>
<%
	int y,m,d,q;
	String xq = "";
	Calendar c = Calendar.getInstance();
	y = c.get(Calendar.YEAR); //年
	m = c.get(Calendar.MONTH) + 1; //月
	d = c.get(Calendar.DAY_OF_MONTH); //日
	q = c.get(Calendar.DAY_OF_WEEK); //星期
	if(q==1) xq = "星期天";
	if(q==2) xq = "星期一";
	if(q==3) xq = "星期二";
	if(q==4) xq = "星期三";
	if(q==5) xq = "星期四";
	if(q==6) xq = "星期五";
	if(q==7) xq = "星期六";
 %>

<div id="header">
<div id="title">
  <table width="340" border="0">
    <tr>
      <td width="10"><div align="right"><img src="images/1.jpg" width="10" height="10" /></div></td>
      <td width="50"><a href="javascript:void(0)" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%=basePath%>');">设为首页</a></td>
      <td width="11"><img src="images/2.jpg" width="11" height="9" /></td>
      <td width="50"><a href="javascript:window.external.AddFavorite('<%=basePath%>')" target=_self>加入收藏</a></td>
      <td width="10"><img src="images/3.jpg" width="10" height="8" /></td>
      <td width="50"><a href="mailto:lvchangqi201@vip.qq.com" title="675812074">联系我们</a></td>
      <td width="78"><a style="color:red;" href="<%=basePath%>back/admin_login.jsp">后台管理入口</a></td>
    </tr>
  </table>
</div>
<div id="banner"></div>
<div class="menu">
<ul>
<li class="bg1"><a class="hide" href="<%=basePath%>NewsServlet?action=selectByNflag">本站首页</a>

<!--[if lte IE 6]>
<a  href="NewsServlet?action=selectByNflag">本站首页
<table><tr><td>
<![endif]-->

    <ul>

  
    </ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>

<![endif]-->

</li>
<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=6&type2=1">哲学社会科学版</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=6&type2=1">哲学社会科学版
<table><tr><td>
<![endif]-->

    <ul>
 
    </ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>
<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=7&type2=1">自然科学版</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=7&type2=1">自然科学版
<table><tr><td>
<![endif]-->

    <ul>
   
    </ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=1&type2=1">行业动态</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=1&type2=1">行业动态
<table><tr><td>
<![endif]-->

  <!--    <ul>
    <li><a href="NewsServlet?action=queryByType&type1=1&type2=1" title="a coded list of spies">文字报道</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=1&type2=2" title="a horizontal vertical menu">图片新闻</a></li>
    </ul>
   -->
<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=2&type2=1">规章制度</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=2&type2=1">规章制度
<table><tr><td>
<![endif]-->
  <!-- 
    <ul>
    <li><a href="NewsServlet?action=queryByType&type1=2&type2=1" title="Cross browser fixed layout">国家法规</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=2&type2=2" title="Cross browser fixed layout">工作制度</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=2&type2=3" title="Cross browser fixed layout">工作规定</a></li>
   
    </ul>
 -->
<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=3&type2=1">服务指南</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=3&type2=1">服务指南
<table><tr><td>
<![endif]-->
  <!-- 
    <ul>
    <li><a href="NewsServlet?action=queryByType&type1=3&type2=1" title="Cross browser fixed layout">课件下载</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=3&type2=2" title="Cross browser fixed layout">表格下载</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=3&type2=3" title="Cross browser fixed layout">栏目导航</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=3&type2=4" title="Cross browser fixed layout">考研指南</a></li>
    <li><a href="NewsServlet?action=queryByType&type1=3&type2=5" title="Cross browser fixed layout">成绩查询</a></li>
    </ul>
 -->
<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=4&type2=1">编辑风采</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=4&type2=1">编辑风采
<table><tr><td>
<![endif]-->

    <ul>
   
    </ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="<%=basePath%>NewsServlet?action=queryByType&type1=5&type2=1">学报荣誉</a>

<!--[if lte IE 6]>
<a href="NewsServlet?action=queryByType&type1=5&type2=1">学报荣誉
<table><tr><td>
<![endif]-->

    <ul>
    </ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

<li><a class="hide" href="<%=basePath%>Liu?action=list">交流互动</a>

<!--[if lte IE 6]>
<a href="Liu?action=list">交流互动
<table><tr><td>
<![endif]-->
    <ul>
    </ul>

<!--[if lte IE 6]>
</td></tr></table>
</a>
<![endif]-->

</li>

</ul>

</div><div class="bg3"><%=y %>年<%=m %>月<%=d %>日 <%=xq %></div>
</div>
</body>
</html>