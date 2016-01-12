<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/theme/default/css/jpage.css"></link> 
<link ID="skin" rel="stylesheet" type="text/css" href="<%=basePath %>css/config.css" /> 
<script language="javascript" type="text/javascript" src="<%=basePath %>js/jquery.js"></script> 

<title>Insert title here</title>
</head>
<body>
<div> 
<div> 
<br /> 
<table id="datas" align="center" class="listtable" width="100%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
<tr class="fixheader"> 
<th width="14%"> 
用户ID</th> 
<th width="14%"> 
用户名称</th> 
<th width="14%"> 
所在科室</th> 
<th width="14%"> 
创建时间</th> 
<th width="14%"> 
创建人</th> 
<th width="14%"> 
菜单集名称</th> 
<th width="14%"> 
是否有效</th> 
</tr> 
<tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
<td id="userId" class="tdc"> 
</td> 
<td id="userName" class="tdc"> 
</td> 
<td id="depId" class="tdc"> 
</td> 
<td id="createTime" class="tdc"> 
</td> 
<td id="creator" class="tdc"> 
</td> 
<td id="menusId" class="tdc"> 
</td> 
<td id="isValid" class="tdc"> 
</td> 
</tr> 
</table> 
</div> 
<div id="load" style="left: 0px; position: absolute; top: 0px; background-color: red"> 
LOADING.... 
</div> 
<div class="default_pgContainer" > 
<div class="default_container"> 
<div class="default_pgPanel" id="skinDiv"> 
<table class="default_pgToolbar"> 
<tr> 
<td class="black_pgCurrentPage"> 
<select id="pageSize" name="pageSize"> 
<option selected="selected" value="10">10</option> 
<option value="20">20</option> 
<option value="30">30</option> 
</select> 
</td> 
<td> 
<div id="first" class="default_pgFirst default_pgBtn" /> 
</td> 
<td> 
<div id="previous" class="default_pgPrev default_pgBtn" /> 
</td> 
<td class="default_separator"> 
</td> 
<td> 
<div id="next" class="default_pgNext default_pgBtn" /> 
</td> 
<td> 
<div id="last" class="default_pgLast default_pgBtn" /> 
</td> 
<td class="default_separator"> 
</td> 
<td> 
<span id="pageinfo"></span> 
</td> 
</tr> 
</table> 
</div> 
</div> 
</div> 
</div> 
<div id="test"></div> 
<input type="hidden" id="pageCount" style="width: 45px" /> 
<input type="hidden" id="totalCount" style="width: 45px" /> 



 
</body>

<script language="jscript" type="text/javascript"> 
var pageIndex = 1; //当前页数 
$(function(){ 
GetPageCount();//获取分页数量以及总的记录条数 
$("#load").hide();//隐藏loading提示 
$("#template").hide();//隐藏模板 
ChangeState(0,1);//设置翻页按钮的初始状态 
bind();//绑定第一页的数据 
//第一页按钮click事件 
$("#first").click(function(){ 
pageIndex = 1; 
ChangeState(0,1); 
bind(); 
}); 
//上一页按钮click事件 
$("#previous").click(function(){ 
pageIndex -= 1; 
ChangeState(-1,1); 
if(pageIndex <= 1){ 
pageIndex = 1; 
ChangeState(0,-1); 
} 
bind(); 
}); 
//下一页按钮click事件 
$("#next").click(function(){ 
pageIndex += 1; 
ChangeState(1,-1); 
if(pageIndex>=pageCount) 
{ 
pageIndex = pageCount; 
ChangeState(-1,0); 
} 
bind(pageIndex); 
}); 
//最后一页按钮click事件 
$("#last").click(function(){ 
pageIndex = pageCount; 
ChangeState(1,0); 
bind(pageIndex); 
}); 
//每页显示记录条数select事件 
$("#pageSize").change(function(){ 
bind(); 
}) 
}); 
//AJAX方法取得数据并显示到页面上 
function bind(){ 
$("#load").show(); 
var pageSize = $("#pageSize").val(); 
$.ajax({ 
type: "get",//使用get方法访问后台 
dataType: "json",//返回json格式的数据 
url: "<%=basePath%>actionSmUser.do?method=listUser2",//要访问的后台地址 
data: "pageIndex=" + pageIndex+"&pageSize="+pageSize,//要发送的数据 
complete : function(msg){//msg为返回的数据，在这里做数据绑定 
$("[id=ready]").remove(); 
var data = eval("("+msg.responseText+")"); 
$.each(data, function(i, n){ 
var row = $("#template").clone(); 
row.find("#userId").text(n.userId); 
row.find("#userName").text(n.userName); 
row.find("#depId").text(n.depId); 
row.find("#createTime").text(n.createTime); 
if(n.createTime !== undefined) row.find("#createTime").text(n.createTime); 
row.find("#creator").text(n.creator); 
row.find("#menusId").text(n.menusId); 
row.find("#isValid").text(n.isValid); 
row.attr("id","ready");//改变绑定好数据的行的id 
row.appendTo("#datas");//添加到模板的容器中 
}); 
$("[id=ready]").show(); 
SetPageInfo(); 
} 
}); 
} 
function ChangeDate(date){ 
return date.replace("-","/").replace("-","/"); 
} 
//设置第几页/共几页的信息 
function SetPageInfo(){ 
var pageCount = $("#pageCount").val(); 
var totalCount = $("#totalCount").val(); 
var pageSize = $("#pageSize").val(); 
$("#pageinfo").html(" 第<input class='default_pgCurrentPage' id='pageIndex' type='text' value='"+pageIndex+ 
"' style='width: 30px' /> 页" + "/" +"共 "+pageCount+"页"+ 
" 检索到 "+totalCount+"条记录，显示第 "+(pageIndex*pageSize-pageSize)+" 条 - 第 "+(pageIndex*pageSize)+" 条记录"); 
} 
//AJAX方法取得分页总数 
function GetPageCount(){ 
var pageSize = $("#pageSize").val(); 
$.ajax({ 
type: "get", 
dataType: "text", 
url: "<%=basePath%>actionSmUser.do?method=getPageCount", 
data: "pageSize="+pageSize , 
async: false, 
success: function(msg){ 
var data = eval("("+msg+")"); 
$("#pageCount").val(data[0].pageCount); 
$("#totalCount").val(data[0].totalCount); 
} 
}); 
} 
//改变翻页按钮状态 
function ChangeState(state1,state2){ 
$("#first").attr("class","default_pgFirst default_pgBtn"); 
$("#previous").attr("class","default_pgPrev default_pgBtn"); 
$("#next").attr("class","default_pgNext default_pgBtn"); 
$("#last").attr("class","default_pgLast default_pgBtn"); 
if(state1 == 1) { 
document.getElementById("first").disabled = ""; 
document.getElementById("previous").disabled = ""; 
}else if(state1 == 0){ 
document.getElementById("first").disabled = "disabled"; 
document.getElementById("previous").disabled = "disabled"; 
$("#first").attr("class","default_pgFirstDisabled default_pgBtn"); 
$("#previous").attr("class","default_pgPrevDisabled default_pgBtn"); 
}if(state2 == 1){ 
document.getElementById("next").disabled = ""; 
document.getElementById("last").disabled = ""; 
}else if(state2 == 0){ 
document.getElementById("next").disabled = "disabled"; 
document.getElementById("last").disabled = "disabled"; 
$("#next").attr("class","default_pgNextDisabled default_pgBtn"); 
$("#last").attr("class","default_pgLastDisabled default_pgBtn"); 
} 
} 
</script> 
</html>