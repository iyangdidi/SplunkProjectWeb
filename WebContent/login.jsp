<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="GB18030"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML ><HEAD><TITLE>用户登录</TITLE>

<LINK 
href="css/User_Login.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.6000.16674" name=GENERATOR></HEAD>
<BODY id=userlogin_body>
<DIV></DIV>
<FORM method="post" name = "info">
<DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <UL>
      <LI class=user_main_text>用户名： </LI>
      <LI class=user_main_input><INPUT class=TxtUserNameCssClass id=TxtUserName 
      maxLength=20 name=TxtUserName> </LI></UL>
    <UL>
      <LI class=user_main_text>密 码： </LI>
      <LI class=user_main_input><INPUT class=TxtPasswordCssClass id=TxtPassword 
      type=password name=TxtPassword> </LI></UL>
    <UL>
      <LI class=user_main_text>Cookie： </LI>
      <LI class=user_main_input><SELECT id=DropExpiration name=DropExpiration> 
        <OPTION value=None selected>不保存</OPTION> <OPTION value=Day>保存一天</OPTION> 
        <OPTION value=Month>保存一月</OPTION> <OPTION 
      value=Year>保存一年</OPTION></SELECT> </LI></UL></DIV></LI>
    <LI class=user_main_r><INPUT class=IbtnEnterCssClass id=IbtnEnter 
    style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
     onClick="return isValid(info)"
    type=image src="images/user_botton.gif" name=IbtnEnter> </LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px"><A>about me</A> 。</SPAN> </LI>
    <LI class=user_bottom_r></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>
<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

<DIV></DIV>
<script type="text/javascript">
  
  function isValid(form)
  {
    if(form.TxtUserName.value==""||form.TxtPassword.value=="")
  	{
  		alert("用户名或密码不能为空！");
  		return false;
 	} 
  	form.action="check.jsp";
 	form.submit();
  	return true;
  } 
  </script>
</FORM></BODY></HTML>
