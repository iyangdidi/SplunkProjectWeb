<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="GB18030"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>��������ϵͳ</title>
    <link href="css/index.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="js/menu.js"></script>
</head>
<body style="overflow: auto" onload="border_left('left_tab1','left_menu_cnt1');">
    <form id="form1" >
    <script type="text/javascript" language="javascript">
        setInterval(show_title, 250);
    </script>
    <table id="indextablebody" cellpadding="0">
        <thead>
            <tr>
                <th colspan="2">
                    <a style="cursor: default;">�û���<%=1111 %></a>&nbsp;&nbsp;&nbsp;<a
                        style="cursor: default;">��ݣ�<%=1111 %></a>&nbsp;&nbsp; <a style="cursor: default;">
                            ְ�ƣ�<%=1111 %></a>&nbsp;&nbsp;
                                            
            
                       &nbsp;&nbsp; <a href="page_common/updateInfo.aspx" target="content3" style="color: #FFFF99"
                            title="�޸���Ϣ">�޸���Ϣ</a>&nbsp;&nbsp; <a style="color: #FFFF99" href="quit.aspx" title="��ȫ�˳�">
                                ��ȫ�˳�</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tab">
                    <ul id="tabpage1">
                        <li id="tab1" title="���ˢ��" onclick="reflesh()"><span id="spanTitle"></span></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="t1">
                    <div id="contents">
                        <table cellpadding="0">
                            <tr class="t1">
                                <td>
                                    <div class="menu_top">
                                    </div>
                                </td>
                            </tr>
                            <tr class="t2">
                                <td>
                                    <div id="menu" class="menu">
                                        <ul class="tabpage2">
                                            <li id="left_tab0" style="display: none"></li>
                                            <li id="left_tab1" onclick="border_left('left_tab1','left_menu_cnt1');"><span>
                
                                                OP<br />
                                                E<br />
                                                NST<br /> 
                                                AC<br /> 
                                                K<br /> 
                                                
                                           
                                            </span></li>
                                            <li id="left_tab2" onclick="border_left('left_tab2','left_menu_cnt2');"><span>
                                                <br />
                                                ��<br />
                                                ��<br />
                                                ƽ<br />
                                                ̨<br />
           
                                            </span></li>
                                              
                                            <li id="left_tab3" onclick="border_left('left_tab3','left_menu_cnt3');"><span>
                                                <br />
                                                ��<br />
                                                ��<br />
                                                ��<br />
                                                Ϣ<br />
                                            </span></li>
                      <!--                      <li id="left_tab4" onclick="border_left('left_tab4','left_menu_cnt4');"><span>
                                                <br />
                                                ��<br />
                                                <br />
                                                ��<br />
                                                <br />
                                            </span></li>
                                           -->
                                        </ul>
                                        <div class="left_menu_all">
                                            <div id="left_menu_cnt0" class="left_menu_cnt">
                                            </div>
                                            <div id="left_menu_cnt1" class="left_menu_cnt">
                                                <ul id="dleft_tab1">
                                               
                                                     <li id="now14"><a href="showGraphic/computeLogPie.jsp" target="content3"><span>��־����ͳ��ͼ</span></a></li>
                                                    <li id="now15"><a href="dataTable/CommonCountSource.jsp" target="content3"><span>��ϢԴ�б�</span></a></li>
                                                    <li id="now15"><a href="dataTable/SearchTable.jsp" target="content3"><span>��������</span></a></li>
                                                    
                                                
                                                </ul>
                                            </div>
                                            <div id="left_menu_cnt2" class="left_menu_cnt">
                                                <ul id="dleft_tab2">
                                                    <li id="now21"><a href="dataTable/AllMachineName.jsp" target="content3"><span>���л������б�</span></a></li>
                                                  
                                                    
                                                </ul>
                                            </div>
                                              
                                            <div id="left_menu_cnt3" class="left_menu_cnt">
                                                <ul id="dleft_tab3">
                                                     <li id="now15"><a href="dataTable/NetSourceMonitor.jsp" target="content3"><span>������Դ���ݼ��</span></a></li>
                                                    <li id="now15"><a href="dataTable/MemoryMonitor.jsp" target="content3"><span>�洢��Դ���ݼ��</span></a></li>
                                                    <li id="now15"><a href="dataTable/ComputeSourceMonitor.jsp" target="content3"><span>������Դ���ݼ��</span></a></li>
                                                    <li id="now15"><a href="dataTable/TimeInfoMonitor.jsp" target="content3"><span>ʱ����Ϣ���ݼ��</span></a></li>
                                                   	<li id="now15"><a href="dataTable/VirtualMachineMonitor.jsp" target="content3"><span>���⽻�������</span></a></li>
                                        
                                                    <li id="now15"><a href="dataTable/VirtualMachineSearch.jsp" target="content3"><span>�������������Ϣ����</span></a></li>
                                                </ul>
                                            </div>
                                         <!--   <div id="left_menu_cnt4" class="left_menu_cnt">
                                                <ul id="dleft_tab4">
                                                    <li id="now21"><a href="dataTable/AllMachineName.jsp" target="content3"><span>1111</span></a></li>
                                                    
                                                </ul>
                                            </div>
                                            -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="t3">
                                <td>
                                    <div class="menu_end">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td class="t2">
                    <div id="cnt">
                        <div id="dtab1">
                            <iframe name="content3" src="mainFrame.jsp" frameborder="0"></iframe>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
