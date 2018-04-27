<%@ page import="user.domin.TrainVO" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2017-07-11
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑车次信息</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="../AdminServelet?action=editTrain" method="post">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td height="30"></td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20" colspan="2" ></td>
        </tr>
        <tr>
            <td width="64" height="30"  ></td>
            <td width="771" height="30" valign="top"  class="text_blod_title">编辑车次信息</td>
        </tr>
        <tr>
            <td height="15" colspan="2" ><img src="../images/line1.jpg" width="835" height="6"></td>
        </tr>
        <tr>
            <td colspan="2" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="10%"></td>
                        <td width="25%" height="25" align="left" class="text_cray">注：标有<span class="text_red"> *</span> 处，均为必填项</td>
                        <td width="65%">
                            <%
                                String validate = (String)session.getAttribute("validateEditTrain");
                                String exist = (String)session.getAttribute("existEditTrain");
                                if(validate != null) {
                            %>
                            <h4 style="color: red;"><%= validate%></h4>
                            <%
                            } else if (exist != null) {
                            %>
                            <h4 style="color: red;"><%= exist%></h4>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td height="15"></td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="20" colspan="3" ></td>
                    </tr>
                    <tr>
                        <td height="15" colspan="3" align="left" class="text_title">类型设置</td>
                    </tr>
                    <tr>
                        <td height="10" colspan="3" align="left" class="text_red1"></td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">车辆类型：</td>
                        <td><label>
                            <select name="select" class="text_cray" readonly="readonly" disabled="true" >
                                <option value="G" <%= session.getAttribute("Train") != null && "G".equals(((TrainVO) session.getAttribute("Train")).getType()) ? "selected=\"seleted\"" : ""%>>G</option>
                                <option value="K" <%= session.getAttribute("Train") != null && "K".equals(((TrainVO) session.getAttribute("Train")).getType()) ? "selected=\"seleted\"" : ""%>>K</option>
                                <option value="Z" <%= session.getAttribute("Train") != null && "Z".equals(((TrainVO) session.getAttribute("Train")).getType()) ? "selected=\"seleted\"" : ""%>>Z</option>
                                <option value="T" <%= session.getAttribute("Train") != null && "T".equals(((TrainVO) session.getAttribute("Train")).getType()) ? "selected=\"seleted\"" : ""%>>T</option>
                                <option value="D" <%= session.getAttribute("Train") != null && "D".equals(((TrainVO) session.getAttribute("Train")).getType()) ? "selected=\"seleted\"" : ""%>>D</option>
                                <option value="C" <%= session.getAttribute("Train") != null && "C".equals(((TrainVO) session.getAttribute("Train")).getType()) ? "selected=\"seleted\"" : ""%>>C</option>
                            </select>
                        </label></td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="15" colspan="3" align="left" class="text_title">编号信息</td>
                    </tr>
                    <tr>
                        <td height="10" colspan="3"></td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">车辆编号：</td>
                        <td class="text_cray"><input type="text" name="textfield2" id="textfield2" value="<%= session.getAttribute("Train") != null ? (((TrainVO) session.getAttribute("Train")).getNumber()) : ""%>" readonly="readonly" disabled="true" /></td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="20" colspan="6" ></td>
                    </tr>
                    <tr>
                        <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
                    </tr>
                    <tr>
                        <td height="10" colspan="6" ></td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">经停站数量：</td>
                        <td class="text_cray">
                            <input name = "stationNum" id = "stationNum" type = "text" value="<%= session.getAttribute("Train") != null ? String.valueOf((((TrainVO) session.getAttribute("Train")).getStation().split(" ")).length) : ""%>" readonly="readonly" disabled="true" />
                        </td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="20" colspan="6" ></td>
                    </tr>
                    <tr>
                        <td width="3%" align="center" class="text_red">&nbsp;</td>
                        <td width="10%" height="40" align="center">经停站</td>
                        <td width="7%"></td>
                        <td width="10%" align="center">始发日期</td>
                        <td width="7%"></td>
                        <td width="10%" align="center" >始发时间</td>
                        <td width="7%"></td>
                        <td width="10%" align="center" >价格</td>
                        <td width="36%"></td>
                    </tr>
                    <%//request.getAttribute(arg0)!=null
                        if(session.getAttribute("Train") != null){
                            String[] stations = ((TrainVO) session.getAttribute("Train")).getStation().split(" ");
                            String[] price = ((TrainVO) session.getAttribute("Train")).getPrice().split(" ");
                            String[] date = ((TrainVO) session.getAttribute("Train")).getDate().split(" ");
                            String[] time = ((TrainVO) session.getAttribute("Train")).getTime().split(" ");
                            int num = stations.length;
                            for(int i = 0 ; i < num; ++i){
                    %>
                    <tr>
                        <td width="%3" align="center" class="text_red">&nbsp;</td>
                        <td width="10%" height="40" align="left" class="text_cray1"><input style="width:100px" type="textfield" name="station" value="<%= stations[i]%>"/></td>
                        <td width="7%"></td>
                        <td width="13%"><input style="width:125px" type="Date" name="date" value="<%= date[i]%>"/></td>
                        <td width="7%"></td>
                        <td width="10%" align="left" ><input style="width:70px" type="time" name="clock" value="<%= time[i]%>"/></td>
                        <td width="7%"></td>
                        <td width="10%" align="center" ><input style="width:50px" type="text" name="price" value="<%= price[i]%>"/></td>
                        <td width="33%"></td>
                    </tr>
                    <% 	}
                    }%>

                    <tr>
                        <td></td>
                    </tr>
                </table>
    </table><br>
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td></td>
        </tr>
    </table>
    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="164" align = "right"><input name="submit" type="submit" class="buttj" id="button" value=""></td>
            <td width="99" height="30" align="center"></td>
            <td width="98" align = "left"><input name="button2" type="reset" class="butcz" id="button2" value=""></td>
            <td width="97" ></td>
            <td width="92" ></td>
        </tr>
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
<script type="text/JavaScript" src="../js/common.js"></script>
</body>
</html>
