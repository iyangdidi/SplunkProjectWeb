<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.servlet.ChartServlet"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>机器参数变化可视化</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="js/ddwh.css">

<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
 <script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
</head>

<body> 
<%
	String url = request.getContextPath() + "/dataTable/MachineParameterVisual.jsp";
%>

<center>
	<form name="form1" action=<%=url %> method="get"> 
 <table id="datas" align="center" class="listtable" width="80%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <th align="center" colspan="4"><h4>参数列表</h4></th>  
      </tr>
	  <tr class="fixheader"> 
       <td><label><input name="checkAll" type="checkbox" value="" onclick="selectAll(this.checked);"/>全选/反选</label></td>
      	<td>
      	<input type ="button" onclick="javascript:window.document.form1.submit();" value="确定" style="height:25px;width:60px">
      	</td>
      </tr>
      <tr></tr>
        <%
     		String machine = request.getParameter("machine");
        %>
        <%if(machine == null) {%>
        <td>数据是空</td>
        <%}else{
        ResponseGetEvent data = RequestData.requestEvent(machine,RequestEnum.Request_GetItemFromDpMachine.getValue());
		HashMap map = data.getMap();
		Iterator iter = map.entrySet().iterator();
		int i=1;
		Map.Entry<String,String> entry;
		%>
		<tr>
      <td>
      <input id = "num" name="num"  type="hidden" value=<%=map.size() %> />
      <input id = "machine" name="machine"  type="hidden" value=<%=machine %> />
      </td>
      </tr>
		<% 
		while(iter.hasNext()){
    %>      
      <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
       <%entry = (Map.Entry<String,String>)iter.next(); %>
       <td><label><input id = <%="id_"+i %> name="param" type="checkbox" value=<%=entry.getKey() %> /><%= entry.getKey()%> </label> </td>
       <%
       		if(iter.hasNext()){
       			entry = (Map.Entry<String,String>)iter.next();
       			i++;
       		
    	%>
       <td><label><input id = <%="id_"+i %> name="param" type="checkbox" value=<%=entry.getKey() %> /><%= entry.getKey()%> </label> </td>
        <%} %>
         <%
       		if(iter.hasNext()){
       			entry = (Map.Entry<String,String>)iter.next();
       			i++;
       		
    	%>
       <td><label><input id = <%="id_"+i %> name="param" type="checkbox" value=<%=entry.getKey() %> /><%= entry.getKey()%> </label> </td>
        <%} %>
         <%
       		if(iter.hasNext()){
       			entry = (Map.Entry<String,String>)iter.next();
       			i++;
       		
    	%>
       <td><label><input id = <%="id_"+i %> name="param" type="checkbox" value=<%=entry.getKey() %> /><%= entry.getKey()%> </label> </td>
        <%} %>
      </tr>
      <%} %>
      
    </table>
<%} %>
</form> 

<%

String numparam = request.getParameter("num");
    if(numparam!=null){
         String[] values = request.getParameterValues("param");
         int width = 800;
         int height = 1000;
         List<String[]> list = new ArrayList<String[]>();
         for(int j=0; j<values.length; j++){
        	 String reqParam = machine+",Time,"+values[j];
        	 ResponseGetEvent dataEvent = RequestData.requestEvent(reqParam,RequestEnum.Request_GetContentDpMachineAndItem.getValue());
        	 HashMap map2 = dataEvent.getMap();
             Iterator iter2 = map2.entrySet().iterator();
             while(iter2.hasNext()){
                 Map.Entry<String,String> entry2 = (Map.Entry<String,String>)iter2.next();
                 double value = MyTools.strTodouble(entry2.getValue());
                 if(value == 0) 
                	 break;
                 String[] str = {entry2.getValue(),machine+","+values[j],entry2.getKey()};
                 list.add(str);
             }
		}%>
<%  String filename = ChartServlet.generateLineChart("折线图", "x轴", "y轴" ,width ,height,session,new PrintWriter(out),list);
        String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;
        
 %>
  <table id="datas" align="center" class="listtable" width="80%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
    <tr class="fixheader"> 
       <th align="center" colspan="4"><h4>参数表</h4></th>  
      </tr>
      <tr>
      <td>
      <P ALIGN="CENTER">
      <img src="<%= graphURL %>" width=<%=width %> height=<%=height %> border=0 usemap="#<%=filename %>" alt="">
      </P>
      </td>
      </tr>
  </table>
 <%} %>

</center>
</body>
</html>