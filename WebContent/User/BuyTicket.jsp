<%@ page import="user.domin.TrainVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.util.IsNullUtil" %>
<%@ page import="user.domin.TicketQueryVO" %>
<%@ page import="user.domin.OrderVO" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2017-07-11
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订票</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <script language="JavaScript">
        function sureBuy() {
            if (!confirm("你确定要预定吗？")) {
                window.event.returnValue = false;
            }
        }

        function changeMaxPrePage(obj, value) {
            var aa = document.getElementById(obj);

            if (aa.value != null && aa.value != "") {
                var address = "../userReveServlet?action=changePageTicket&numPrePage=" + value;
                window.location.href = address;
            }
        }

        function check_origin(obj, obj1) {
            var aa = document.getElementById(obj);
            var bb = document.getElementById(obj1);

            if (aa.value == null || aa.value == "") {
                alert("出发地不能为空！");
                return false;
            } else if (bb.value == null || bb.value == ""){
                alert("目的地不能为空！");
                return false;1
            } else if (aa.value != null && aa.value != "" && aa.value == bb.value) {
                alert("出发地与目的地不能相同！");
                return false;
            }
            return true;
        }

    </script>
</head>
<body class="write_bg">
<!--
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td  background="images/ny_top_img_bg.gif"><img src="images/ny_top_img.gif" width="650" height="108"></td>
  </tr>
  <tr>
    <td align="right">
    	<p align="right"><a style="text-decoration:none" href = "PassengerInfo.jsp">个人信息</a> |
    	<a style="text-decoration:none" href = "javascript:window.top.location.href='LogoutServlet?action=Logout'">退出&nbsp;&nbsp;</a></p>
    </td>
  </tr>
</table>
-->
<form name="form1" method="post" action="../userReveServlet?action=BuyTicket" onsubmit="return check_origin('origin', 'destination');">
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
            <td width="822" align="left" valign="top"  class="text_blod_title">车票信息</td>
        </tr>
        <tr>
            <td height="15" colspan="2" align="center" ><img src="../images/line.jpg" width="850" height="6"></td>
        </tr>
        <tr>
            <td height="15" colspan="2"  ></td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="835" background="../images/wb_01 (3).jpg">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="2%"></td>
                        <td width="8%" align="center" class="text_cray1">类型</td>
                        <td width="8%" align="left" class="text_cray1"><label>
                            <select name="select" class="text_cray">
                                <%
                                    String type = "";
                                    String date = "";
                                    String origin = "";
                                    String destination = "";

                                    if (session.getAttribute("conditionTicket") != null) {
                                        type = ((TicketQueryVO)session.getAttribute("conditionTicket")).getType();
                                        date = ((TicketQueryVO)session.getAttribute("conditionTicket")).getDate();
                                        origin = ((TicketQueryVO)session.getAttribute("conditionTicket")).getOrigin();
                                        destination = ((TicketQueryVO)session.getAttribute("conditionTicket")).getDestination();
                                    }
                                %>
                                <option value="" <%= "".equals(type) ? "selected=\"seleted\"" : ""%>></option>
                                <option value="G" <%= "G".equals(type) ? "selected=\"seleted\"" : ""%>>G</option>
                                <option value="K" <%= "K".equals(type) ? "selected=\"seleted\"" : ""%>>K</option>
                                <option value="Z" <%= "Z".equals(type) ? "selected=\"seleted\"" : ""%>>Z</option>
                                <option value="T" <%= "T".equals(type) ? "selected=\"seleted\"" : ""%>>T</option>
                                <option value="D" <%= "D".equals(type) ? "selected=\"seleted\"" : ""%>>D</option>
                                <option value="C" <%= "C".equals(type) ? "selected=\"seleted\"" : ""%>>C</option>
                            </select>
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">出发日期</td>
                        <td width="18%" align="left" class="text_cray1"><label>
                            <input name="textfield" type="date" class="text_cray" style="width:115px" value="<%= date%>">
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">出发地</td>
                        <td width="18%" align="left" class="text_cray1"><label>
                            <input name="textfield3" id="origin" type="text" class="text_cray" style="width:100px" value="<%= origin%>">
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">目的地</td>
                        <td width="18%" align="left" class="text_cray1"><label>
                            <input name="textfield4" id="destination" type="text" class="text_cray" style="width:100px" value="<%= destination%>">
                        </label></td>

                        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
                            <input name="submitQuery" type="submit" class="butcx" value="" >
                        </label></td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td height="20" colspan="8" align="center">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="835" background="../images/wb_01 (3).jpg">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <table width="774" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF" >
                        <tr align="center"><!-- 772 -->
                            <td width="88" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">车次</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">出发地</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">出发时间</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">目的地</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">到达时间</td>
                            <td width="84" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">价格</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
                        </tr>
                        <tr align="center">
                            <td height="15" colspan="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="772" height="6"></td>
                        </tr>

                        <%
                            if (session.getAttribute("arrayListTicket") != null) {
                                ArrayList<OrderVO> arrayListOrder = (ArrayList<OrderVO>) session.getAttribute("orderTicket");
                                ArrayList<TrainVO> arrayList = (ArrayList<TrainVO>) session.getAttribute("arrayListTicket");
                                String clockStart = null;
                                String clockEnd = null;
                                for(int i = 0; i < arrayList.size(); ++i){
                                    String[] stations = arrayList.get(i).getStation().split(" ");
                                    String[] clocks = arrayList.get(i).getTime().split(" ");
                                    String[] dates = arrayList.get(i).getDate().split(" ");
                                    String[] price = arrayList.get(i).getPrice().split(" ");
                                    String originShow = null;
                                    String destinationShow = null;
                                    String priceStart = null;
                                    String priceEnd = null;
                                    int status = -1;

                                    for (OrderVO bb : arrayListOrder) {
                                        if (bb.getTrain().equals(arrayList.get(i).getType() + arrayList.get(i).getNumber()) && bb.getStatus() == 1 ) {
                                            status = 0;
                                            break;
                                        }
                                    }

                                    for (int j = 0; j < stations.length; ++j) {
                                        if (origin.equals(stations[j])) {
                                            clockStart = dates[j] + " " + clocks[j];
                                            originShow = stations[j];
                                            priceStart = price[j];
                                            break;
                                        }
                                    }

                                    if (IsNullUtil.isNull(destination)) {
                                        destinationShow = stations[stations.length - 1];
                                        clockEnd = dates[clocks.length - 1] + " " + clocks[clocks.length - 1];
                                        priceEnd = price[clocks.length - 1];
                                    } else {
                                        for (int j = stations.length - 1; j >= 0; --j) {
                                            if (destination.equals(stations[j])) {
                                                clockEnd = dates[j] + " " + clocks[j];
                                                destinationShow = stations[j];
                                                priceEnd = price[j];
                                                break;
                                            }
                                        }
                                    }
                        %>
                        <tr align="center" bgcolor=<%= i % 2 == 0 ? "FFFFFF" : "F5F5F5" %>>
                            <td width="88" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getType() + arrayList.get(i).getNumber()%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= originShow%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= clockStart%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= destinationShow%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= clockEnd%></td>
                            <td width="84" bordercolor="#FFFFFF" class="text_cray1"><%= Integer.parseInt(priceEnd) - Integer.parseInt(priceStart)%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1">
                                <a href="../userReveServlet?action=trainSchedule&ssid=<%= (Integer.parseInt((String) session.getAttribute("curPageTicket")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageTicket"))) + i%>" class="text_red">时刻表</a>
                                &nbsp;&nbsp;
                                <%
                                    if (status == -1) {
                                %>
                                    <a onclick="sureBuy()" href="../userReveServlet?action=reserve&ssid=<%= (Integer.parseInt((String) session.getAttribute("curPageTicket")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageTicket"))) + i%>" class="text_red" >购票</a>
                                <%
                                    } else {
                                %>
                                    已购票
                            </td>
                        </tr>
                        <%
                                    }
                                }
                            }
                        %>
                    </table>
                </table>
            </td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="835" background="../images/wb_01 (3).jpg">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <br>
                    <br>
                    <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr align="center" style="width:60%">
                            <td width="154" align="center"  class="text_cray">&nbsp;</td>
                            <td width="465" align="center"  class="text_cray"  id="pageLinks"></td>
                            <td width="154" align="right"  class="text_cray1" style="width:20%"><label class="text_cray"> 每页显示
                                <select name="select2" id="select2" onchange="changeMaxPrePage('origin', this.value)">
                                    <option <%= session.getAttribute("everyPageTicket") != null && "1".equals(session.getAttribute("everyPageTicket")) ? "selected=\"seleted\"" : ""%>>1</option>
                                    <option <%= session.getAttribute("everyPageTicket") != null && "2".equals(session.getAttribute("everyPageTicket")) ? "selected=\"seleted\"" : ""%>>2</option>
                                    <option <%= session.getAttribute("everyPageTicket") != null && "3".equals(session.getAttribute("everyPageTicket")) ? "selected=\"seleted\"" : ""%>>3</option>
                                </select>条信息</label></td>
                        </tr>
                    </table>
                    <br>
                </table>
            </td>
        </tr>
    </table>
    <tr>
        <td height="20"></td>
    </tr>
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
<script>
    function writePageLinks(maxPage, curPage) {

        tmpStr = "";
        var aa = document.getElementById("select2");
        var numPrePage = aa.value;

        for (var i = 1; i < maxPage + 1; i++) {
            if (curPage == i) {
                tmpStr += " " + i +" ";
            }
            else {
                tmpStr += '<a href="../userReveServlet?action=changePageTicket&pageNum=' + i + '&numPrePage=' + numPrePage + ' "> ' + i + " </a> ";
            }
        }
        document.getElementById("pageLinks").innerHTML = tmpStr;
    }
    writePageLinks(<%= session.getAttribute("maxPageTicket")%>, <%= session.getAttribute("curPageTicket")%>);
</script>
</html>
