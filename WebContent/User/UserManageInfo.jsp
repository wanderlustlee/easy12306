<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.domin.UserVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看个人信息</title>
<link href="/WebTest/css/css.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function UpdateInfo(){
	
	
	window.location.href="/WebTest/User/UserManageInfo_Edit.jsp";
	
	}
</script>
</head>
<body class="write_bg">
<form name="form1" method="post" action="">
<%UserVO user=((UserVO)session.getAttribute("user")); %>
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30">&nbsp;</td>
    </tr>
  </table>
  <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" align="center" ></td>
  </tr>
  <tr>
    <td width="64" align="center" ></td>
    <td width="771" height="30" align="left" valign="top" ><span class="text_blod_title">查看个人信息</span></td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="/WebTest/images/line1.jpg" width="835" height="6"></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"  ><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="4"  ></td>
          </tr>
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">个人详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td width="350" align="left" class="text_cray"><%=user.getName() %></td>
            <td width="230" rowspan="5" align="center" background="/WebTest/images/bg_point_write.gif" class="text_cray"><img src="/WebTest/images/photo.jpg" width="139" height="139"></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td align="left" class="text_cray"><%=user.getRealName() %></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">性 别：</td>
            <td align="left" class="text_cray"><%=user.getSex() %></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省份：</td>
            <td align="left" class="text_cray"><%=user.getProvince() %></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">城市：</td>
            <td align="left" class="text_cray"><%=user.getCity() %></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <td colspan="2" align="left" class="text_cray"><%=user.getDocType() %></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td colspan="2" align="left" class="text_cray"><%=user.getDocNum() %></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td colspan="2" align="left" class="text_cray"><%=user.getBirthday() %></td>
          </tr>
          <tr>
            <td width="20" height="40" ></td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td colspan="3" align="left" class="text_cray"><%=user.getPersonType() %></td>
          </tr>
          <tr>
            <td width="20" height="40"></td>
            <td width="100" height="40" align="left" class="text_cray1">备注：</td>
            <td height="40" colspan="2" align="left" class="text_cray"><%=user.getRemarks() %></td>
          </tr>
        </table><br>
      <table width="100%" border="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="263" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="center"><input name="button" type="button" class="butxg" id="button"value="" onClick="UpdateInfo()"></td>
          </tr>
      </table>
    </table>
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="20"></td>
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