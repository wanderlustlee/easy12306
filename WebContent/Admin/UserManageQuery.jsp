<%@ page import="java.util.ArrayList" %>
<%@ page import="user.domin.UserVO" %>
<%@ page import="user.domin.UserQueryVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有用户管理</title>
    <link href="/WebTest/css/css.css" rel="stylesheet" type="text/css">
    <script language="javascript">
        function UserAdd(){


            window.navigate("UserInfo_Add.jsp");

        }
    </script>

    <script>
    function changeMaxPrePage(value) {
        var address = "../AdminServelet?action=query&numPrePage=" + value;
        window.location.href = address;
    }
    
        function EditPWD(obj1, obj2) {
            if (obj1 != null && obj1 != "" && obj2 != null && obj2 != "") {
                var aa = document.getElementsByName(obj1)[obj2];
                aa.value = aa.id;
            }
        }

        function selectAllNullorReserve(obj,type){
            if(obj!=null&&obj!=""){
                if(document.getElementsByName(obj)!=undefined&&document.getElementsByName(obj).length>0){	//getElementsByName函数的作用按名字查找对象，返回一个数组。
                    var userids = document.getElementsByName(obj);
                    if(type=="全选"){
                        for(var i=0;i<userids.length;i++){
                            if(userids[i].checked == false){
                                userids[i].checked = true;
                            }
                        }
                    }else if(type=="全不选"){
                        for(var i=0;i<userids.length;i++){
                            if(userids[i].checked == true){
                                userids[i].checked = false;
                            }
                        }
                    }else if(type=="反选"){
                        for(var i=0;i<userids.length;i++){
                            if(userids[i].checked == true){
                                userids[i].checked = false;
                            }else{
                                userids[i].checked = true;
                            }
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="write_bg">
<form name="form1" method="post" action="../AdminServelet?action=query">

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
            <td width="822" align="left" valign="top"  class="text_blod_title">用户管理</td>
        </tr>
        <tr>
            <td height="15" colspan="2" align="center" ><img src="/WebTest/images/line.jpg" width="850" height="6"></td>
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
                        <td width="5"></td>
                        <td width="4%" height="25" align="left" class="text_cray1">姓名</td>
                        <td width="11%" align="left" class="text_cray1"><label>
                            <input name="textfield" type="text" class="text_cray" style="width:80px" value="<%= session.getAttribute("condition") != null ? ((UserQueryVO)session.getAttribute("condition")).getName() : ""%>">
                        </label></td>
                        <td width="6%" align="center" class="text_cray1">性别</td>
                        <td width="6%" align="left" class="text_cray1"><label>
                            <select name="select" class="text_cray">
                                <option value="M" <%= session.getAttribute("condition") != null && "M".equals(((UserQueryVO)session.getAttribute("condition")).getSex()) ? "selected=\"seleted\"" : ""%>>男</option>
                                <option value="F" <%= session.getAttribute("condition") != null && "F".equals(((UserQueryVO)session.getAttribute("condition")).getSex()) ? "selected=\"seleted\"" : ""%>>女</option>
                            </select>
                        </label></td>
                        <td width="9%" align="center" class="text_cray1">证件类型</td>
                        <td width="13%" align="left" class="text_cray1"><label>
                            <select class="text_cray" name="loginUserDTO.id_type_code" id="cardType">
                                <option value="1" <%= session.getAttribute("condition") != null && "1".equals(((UserQueryVO)session.getAttribute("condition")).getDocType()) ? "selected=\"seleted\"" : ""%>>二代身份证</option>
                                <option value="2" <%= session.getAttribute("condition") != null && "2".equals(((UserQueryVO)session.getAttribute("condition")).getDocType()) ? "selected=\"seleted\"" : ""%>>港澳通行证 </option>
                                <option value="3" <%= session.getAttribute("condition") != null && "3".equals(((UserQueryVO)session.getAttribute("condition")).getDocType()) ? "selected=\"seleted\"" : ""%>>台湾通行证</option>
                                <option value="4" <%= session.getAttribute("condition") != null && "4".equals(((UserQueryVO)session.getAttribute("condition")).getDocType()) ? "selected=\"seleted\"" : ""%>>护照</option>
                            </select>
                        </label></td>
                        <td width="8%" align="center" class="text_cray1">证件号码</td>
                        <td width="13%" align="left" class="text_cray1"><label>
                            <input name="textfield2" type="text" class="text_cray" style="width:100px" value="<%= session.getAttribute("condition") != null ? ((UserQueryVO)session.getAttribute("condition")).getDocNum() : ""%>">
                        </label></td>
                        <td width="8%" align="center" class="text_cray1">旅客类型</td>
                        <td width="13%" align="left" class="text_blod"><label>
                            <select class="text_cray" id="passengerType" name="passenger_type" style="width:100px">
                                <option value="1" <%= session.getAttribute("condition") != null && "1".equals(((UserQueryVO)session.getAttribute("condition")).getPersonType()) ? "selected=\"seleted\"" : ""%>>成人</option>
                                <option value="2" <%= session.getAttribute("condition") != null && "2".equals(((UserQueryVO)session.getAttribute("condition")).getPersonType()) ? "selected=\"seleted\"" : ""%>>儿童</option>
                                <option value="3" <%= session.getAttribute("condition") != null && "3".equals(((UserQueryVO)session.getAttribute("condition")).getPersonType()) ? "selected=\"seleted\"" : ""%>>学生</option>
                                <option value="4" <%= session.getAttribute("condition") != null && "4".equals(((UserQueryVO)session.getAttribute("condition")).getPersonType()) ? "selected=\"seleted\"" : ""%>>残疾军人、伤残人民警察</option>
                            </select>
                        </label></td>
                        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
                            <input name="Submit" type="submit" class="butcx" value="">
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
            <td width="835" background="/WebTest/images/wb_01 (3).jpg">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <table width="553" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF">
                        <tr align="center">
                            <td width="44" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
                            <td width="98" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">姓名</td>
                            <td width="80" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">性别</td>
                            <td width="132" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">证件类型</td>
                            <td width="247" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">证件号码</td>
                            <td width="82" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">旅客类型</td>
                            <td width="89" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
                        </tr>
                        <tr align="center">
                            <td height="15" colspan="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="790" height="6"></td>
                        </tr>
						<%int i = 0; %>
			
                        <%
                            if (session.getAttribute("arrayList") != null) {
                                ArrayList<UserVO> arrayList = (ArrayList<UserVO>)session.getAttribute("arrayList");

                                for ( i = 0; i < arrayList.size(); ++i) {
/*
                                    if (arrayList.get(i).getDocType().equals("1")) {
                                        arrayList.get(i).setDocType("二代身份证");
                                    } else if (arrayList.get(i).getDocType().equals("C")) {
                                        arrayList.get(i).setDocType("港澳通行证");
                                    } else if (arrayList.get(i).getDocType().equals("G")) {
                                        arrayList.get(i).setDocType("台湾通行证");
                                    } else if (arrayList.get(i).getDocType().equals("B")) {
                                        arrayList.get(i).setDocType("护照");
                                    }

                                    if (arrayList.get(i).getPersonType().equals("1")) {
                                        arrayList.get(i).setPersonType("成人");
                                    } else if (arrayList.get(i).getPersonType().equals("2")) {
                                        arrayList.get(i).setPersonType("儿童");
                                    } else if (arrayList.get(i).getPersonType().equals("3")) {
                                        arrayList.get(i).setPersonType("学生");
                                    } else if (arrayList.get(i).getPersonType().equals("4")) {
                                        arrayList.get(i).setPersonType("残疾军人、伤残人民警察");
                                    }*/

                        %>
                        <tr align="center" bgcolor=<%= i % 2 == 0 ? "FFFFFF" : "F5F5F5" %>>
                            <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="<%= i%>"></td>
                            <td width="98" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getName()%></td>
                            <td width="80" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getSex().equals("M") ? "男" : "女"%></td>
                            <td width="132" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getDocType()%></td>
                            <td width="247" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getDocNum()%></td>
                            <td width="82" bordercolor="#FFFFFF" class="text_cray1"><%= arrayList.get(i).getPersonType()%></td>
                            <td width="89" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.jsp?count=<%=i%>" class="text_red">编辑</a></td>
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
                        <tr align="center">
                            <td width="102" align="left"  class="text_cray1"><a href="#">
                                <label></label>
                                <label></label>
                                <label>
                                    <input type="checkbox" name="checkbox" value="11"  onclick="selectAllNullorReserve('checkbox','反选');" ><span class="text_blue">全选</span></label>
                            </a></td>
                            <td width="525" align="right"  class="text_cray1"><a href="#">
                                <!--<input type="button" name="Submit23" value="新增" onClick="UserAdd()"> -->
                            </a></td>
                            <td width="55" align="right"  class="text_cray1">
                                <input name="submit2" id="submit2" type="submit" class="butsc" value="" >
                            </td>
                            <td width="91" align="right"  class="text_cray1"><label>
                                <input name="Submit3" type="button" class="butdc" value="">
                            </label></td>
                        </tr>
                    </table>
                    <br>
                    <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr align="center" style="width:60%">
                            <td width="154" align="center"  class="text_cray">&nbsp;</td>
                            <td width="465" align="center"  class="text_cray"  id="pageLinks"></td>
                            <td width="154" align="right"  class="text_cray1" style="width:20%"><label class="text_cray"> 每页显示
                                <select name="select2" id="select2" onchange="changeMaxPrePage(this.value)">
                                    <option <%= session.getAttribute("everyPage") != null && "10".equals(session.getAttribute("everyPage")) ? "selected=\"seleted\"" : ""%>>10</option>
                                    <option <%= session.getAttribute("everyPage") != null && "20".equals(session.getAttribute("everyPage")) ? "selected=\"seleted\"" : ""%>>20</option>
                                    <option <%= session.getAttribute("everyPage") != null && "30".equals(session.getAttribute("everyPage")) ? "selected=\"seleted\"" : ""%>>30</option>
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
            <td height="2" background="/WebTest/images/bottom_point.gif"></td>
        </tr>
        <tr>
            <td height="25" align="center" background="/WebTest/images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
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
                tmpStr += " " +i+" ";
            }
            else {
                tmpStr += '<a href="../AdminServelet?action=changePage&pageNum=' + i + '&numPrePage=' + numPrePage + ' "> ' + i + " </a> ";
            }
        }
        document.getElementById("pageLinks").innerHTML = tmpStr;
    }
    writePageLinks(<%= session.getAttribute("maxPage")%>, <%= session.getAttribute("curPage")%>);
</script>
</html>
