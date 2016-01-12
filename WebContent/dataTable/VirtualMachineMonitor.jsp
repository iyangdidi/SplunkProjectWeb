<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>虚拟交换机监控</title>

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
	String url = request.getContextPath() + "/dataTable/VirtualMachineMonitorRowData.jsp";
	String urlType = request.getContextPath() + "/dataTable/VirtualMachineTypeMonitor.jsp";
%>

<center>
   <table id="datas" align="center" class="listtable" width="80%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <th align="center" colspan="4"><h2>数据源列表</h2></th>  
      </tr>
	<tr class="fixheader"> 
       <td width="50%" ><h4>数据源</h4></td>  
       <td width="10%" ><h4>记录数 </h4></td>
       <td width="20%" ><h4>数据列表</h4></td>
       <td width="20%" ><h4>按虚拟机类型分类</h4></td>   
      </tr>
      <tr></tr>
        <%
     
     	ResponseCommonCountSource data = RequestData.requestCommonCountSource(null,RequestEnum.Request_SourceCount_Openvswitch.getValue());
		HashMap map = data.getMap();
		Iterator iter = map.entrySet().iterator();
		while(iter.hasNext()){
			Map.Entry<String,Integer> entry = (Map.Entry<String,Integer>)iter.next();
    %>  
     
      <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
       <td width="50%"><%=entry.getKey() %></td>  
       <td width="10%"><%=entry.getValue() %></td>  
 		<td width="20%">
 			<a href="<%= url+"?showPage=1&source="+entry.getKey()+"&counts="+entry.getValue() %>" >数据列表</a> 
 		</td>
 		<td width="20%">
 			<a href="<%= urlType+"?showPage=1&source="+entry.getKey()+"&counts="+entry.getValue() %>" >按虚拟机类型分类</a> 
 			</td>    
      </tr>
      <%} %>
    </table>
       </center>
</body>
</html>