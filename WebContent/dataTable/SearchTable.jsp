<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>
<%@ page import = "java.util.List,java.util.ArrayList,java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询视图</title>
</head>
<body>


<%
	String url = request.getContextPath() + "/dataTable/SearchTable.jsp";
%>

<%
	String search = "";
	if(request.getParameter("search")!=null)
	{
		search = request.getParameter("search");
	}
	
	String strShowPage = request.getParameter("showPage");
	int showPage=1;
	if(strShowPage!=null){
		showPage = Integer.parseInt(strShowPage);
	}
	int counts=0;
	String param = search + ","+showPage;
	int PageCount=0;
	List<String> list=null;
	ResponseGetRawData data = RequestData.requestRawData(param,RequestEnum.Request_Search_Ceilometer.getValue());
	if(data!=null){
		counts = data.getTotal();
		PageCount = counts/Constants.PAGE_NUM;
		list = data.getRawDatas();
	}
	
	
%>

<center>
 
<form action=<%=url %> method="post" name="form2">
	          <input id = "search" type="text"  name="search" value="<%=search %>" style="height:35px;width:600px">
	          <input type ="button" onclick="javascript:window.document.form2.submit();" value="查找" style="height:40px;width:50px"> 
	        <!--   <a href="javascript:window.document.form2.submit();">查询</a> -->
	          </form>
   <table id="datas" align="center" class="listtable" width="80%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <th align="center" colspan="4"><h4>检索结果列表</h4></th>  
      </tr>
      <tr></tr>
      <%
      	Iterator<String> iter = list.iterator();
     	while(iter.hasNext())  
	      {  
	          String str = iter.next();      
      %>
                 <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
                   <td><%=str %></td>

                </tr>
            <%} %>
            
    </table>
  <table>
       <tr>
       <% String urlPaging = request.getContextPath() + "/dataTable/SearchTable.jsp?search="+search+"&showPage="; %>
      <%if(showPage>1){ %>
       <td width=150>
        <a href="<%=urlPaging+"1" %>">第一页</a>
       </td> 
       <td width=150>
         <a href="<%=urlPaging+(showPage-1) %>">上一页</a>
       </td>
       <%} %>
 
       <%if(showPage<counts){ %>
        <td width=150>
         <a href="<%= urlPaging+(showPage+1) %>">下一页</a>
        </td>
        <td width=150>
         <a href="<%= urlPaging+counts %>">最后一页</a>
        </td>
        <%} %>
        
         </tr>
         <tr>
         <td colspan="2" align="left">
		         <h4>当前在第
		    <font size="2" color="red"><%=showPage %></font>页,共<%=PageCount %>页</h4>
         </td>
         <td colspan="2" align="center">
	          <form action=<%=url %> method="post" name="form1">
	          <input id = "search" type="hidden"  name="search" value=<%=search %> style="height:25px;width:40px">
	           <input id = "showPage" type="text" name="showPage" value=<%=showPage %> style="height:25px;width:40px">页
	           <a href="javascript:window.document.form1.submit();">GO</a>
	          </form>
         </td>
         </tr>
       </table>
     </center>


</body>
</html>