<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>CommonCountSource</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="js/ddwh.css">

<script type="text/javascript" src="js/jquery-1.10.1.js"></script>

</head>

<body> 
<%
	String url = request.getContextPath() + "/dataTable/RawDataBySource.jsp";
%>

<center>
   <table id="datas" align="center" class="listtable" width="80%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <th align="center" colspan="4"><h2>CommonCountSource</h2></th>  
      </tr>
	<tr class="fixheader"> 
       <td width="20%" ><h4>数据源</h4></td>  
       <td width="30%" ><h4>记录数 </h4></td>  
      </tr>
      <tr></tr>
        <%
     
     ResponseCommonCountSource data = RequestData.requestCommonCountSource(null,RequestEnum.Request_SourceCount_Ceilometer.getValue());
		HashMap map = data.getMap();
		Iterator iter = map.entrySet().iterator();
		while(iter.hasNext()){
			Map.Entry<String,Integer> entry = (Map.Entry<String,Integer>)iter.next();
    %>  
     
      <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
       <td width="70%"><a href="<%= url+"?showPage=1&source="+entry.getKey()+"&counts="+entry.getValue() %>" ><%=entry.getKey() %></a></td>  
       <td width="30%"><%=entry.getValue() %></td>  
 
      </tr>
      <%} %>
    </table>
       </center>
</body>
</html>