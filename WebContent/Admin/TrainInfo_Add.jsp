
<%@ page import="user.util.IsNullUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增车次信息</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="../AdminServelet?action=addTrain" method="post">
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
            <td width="771" height="30" valign="top"  class="text_blod_title">新增车次信息</td>
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
                            String validate = (String)session.getAttribute("validateAddTrain");
                            String exist = (String)session.getAttribute("existAddTrain");
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
                            <select name="select" class="text_cray">
                                <option value="G" <%= session.getAttribute("typeAddTrain") != null && "G".equals(session.getAttribute("typeAddTrain")) ? "selected=\"seleted\"" : ""%>>G</option>
                                <option value="K" <%= session.getAttribute("typeAddTrain") != null && "K".equals(session.getAttribute("typeAddTrain")) ? "selected=\"seleted\"" : ""%>>K</option>
                                <option value="Z" <%= session.getAttribute("typeAddTrain") != null && "Z".equals(session.getAttribute("typeAddTrain")) ? "selected=\"seleted\"" : ""%>>Z</option>
                                <option value="T" <%= session.getAttribute("typeAddTrain") != null && "T".equals(session.getAttribute("typeAddTrain")) ? "selected=\"seleted\"" : ""%>>T</option>
                                <option value="D" <%= session.getAttribute("typeAddTrain") != null && "D".equals(session.getAttribute("typeAddTrain")) ? "selected=\"seleted\"" : ""%>>D</option>
                                <option value="C" <%= session.getAttribute("typeAddTrain") != null && "C".equals(session.getAttribute("typeAddTrain")) ? "selected=\"seleted\"" : ""%>>C</option>
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
                        <td class="text_cray"><input type="text" name="textfield2" id="textfield2" value="<%= session.getAttribute("trainNumAddTrain") != null ? ((String)session.getAttribute("trainNumAddTrain")) : ""%>"/>
                            由数字组成，长度为4位</td>
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
                            <input name = "stationNum" id = "stationNum" type = "text" value="<%= session.getAttribute("showNumAddTrain") != null ? ((String)session.getAttribute("showNumAddTrain")) : ""%>"/>
                            由数字组成
                            <input name = "confirm" type = "submit" value = "确定" />
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
                        if(session.getAttribute("showNumAddTrain") != null){
                            for(int i = 0 ; i < Integer.parseInt((String) session.getAttribute("showNumAddTrain")); ++i){
                    %>
                    <tr>
                        <td width="%3" align="center" class="text_red">&nbsp;</td>
                        <td width="10%" height="40" align="left" class="text_cray1"><input style="width:100px" type="textfield" name="station" /></td>
                        <td width="7%"></td>
                        <td width="13%"><input style="width:125px" type="Date" name="date" /></td>
                        <td width="7%"></td>
                        <td width="10%" align="left" ><input style="width:70px" type="time" name="clock" /></td>
                        <td width="7%"></td>
                        <td width="10%" align="center" ><input style="width:50px" type="text" name="price" value="<%= i == 0 ? "0" : ""%>" /></td>
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
                        <td width="164" align = "right"><input name="submitAddTrain" type="submit" class="buttj" id="button" value=""></td>
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
