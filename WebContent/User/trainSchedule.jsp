<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="user.domin.TrainVO" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>列车时刻表</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<form name="form1" method="post" action="">

<table width="1107" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"></td>
  </tr>
</table>
<table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="13" height="30" align="left" valign="top"  ></td>
    <td width="822" align="left" valign="top" class="text_blod_title">列车时刻表</td>
  </tr>
  <tr>
    <td height="15" colspan="2" align="center" ><img src="../images/line.jpg" width="850" height="6"></td>
  </tr>
  <tr>
    <td height="15" colspan="2"  ></td>
  </tr>
</table>
<table  width="60%" border="1" align="center" cellpadding="0" cellspacing="0" rules = "none">	
	<tr height="40">
		<td align="center" width="15%">&nbsp;</td>
		<td align="center">经停站</td>
		<td align="center">日期</td>
		<td align="center">出发时间</td>
		<td align="center" width="15%">&nbsp;</td>		
	</tr>
	<%
        HttpSession session1 = request.getSession();
        TrainVO trainVO = session1.getAttribute("Train") != null ? ((TrainVO) session1.getAttribute("Train")) : null;
        if (trainVO != null) {
            String[] stations = trainVO.getStation().split(" ");
            String[] clock = trainVO.getTime().split(" ");
            String[] date = trainVO.getDate().split(" ");
            int num = date.length;

	for(int i = 0 ; i < num ; ++i){
	%>	
	<tr height="40" bgcolor = <%= i % 2 == 0 ? "#F5F5F5" : "#FFFFFF" %>>
		<td align="center" width="15%">&nbsp;</td>
		<td align="center"><%= stations[i]%></td>
		<td align="center"><%= i == 0 ? date[i] : (date[i - 1].equals(date[i]) ? "" : date[i])%></td>
		<td align="center"><%= clock[i]%></td>
		<td align="center" width="15%">&nbsp;</td>	
	</tr>
	<%
	}
        }
	%>
</table>

<table height="20">
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