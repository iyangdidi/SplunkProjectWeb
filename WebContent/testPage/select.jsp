<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	String url = request.getContextPath() + "/testPage/select.jsp";
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String type = request.getParameter("select");  %>
<% if(type!=null){ %>
<%=type %>
<%} %>
<form action=<%=url %> method="post" name="form1">
<select id="select" name="select" onchange="javascript:window.document.form1.submit();">
    <option value=<%=ComputeEnum.COMPUTE_ALL.getValue() %> selected>所有类型</option>
    <option value=<%=ComputeEnum.COMPUTE_ERROR.getValue() %>>错误类型</option>
    <option value=<%=ComputeEnum.COMPUTE_INFO.getValue() %>>信息类型</option>
    </select>
    </form>
</body>

</html>