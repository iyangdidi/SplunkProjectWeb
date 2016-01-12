<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "com.remoteData.*" %>
<%@ page import = "com.toolbean.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.servlet.ChartServlet"%>

<%
int width = 800;
int height = 500;
String machine = request.getParameter("machine");
String param = request.getParameter("param");
String reqParam = machine+",Time,"+param;
ResponseGetEvent data = RequestData.requestEvent(reqParam,RequestEnum.Request_GetContentDpMachineAndItem.getValue());
HashMap map = data.getMap();
Iterator iter = map.entrySet().iterator();
List<String[]> list = new ArrayList<String[]>();
while(iter.hasNext()){
	Map.Entry<String,String> entry = (Map.Entry<String,String>)iter.next();
	String[] str = {entry.getValue(),machine+","+param,entry.getKey()};
	list.add(str);
}

String filename = ChartServlet.generateLineChart("折线图", "x轴", "y轴" ,width ,height,session,new PrintWriter(out),list);

String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;

%>
<%="总记录数="+list.size() %>
<HTML>
<HEAD>
<TITLE>机器参数变化曲线</TITLE>
</HEAD>
<BODY>
<P ALIGN="CENTER">
<img src="<%= graphURL %>" width=<%=width %> height=<%=height %> border=0 usemap="#<%=filename %>" alt="">
</P>
</BODY>
</HTML>