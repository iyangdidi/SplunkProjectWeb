<%@ page contentType="text/html;charset=GBK"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.servlet.ChartServlet"%>

<%
int width = 500;
int height = 350;
String filename = ChartServlet.generatePieChart("网站访问统计表",width,height, session, new PrintWriter(out));
String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;
%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<P ALIGN="CENTER">
<img src="<%= graphURL %>" width="<%=width %>" height="<%=height %>" border=0 usemap="#<%=filename %>"
alt="">
</P>
</BODY>
</HTML>