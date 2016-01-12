<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%@ page import = "com.toolbean.conDB" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>pagescount</title>
    
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">    
 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 <meta http-equiv="description" content="This is my page">
 <!--
 <link rel="stylesheet" type="text/css" href="styles.css">
 -->

  </head>
  
  <body>
    <%!
     //设置每张网页显示三笔记录(每页显示的记录数)
     int PageSize=8;
     
     //设置欲显示的页数(初始页)
     int ShowPage=1;
     
     //ResultSet的记录笔数(总记录数)
     int RowCount=0;
     
     //ResultSet分页后的总数(总页数)
     int PageCount=0;
     
     ResultSet rs=null;

     //连接数据库并初始数据
     public void jspInit()
     {

      try{
       
       conDB DB = new conDB();
       DB.conMySql();
       rs = DB.executeQuery("select * from users");
       //将指标移至最后一条记录
       rs.last();
       
       //获取记录总数
       
       RowCount=rs.getRow();
       
       //计算显示的页数(关键)
       PageCount=((RowCount%PageSize)==0?(RowCount/PageSize):(RowCount/PageSize)+1);
      }catch(Exception e){
       System.out.println(e.getMessage());
      }  
     }
  
     %>
  </body>
</html>