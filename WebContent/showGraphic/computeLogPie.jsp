<%@ page contentType="text/html;charset=GBK"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.servlet.ChartServlet"%>
<%@ page import="com.dataControler.GetComputerLog"%>
<%@ page import="com.remoteData.ComputeEnum"%>
<%
int width = 500;
int height = 350;
String url = request.getContextPath() + "/dataTable/computeLogByType.jsp";
String filename = GetComputerLog.getGraphicData(ComputeEnum.COMPUTE_ALL, "日志类型统计图", width, height, 
		session, new PrintWriter(out), url);

String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;

%>
<HTML>
<HEAD>
<TITLE>日志类型统计</TITLE>
</HEAD>
<BODY>
<%if(filename!=null){ %>
<P ALIGN="CENTER">

<img src="<%= graphURL %>" width="<%=width %>" height="<%=height %>" border=0 usemap="#<%=filename %>"
alt="">
</P>
<%}else{ %>
没有数据
<%} %>
</BODY>
</HTML>