<%@ page contentType="text/html;charset=GBK"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.servlet.ChartServlet"%>
<%

String filename = ChartServlet.generateLineChart("ÕÛÏßÍ¼", "xÖá", "yÖá" ,800 ,800,session,new PrintWriter(out));

String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;
%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<P ALIGN="CENTER">
<img src="<%= graphURL %>" width=900 height=900 border=0 usemap="#<%=filename %>" alt="">
</P>
</BODY>
</HTML>