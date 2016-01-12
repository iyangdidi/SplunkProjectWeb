<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>机器参数列表</title>

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
	String url = request.getContextPath() + "/showGraphic/machineParamLineChart.jsp";
%>

<center>
   <table id="datas" align="center" class="listtable" width="80%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <th align="center" colspan="4"><h4>数据列表</h4></th>  
      </tr>
	<tr class="fixheader"> 
       <td width="20%" ><h4>参数名称</h4></td>  
       <td width="30%" ><h4>记录数 </h4></td>  
      </tr>
      <tr></tr>
        <%
     	String machine = request.getParameter("machine");
        ResponseGetEvent data = RequestData.requestEvent(machine,RequestEnum.Request_GetItemFromDpMachine.getValue());
		HashMap map = data.getMap();
		Iterator iter = map.entrySet().iterator();
		while(iter.hasNext()){
			Map.Entry<String,String> entry = (Map.Entry<String,String>)iter.next();
    %>      
      <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
       <td width="70%"><a href="<%= url+"?machine="+machine+"&param="+entry.getKey() %>" ><%=entry.getKey() %></a></td>  
       <td width="30%"><%=entry.getValue() %></td>  
 
      </tr>
      <%} %>
    </table>
       </center>
</body>
</html>