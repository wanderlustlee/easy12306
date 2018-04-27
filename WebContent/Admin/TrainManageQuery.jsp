<%@ page import="java.util.ArrayList" %>
<%@ page import="user.domin.TrainQueryVO" %>
<%@ page import="user.domin.TrainVO" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2017-07-05
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有车次管理</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <script>
        function sureDel() {
            if (!confirm("你确定要删除吗？")) {
                window.event.returnValue = false;
            }
        }

        function changeMaxPrePage(value) {
            var address = "../AdminServelet?action=changePageTrain&numPrePage=" + value;
            window.location.href = address;
        }
    </script>
</head>
<body class="write_bg">
<form name="form1" method="post" action="../AdminServelet?action=queryTrain" >

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
            <td width="822" align="left" valign="top"  class="text_blod_title">车次管理</td>
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
                                <option value="" <%= session.getAttribute("conditionTrain") != null && "".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>></option>
                                <option value="G" <%= session.getAttribute("conditionTrain") != null && "G".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>>G</option>
                                <option value="K" <%= session.getAttribute("conditionTrain") != null && "K".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>>K</option>
                                <option value="Z" <%= session.getAttribute("conditionTrain") != null && "Z".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>>Z</option>
                                <option value="T" <%= session.getAttribute("conditionTrain") != null && "T".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>>T</option>
                                <option value="D" <%= session.getAttribute("conditionTrain") != null && "D".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>>D</option>
                                <option value="C" <%= session.getAttribute("conditionTrain") != null && "C".equals(((TrainQueryVO)session.getAttribute("conditionTrain")).getType()) ? "selected=\"seleted\"" : ""%>>C</option>
                            </select>
                        </label></td>

                        <td width="4%" height="25" align="left" class="text_cray1">编号</td>
                        <td width="18%" align="left" class="text_cray1"><label>
                            <input name="textfield" type="text" class="text_cray" style="width:80px" value="<%= session.getAttribute("conditionTrain") != null ? ((TrainQueryVO)session.getAttribute("conditionTrain")).getNumber() : ""%>">
                        </label></td>

                        <!--
                        <td width="8%" align="center" class="text_cray1">出发时间</td>
                        <td width="13%" align="left" class="text_cray1"><label>
                            <input name="textfield2" type="text" class="text_cray" style="width:100px" value="<%= session.getAttribute("conditionTrain") != null ? ((TrainQueryVO)session.getAttribute("conditionTrain")).getGoOff() : ""%>">
                        </label></td>  -->

                        <td width="8%" align="center" class="text_cray1">始发站</td>
                        <td width="18%" align="left" class="text_cray1"><label>
                            <input name="textfield3" type="text" class="text_cray" style="width:100px" value="<%= session.getAttribute("conditionTrain") != null ? ((TrainQueryVO)session.getAttribute("conditionTrain")).getOrigin() : ""%>">
                        </label></td>

                        <td width="8%" align="center" class="text_cray1">终点站</td>
                        <td width="18%" align="left" class="text_cray1"><label>
                            <input name="textfield4" type="text" class="text_cray" style="width:100px" value="<%= session.getAttribute("conditionTrain") != null ? ((TrainQueryVO)session.getAttribute("conditionTrain")).getDestination() : ""%>">
                        </label></td>

                        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
                            <input name="submit" type="submit" class="butcx" value="">
                        </label></td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td height="20" colspan="11" align="center">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="835" background="../images/wb_01 (3).jpg">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <table width="553" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF">
                        <tr align="center"><!-- 772 -->
                            <td width="44" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
                            <td width="44" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">类型</td>
                            <td width="80" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">编号</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">出发时间</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">始发站</td>
                            <td width="120" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">终点站</td>
                            <td width="244" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
                        </tr>
                        <tr align="center">
                            <td height="15" colspan="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="790" height="6"></td>
                        </tr>

                        <%
                            if (session.getAttribute("arrayListTrain") != null) {
                                ArrayList<TrainVO> arrayList = (ArrayList<TrainVO>)session.getAttribute("arrayListTrain");

                                for (int i = 0; i < arrayList.size(); ++i) {
                                    String[] stations = arrayList.get(i).getStation().split(" ");
                                    String origin = stations[0];
                                    String destination = stations[stations.length - 1];
                                    String date = arrayList.get(i).getDate().split(" ")[0];
                                    String clock = arrayList.get(i).getTime().split(" ")[0];
                        %>
                        <tr align="center" bgcolor=<%= i % 2 == 0 ? "FFFFFF" : "F5F5F5" %>>
                            <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="<%= (Integer.parseInt((String) session.getAttribute("curPageTrain")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageTrain"))) + i%>"></td>
                            <td width="44" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getType()%></td>
                            <td width="80" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getNumber()%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= date + " " + clock%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= origin%></td>
                            <td width="120" bordercolor="#FFFFFF" class="text_cray1"><%= destination%></td>
                            <td width="244" bordercolor="#FFFFFF" class="text_cray1">
                                <a href="../AdminServelet?action=trainSchedule&ssid=<%= (Integer.parseInt((String) session.getAttribute("curPageTrain")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageTrain"))) + i%>" class="text_red">时刻表</a>
                                &nbsp;&nbsp;
                                <a href="../AdminServelet?action=editTrain&ssid=<%= (Integer.parseInt((String) session.getAttribute("curPageTrain")) - 1) * (Integer.parseInt((String)session.getAttribute("everyPageTrain"))) + i%>" class="text_red">编辑</a>
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
                    <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr align="center"><!-- 580 -->
                            <td width="102" align="left"  class="text_cray1"><a href="#">
                                <label></label>
                                <label></label>
                                <label>
                                    <input type="checkbox" name="checkbox" value="11"  onclick="selectAllNullorReserve('checkbox','反选');" ><span class="text_blue">全选</span></label>
                            </a></td>
                            <td width="491" align="right"  class="text_cray1">
                                <label>
                                    <input type="submit" name="submit1" value="" style="width: 78px; height: 26px; border: 0; background-image: url(../images/button_zj.gif);" onclick="javascript:window.location.href='/Admin/AdminServelet'">
                                </label>
                            </td>
                            <td width="90" align="right"  class="text_cray1">
                                <label>
                                    <input name="submit2" id="submit2" type="submit" class="butsc" value="" onclick="sureDel()">
                                </label>
                            </td>
                            <td width="90" align="right"  class="text_cray1">
                                <label>
                                    <input name="submit3" type="submit" class="butdc" value="">
                                </label>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr align="center" style="width:60%">
                            <td width="154" align="center"  class="text_cray">&nbsp;</td>
                            <td width="465" align="center"  class="text_cray"  id="pageLinks"></td>
                            <td width="154" align="right"  class="text_cray1" style="width:20%"><label class="text_cray"> 每页显示
                                <select name="select2" id="select2" onchange="changeMaxPrePage(this.value)">
                                    <option <%= session.getAttribute("everyPageTrain") != null && "1".equals(session.getAttribute("everyPageTrain")) ? "selected=\"seleted\"" : ""%>>1</option>
                                    <option <%= session.getAttribute("everyPageTrain") != null && "2".equals(session.getAttribute("everyPageTrain")) ? "selected=\"seleted\"" : ""%>>2</option>
                                    <option <%= session.getAttribute("everyPageTrain") != null && "3".equals(session.getAttribute("everyPageTrain")) ? "selected=\"seleted\"" : ""%>>3</option>
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
                tmpStr += '<a href="../AdminServelet?action=changePageTrain&pageNum=' + i + '&numPrePage=' + numPrePage + ' "> ' + i + " </a> ";
            }
        }
        document.getElementById("pageLinks").innerHTML = tmpStr;
    }
    writePageLinks(<%= session.getAttribute("maxPageTrain")%>, <%= session.getAttribute("curPageTrain")%>);
</script>
</html>
