<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%@include file="pagescount.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分页显示</title>
    
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">    
 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 <meta http-equiv="description" content="This is my page">
 <meta http-equiv="author" content="sunxch">
 <!--
 <link rel="stylesheet" type="text/css" href="styles.css">
 -->

  </head>
  
  <body >
   <center>
    <%
     String ToPage=request.getParameter("ToPage"); 
     
     //判断是否取得ToPage参数
     if(ToPage!=null)
     {
      //取得指定显示的分页页数
      ShowPage=Integer.parseInt(ToPage);
      
      //下面的语句判断用户输入的页数是否正确
      if(ShowPage>=PageCount)
      {
       	ShowPage=PageCount;
      }
      else if(ShowPage<=0)
      {
       	ShowPage=1;
      }
     }
  
     //计算欲显示页的第一笔记录位置
     rs.absolute((ShowPage-1)*PageSize+1); 
    %>
    <h3>当前在第
    <font size="2" color="red"><%=ShowPage %></font>页,共<%=PageCount %>页</h3>
    <p>
    <%=basePath%>
     <table id="datas" align="center" class="listtable" width="100%" bgcolor="#CCCCCC" cellSpacing="1" cellpadding="1" style="margin-top:5px;"> 
	<tr class="fixheader"> 
       <td width="20%" ><h4>id</h4></td>  
       <td width="30%" ><h4>username </h4></td>  
       <td width="30%" ><h4>password</h4></td>
       <td width="20%" ><h4>name</h4></td>
      </tr>
      <tr></tr>
    <%
     //利用for循环配合PageSize属性取出一页中的数据
     for(int i=1;i<=PageSize;i++)
     {
    %>  
     
      <tr id="template" height="22px" bgcolor="#F9FDFF" onmouseover="javascript:this.style.backgroundColor='#FFFFCC'; return true;" onMouseOut="javascript:this.style.backgroundColor='#F9FDFF'; return true;"> 
       <td width="20%"><%=rs.getString("id") %></td>  
       <td width="30%"><%=rs.getString("username") %></td>  
       <td width="30%"><%=rs.getString("password") %></td>
       <td width="20%"><%=rs.getString("name") %></td>
      </tr>
    
     <%
      //下面的语句用于输出最后一条记录时,将指针移到最后一笔记录之后
       if(!rs.next())
       {
        //跳出for循环
        break;
       }
      }
      %>
      </table>
      <table>
       <tr>
      <%
       //判断当前是否在第一页,不是第一页，则显示到第一页与下一页的连接
       if(ShowPage!=1)
       {
      %>
       <td width=150>
        <a href="showData/pages.jsp?ToPage=<%=1 %>">第一页</a>
       </td> 
       <td width=150>
        <a href="showData/pages.jsp?ToPage=<%=ShowPage-1 %>">上一页</a>
       </td>
      <% 
       }
       //判断是否在最后一页，是，则显示到最后一页和下一页
       if(ShowPage!=PageCount)
       {
       %>
        <td width=150>
         <a href="showData/pages.jsp?ToPage=<%=ShowPage+1 %>">下一页</a>
        </td>
        <td width=150>
         <a href="showData/pages.jsp?ToPage=<%=PageCount %>">最后一页</a>
        </td>
        <%
         }
         %>
         </tr>
         <tr>
         <td colspan="4" align="center">
          <form action="showData/pages.jsp" method="post" name="form1">
           <input id = "goPage" type="text" name="go" value="<%=ShowPage %>" style="height:25px;width:40px">页
           <a href="javascript:window.document.form1.submit();">GO</a>
          </form>
         </td>
         </tr>
       </table>
   </center>
   <script language="javascript">
    function go()
    {
       
    }
   
   </script>
  </body>
</html>