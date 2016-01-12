<%@ page contentType="text/html;charset=GBK"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.servlet.ChartServlet"%>
<%
String filename = ChartServlet.generateBarChart("Öù×´Í¼", 800 ,800, session,new PrintWriter(out));


String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;
%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<P ALIGN="CENTER">
<img src="<%= graphURL %>" width=800 height=800 border=0 usemap="#<%=filename %>"
alt="">
</P>
</BODY>
</HTML>