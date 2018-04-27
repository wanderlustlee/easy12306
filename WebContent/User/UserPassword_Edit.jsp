<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.domin.UserVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户密码修改</title>
<link href="/WebTest/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
 <form name="form1" method="post" action="../userReveServlet">
<%UserVO user = ((UserVO)session.getAttribute("user")); %>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"></td>
  </tr>
</table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2"></td>
  </tr>
  <tr>
    <td width="64" height="12" ></td>
    <td width="744" height="30" align="left" class="text_blod_title">密码修改</td>
  </tr>
  <tr>
    <td height="15" colspan="2"><img src="/WebTest/images/line1.jpg" width="835" height="6"></td>
    </tr>
  <tr>
    <td colspan="2"  ><table width="700" border="0" align="center" cellspacing="0">
    <tr>
    <%
            	String userMsg = (String)request.getAttribute("error");
            	if(userMsg!=null){
            		%>
            		<%= userMsg %>
            		<%
            	}
            %>
            </tr>
      <tr>
        <td width="20">
        </td>
        <td width="100" height="40" class="text_cray1">用户名：</td>
        <td align="left" class="text_cray1"><input name="uname" type="text" disabled="true" class="text_cray" id="uname" value=" <%=user.getName() %> " size="30" readonly="reasonly"/></td>
      </tr>
      <tr>
        <td width="20" align="center" class="text_red">*</td>
        <td width="100" height="40" class="text_cray1">原密码：</td>
        <td align="left" class="text_cray1"><input name="oldPass" type="text" class="text_cray" id="oldPass" size="30" /></td>
      </tr>
      <tr>
        <td width="20" align="center"  class="text_red">*</td>
        <td width="100" height="40" class="text_cray1">新密码：</td>
        <td align="left" class="text_cray1"><input name="newPass" type="text" class="text_cray" id="newPass" size="30" /></td>
      </tr>
      <tr>
        <td width="20" align="center" class="text_red">*</td>
        <td width="100" height="40" class="text_cray1">确认新密码：</td>
        <td align="left" class="text_cray1"><input name="newPass_again" type="text" class="text_cray" id="newPass_again" size="30" /></td>
      </tr>
    </table>
      <br></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="124" height="30"></td>
    <td width="78" align="left"><input name="button" type="submit" class="buttj" id="button"value=""></td>
    <td width="39" align="center"></td>
    <td align="left"><input name="button2" type="submit" class="butqx" id="button2"value=""></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="275"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="2" background="/WebTest/images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="/WebTest/images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
</form>
</body>
</html>