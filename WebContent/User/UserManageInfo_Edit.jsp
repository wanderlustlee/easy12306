<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.domin.UserVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息修改</title>
<link href="/WebTest/css/css.css" rel="stylesheet" type="text/css">

</head>

<body class="write_bg">
<%UserVO user = ((UserVO)session.getAttribute("user")); %>
<form name="form1" method="post" action="../userReveServlet?action=userInfoEdit">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><br>
            <br></td>
  </tr>
</table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" align="center" ></td>
  </tr>
  <tr>
    <td width="64" height="11" class="text_blod_title"></td>
    <td width="786" height="30" align="left" class="text_blod_title">修改个人信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="../images/line1.jpg" width="835" height="6"></td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64"></td>
        <td width="772" height="25" align="left" class="text_cray">注：标有 <span class="text_red">*</span> 处，均为必填项</td>
      </tr>
      <tr>
        <td height="20" colspan="2"></td>
        </tr>
    </table>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          <tr>
    <%
            	String userMsg = (String)request.getAttribute("userMsg");
            	if(userMsg!=null){
            		%>
            		<%= userMsg %>
            		<%
            	}
            %>
            </tr>
          <tr>
            <td width="20" align="center" class="text_red1"></td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td width="350" align="left" class="text_cray1"><input name="textfield22" type="text" disabled="true" class="text_cray" id="textfield22" value="<%=user.getName() %>" readonly="readonly"/></td>
            <td width="230" colspan="-1" rowspan="7" align="center" background="../images/bg_point_write.gif" class="text_cray1"><img src="../images/photo_mr.jpg" width="120">              <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="15" ></td>
                </tr>
                <tr>
                  <td height="7" align="center" class="text_cray">上传照片</td>
                </tr>
                <tr>
                  <td height="8" ></td>
                </tr>
                <tr>
                  <td align="center"><input name="uploadFile" type="file" class="text_cray" size="20" /></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td width="20" ></td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td align="left" class="text_cray1"><input name="textfield2" type="text" disabled="true" class="text_cray" id="textfield2" value="<%=user.getRealName() %>" readonly="readonly"/></td>
          </tr>
          <tr>
            <td width="20" ></td>
            <td width="100" height="30" align="left" class="text_cray1">性 别：</td>
            <td align="left" class="text_cray1">
              <input type="radio" name="userDTO.sex_code" value="M" readonly="readonly" disabled="true" checked="checked"/>
          <span class="text_cray">
              <label>男</label>
              <input type="radio" name="userDTO.sex_code" value="F" readonly="readonly" disabled="true"/>
              <label>女</label>
              </span>
              <label></label>
<span><label></label>
</span> 
</td>
 </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省份：</td>
            <td align="left" class="text_cray1"><input name="textfield2" type="text" disabled="true" class="text_cray" id="textfield2" value="<%=user.getProvince() %>" readonly="readonly"/>            </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">城市：</td>
            <td align="left" class="text_cray1"><input name="textfield2" type="text" disabled="true" class="text_cray" id="textfield2" value="<%=user.getCity() %>" readonly="readonly"/>            </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <td align="left" class="text_cray1"><input name="textfield2" type="text" disabled="true" class="text_cray" id="textfield2" value="<%=user.getDocType() %>" readonly="readonly"/>            </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td align="left" class="text_cray1"><input name="textfield6" type="text" disabled="disabled" class="text_cray" id="textfield6"  value="<%=user.getDocNum() %>" readonly="true"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td colspan="2" align="left" class="text_cray1"><input name="textfield7" type="text" disabled="disabled" class="text_cray" id="textfield7" value="<%=user.getBirthday() %>" readonly="true"/>
           
            </td>
          </tr>
          <tr>
            <td width="20" height="35" ></td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td height="35" colspan="2" align="left" class="text_cray1"><select class="text_cray" id="passengerType" name="passenger_type">
              <option value="1">成人</option>
                <option value="2">儿童</option>
                <option value="3">学生</option>
                <option value="4">残疾军人、伤残人民警察</option>
            </select>            </td>
          </tr>
          <tr>
            <td height="10" colspan="4" align="center"></td>
          </tr>
          <tr>
            <td width="20" ></td>
            <td width="100" height="80" align="left" class="text_cray1">备注：</td>
            <td height="80" colspan="2" align="left" class="text_cray1"><textarea name="textarea" rows="8" class="text_cray" style="width:100%"></textarea>            </td>
          </tr>
        </table><br>
        <table width="100%" border="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="164"></td>
            <td width="99" height="30" align="center"><input name="button" type="submit" class="buttj" id="button"value=""></td>
            <td width="98" ></td>
            <td width="97" align="center"><input name="button2" type="reset" class="butcz" id="button2"value=""></td>
            <td width="92" ></td>
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
    <td height="2" background="../images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="../images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>

</form>
</body>
</html>