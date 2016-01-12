<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
 
<title>Insert title here</title>
</head>
<body>
<%
	String url = request.getContextPath() + "/testPage/getCheckParameter.jsp";
%>

<form name="form1" action=<%=url %> method="get"> 
您喜欢的水果？<br /><br /> 
<label><input name="checkAll" type="checkbox" value="" onclick="selectAll(this.checked);"/>全选/反选</label>

<input id = "num" name="num" type="text" value="4" />
<label><input id = "id_1" name="test" type="checkbox" value="苹果" />苹果 </label> 
<label><input id = "id_2" name="test" type="checkbox" value="桃子" />桃子 </label> 
<label><input id = "id_3" name="test" type="checkbox" value="香蕉" />香蕉 </label> 
<label><input id = "id_4" name="test" type="checkbox" value="梨" />梨 </label> 
<input type ="button" onclick="javascript:window.document.form1.submit();" value="提交" style="height:40px;width:50px"> 
</form> 

</body>

</html>