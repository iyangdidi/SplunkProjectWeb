<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String urlGo = request.getContextPath() + "/dataTable/computerLogTable?action=go";
String urlAction = request.getContextPath() + "/dataTable/computerLogTable?&action=";
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>数据显示</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="js/ddwh.css">

<script type="text/javascript" src="js/jquery-1.10.1.js"></script>

</head>

<body> 
<center>
   <table id="datas" align="center" class="listtable" width="100%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <th align="center" colspan="4"><h2>测试数据表</h2></th>  
      </tr>
	<tr class="fixheader"> 
       <td width="20%" ><h4>错误编号</h4></td>  
       <td width="30%" ><h4>错误描述 </h4></td>  
      </tr>
      <tr></tr>
        <c:if test="${not empty logList}">
            <c:forEach items="${logList }" var="a">
                 <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
                   <td width="20%">${a[0]}</td>
                   <td width="30%">${a[1]}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
     <table>
       <tr>
      <c:if test="${showPage !=1}">
       <td width=150>
        <a href="<%= urlAction+"first" %>">第一页</a>
       </td> 
       <td width=150>
        <a href="<%= urlAction+"up" %>">上一页</a>
       </td>
       </c:if>
 
       <c:if test="${showPage !=pageCount}">
        <td width=150>
         <a href="<%= urlAction+"next" %>">下一页</a>
        </td>
        <td width=150>
         <a href="<%= urlAction+"last" %>">最后一页</a>
        </td>
        </c:if>
        
         </tr>
         <tr>
         <td colspan="1" align="left">
		         <h4>当前在第
		    <font size="2" color="red">${showPage}</font>页,共${pageCount}页</h4>
         </td>
         <td colspan="3" align="center">
          <form action=<%=urlGo %> method="post" name="form1">
           <input id = "goPage" type="text" name="go" value=${showPage} style="height:25px;width:40px">页
           <a href="javascript:window.document.form1.submit();">GO</a>
          </form>
         </td>
         </tr>
       </table>
       </center>
</body>
</html>