<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/4
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginForm</title>

</head>
<body>

<form action="#" method="post" onsubmit="">
    <div class="input-group">
        <i class="bi bi-person-circle" style="font-size: 3rem"></i>
        <input type="text" placeholder="手机号"/>
    </div>
    <div class="input-group">
        <i class="bi bi-lock" style="font-size: 3rem"></i>
        <input type="password" placeholder="密  码"/>
    </div>
    <button class="btn_login" onClick="cambiar_login()">登录</button>
</form>

</body>
</html>
