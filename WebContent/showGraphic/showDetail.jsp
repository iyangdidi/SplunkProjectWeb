<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//http://localhost:8080/DataProject/showGraphic/test.jsp?section=ErrorType1&pieIndex=0
	String errorType = request.getParameter("section").toString();
	String pieIndex = request.getParameter("pieIndex").toString();
%>
<%=errorType %>
<%=pieIndex %>

</body>
</html>