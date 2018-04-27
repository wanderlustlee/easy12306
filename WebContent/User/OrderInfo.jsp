<%@ page import="user.domin.OrderQueryVO" %>
<%@ page import="user.domin.OrderVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单信息</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">

</head>
<body class="write_bg">
<form name="form1" method="post" action="../userReveServlet?action=QueryOrder">

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
            <td width="822" align="left" valign="top"  class="text_blod_title">订单信息</td>
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
                        <td width="6%" align="center" class="text_cray1">车次</td>
                        <td width="8%" align="left" class="text_cray1"><label>
                            <input name="textfield1" type="text" class="text_cray" style="width:50px" value="<%= session.getAttribute("conditionOrder") != null ? ((OrderQueryVO) session.getAttribute("conditionOrder")).getTrain() : ""%>">
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">日期</td>
                        <td width="10%" align="left" class="text_cray1"><label>
                            <input name="textfield2" type="date" class="text_cray" style="width:115px" value="<%= session.getAttribute("conditionOrder") != null ? ((OrderQueryVO) session.getAttribute("conditionOrder")).getDate() : ""%>">
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">出发地</td>
                        <td width="14%" align="left" class="text_cray1"><label>
                            <input name="textfield3" type="text" class="text_cray" style="width:100px" value="<%= session.getAttribute("conditionOrder") != null ? ((OrderQueryVO) session.getAttribute("conditionOrder")).getOrigin() : ""%>">
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">目的地</td>
                        <td width="14%" align="left" class="text_cray1"><label>
                            <input name="textfield4" type="text" class="text_cray" style="width:100px" value="<%= session.getAttribute("conditionOrder") != null ? ((OrderQueryVO) session.getAttribute("conditionOrder")).getDestination() : ""%>">
                        </label></td>
                        <td width="6%" align="center" class="text_cray1">状态</td>
                        <td width="10%" align="left" class="text_cray1"><label>
                            <select name="select" class="text_cray">
                                <option value="" <%= session.getAttribute("conditionOrder") != null && ((OrderQueryVO)session.getAttribute("conditionOrder")).getStatus() == 0 ? "selected=\"seleted\"" : ""%>></option>
                                <option value="已购票" <%= session.getAttribute("conditionOrder") != null && ((OrderQueryVO)session.getAttribute("conditionOrder")).getStatus() == 1 ? "selected=\"seleted\"" : ""%>>已购票</option>
                                <option value="已改签" <%= session.getAttribute("conditionOrder") != null && ((OrderQueryVO)session.getAttribute("conditionOrder")).getStatus() == 2 ? "selected=\"seleted\"" : ""%>>已改签</option>
                                <option value="已退票" <%= session.getAttribute("conditionOrder") != null && ((OrderQueryVO)session.getAttribute("conditionOrder")).getStatus() == 3 ? "selected=\"seleted\"" : ""%>>已退票</option>
                            </select>
                        </label></td>

                        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
                            <input name="submitQuery" type="submit" class="butcx" value="">
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
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">日期时间</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">出发地</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">目的地</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">状态</td>
                            <td width="84" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">价格</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
                        </tr>
                        <tr align="center">
                            <td height="15" colspan="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="772" height="6"></td>
                        </tr>

                        <%
                            if (session.getAttribute("arrayListOrder") != null) {
                                ArrayList<OrderVO> arrayList = (ArrayList<OrderVO>)session.getAttribute("arrayListOrder");
                                for (int i = 0; i < arrayList.size(); ++i) {
                                    String status = null;
                                    if (arrayList.get(i).getStatus() == 1) {
                                        status = "已购票";
                                    } else if (arrayList.get(i).getStatus() == 2) {
                                        status = "已改签";
                                    } else if (arrayList.get(i).getStatus() == 3) {
                                        status = "已退票";
                                    }
                        %>
                        <tr align="center" bgcolor=<%= i % 2 == 0 ? "FFFFFF" : "F5F5F5" %>>
                            <td width="88" height="30" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getTrain()%></td>
                            <td width="120" height="30" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getStartTime()%></td>
                            <td width="120" height="30" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getOrigin()%></td>
                            <td width="120" height="30" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getDestination()%></td>
                            <td width="120" height="30" bordercolor="#FFFFFF" class="text_cray1"><%= status%></td>
                            <td width="84" height="30" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getPrice()%></td>
                            <td width="120" height="30" bordercolor="#FFFFFF" class="text_cray1">
                                <%
                                    if (!status.equals("已改签") && !status.equals("已退票")) {
                                %>
                                <a onclick="sureChange()" style="text-decoration:none" href="../userReveServlet?action=ticketChange&ssid=<%= (Integer.parseInt((String) session.getAttribute("curPageOrder")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageOrder"))) + i%>" class="text_red">改签</a>
                                &nbsp;&nbsp;
                                <a onclick="sureDel()" style="text-decoration:none" href="../userReveServlet?action=refund&ssid=<%= (Integer.parseInt((String) session.getAttribute("curPageOrder")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageOrder"))) + i%>" class="text_red">退票</a>
                                <%
                                    }
                                %>
                            </td>
                        </tr>
                        <%
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
                                <select name="select2" id="select2" onchange="changeMaxPrePage(this.value)">
                                    <option <%= session.getAttribute("everyPageOrder") != null && "1".equals(session.getAttribute("everyPageOrder")) ? "selected=\"seleted\"" : ""%>>1</option>
                                    <option <%= session.getAttribute("everyPageOrder") != null && "2".equals(session.getAttribute("everyPageOrder")) ? "selected=\"seleted\"" : ""%>>2</option>
                                    <option <%= session.getAttribute("everyPageOrder") != null && "3".equals(session.getAttribute("everyPageOrder")) ? "selected=\"seleted\"" : ""%>>3</option>
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
                tmpStr += '<a href="../userReveServlet?action=changePageOrder&pageNum=' + i + '&numPrePage=' + numPrePage + ' "> ' + i + " </a> ";
            }
        }
        document.getElementById("pageLinks").innerHTML = tmpStr;
    }

    function changeMaxPrePage(value) {
        var address = "../userReveServlet?action=changePageOrder&numPrePage=" + value;
        window.location.href = address;
    }

    function sureDel() {
        if (!confirm("你确定要退票吗？")) {
            window.event.returnValue = false;
        }
    }

    function sureChange() {
        if (!confirm("你确定要改签吗？")) {
            window.event.returnValue = false;
        }
    }

    writePageLinks(<%= session.getAttribute("maxPageOrder")%>, <%= session.getAttribute("curPageOrder")%>);
</script>
</html>
