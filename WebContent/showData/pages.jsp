<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%@include file="pagescount.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ҳ��ʾ</title>
    
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
     
     //�ж��Ƿ�ȡ��ToPage����
     if(ToPage!=null)
     {
      //ȡ��ָ����ʾ�ķ�ҳҳ��
      ShowPage=Integer.parseInt(ToPage);
      
      //���������ж��û������ҳ���Ƿ���ȷ
      if(ShowPage>=PageCount)
      {
       	ShowPage=PageCount;
      }
      else if(ShowPage<=0)
      {
       	ShowPage=1;
      }
     }
  
     //��������ʾҳ�ĵ�һ�ʼ�¼λ��
     rs.absolute((ShowPage-1)*PageSize+1); 
    %>
    <h3>��ǰ�ڵ�
    <font size="2" color="red"><%=ShowPage %></font>ҳ,��<%=PageCount %>ҳ</h3>
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
     //����forѭ�����PageSize����ȡ��һҳ�е�����
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
      //������������������һ����¼ʱ,��ָ���Ƶ����һ�ʼ�¼֮��
       if(!rs.next())
       {
        //����forѭ��
        break;
       }
      }
      %>
      </table>
      <table>
       <tr>
      <%
       //�жϵ�ǰ�Ƿ��ڵ�һҳ,���ǵ�һҳ������ʾ����һҳ����һҳ������
       if(ShowPage!=1)
       {
      %>
       <td width=150>
        <a href="showData/pages.jsp?ToPage=<%=1 %>">��һҳ</a>
       </td> 
       <td width=150>
        <a href="showData/pages.jsp?ToPage=<%=ShowPage-1 %>">��һҳ</a>
       </td>
      <% 
       }
       //�ж��Ƿ������һҳ���ǣ�����ʾ�����һҳ����һҳ
       if(ShowPage!=PageCount)
       {
       %>
        <td width=150>
         <a href="showData/pages.jsp?ToPage=<%=ShowPage+1 %>">��һҳ</a>
        </td>
        <td width=150>
         <a href="showData/pages.jsp?ToPage=<%=PageCount %>">���һҳ</a>
        </td>
        <%
         }
         %>
         </tr>
         <tr>
         <td colspan="4" align="center">
          <form action="showData/pages.jsp" method="post" name="form1">
           <input id = "goPage" type="text" name="go" value="<%=ShowPage %>" style="height:25px;width:40px">ҳ
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