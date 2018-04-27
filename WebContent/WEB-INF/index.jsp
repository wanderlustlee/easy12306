<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action ="RegServlet" method="Post" onsubmit="return reg(this);">
        <table align="center" border="0", width="500">
        <tr>
           <td align ="right" width ="30%">用户名:</td>
           <td><input type ="text" name ="username" class="box"></td>           
        </tr>
         <tr>
           <td align ="right" width ="30%">密码:</td>
           <td><input type ="text" name ="password" class="box"></td>           
        </tr>
         <tr>
           <td align ="right" width ="30%">性别:</td>
           <td><input type ="radio" name ="sex" value="男" checked="checked">男
           <input type ="radio" name ="sex" value="女" >女</td>           
        </tr>
         <tr>
           <td align ="right" width ="30%">密码找回问题:</td>
           <td><input type ="text" name ="question" class="box"></td>           
        </tr>
        <tr>
           <td align ="right" width ="30%">密码找回答案:</td>
           <td><input type ="text" name ="answer" class="box"></td>           
        </tr>
        <tr>
           <td align ="right" width ="30%">邮箱:</td>
           <td><input type ="text" name ="email" class="box"></td>           
        </tr>
        <tr>
            <td colspan="2" align="center" height="40">
            <input type ="submit" value="注册">
            <input type ="reset" value="重置">
            </td>
        </tr> 

</body>
</html>