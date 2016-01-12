<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  
    
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
     <table border="0" width="90%">
      <tr>
      	<td width="20%">
      		<input class=IbtnEnterCssClass id=IbtnEnter onClick="return go()"
      		type=image src="computer.png" name=IbtnEnter width="100" height="100">
      		<h4>机器1</h4>
      	</td>
      	<td width="20%">
      		<input class=IbtnEnterCssClass id=IbtnEnter onClick="return go()"
      		type=image src="computer.png" name=IbtnEnter width="100" height="100">
      		<h4>机器2</h4>
      	</td>
      	<td width="20%">
      		<input class=IbtnEnterCssClass id=IbtnEnter onClick="return go()"
      		type=image src="computer.png" name=IbtnEnter width="100" height="100">
      		<h4>机器3</h4>
      	</td>
      	<td width="20%">
      		<input class=IbtnEnterCssClass id=IbtnEnter onClick="return go()"
      		type=image src="computer.png" name=IbtnEnter width="100" height="100">
      		<h4>机器4</h4>
      	</td>
      	<td width="20%">
      		<input class=IbtnEnterCssClass id=IbtnEnter onClick="return go()"
      		type=image src="computer.png" name=IbtnEnter width="100" height="100">
      		<h4>机器5</h4>
      	</td>
      </tr>
      </table>
      <table>
       <tr>
         </tr>
         <tr>
         <td colspan="4" align="center">
         
         </td>
         </tr>
       </table>
   </center>
   <script language="javascript">
    function go()
    {
       
       alert("跳转到参数页面");
    }
   </script>
  </body>
</html>