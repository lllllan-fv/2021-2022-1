<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/10/11
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

</head>
<body>

<%
    Cookie[] cookies = request.getCookies();
    String id = "", pwd = "";
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("id")) id = cookie.getValue();
        if (cookie.getName().equals("pwd")) pwd = cookie.getValue();
    }
%>

<div class="container" style="padding-top: 5em">
    <form class="form-horizontal" action='login_deal.jsp' method='POST' onsubmit="return formSubmit();">

        <div class="form-group">
            <label for="id" class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-4">
                <input class="form-control" id="id" name="id" value="<%=id%>">
            </div>
        </div>

        <div class="form-group">
            <label for="pwd" class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="pwd" name="pwd" value="<%=pwd%>">
            </div>
        </div>

        <div class="form-group col-sm-6">
            <center>
                <button type="submit" name="submit" class="btn btn-default">提交</button>&emsp;
                <button type="button" class="btn btn-default" onclick="reSet();">重置</button>
            </center>
        </div>
    </form>
</div>

<script>
    function formSubmit() {
        if ($("#id").val() == "zhangsan" && $("#pwd").val() == "123456") {
            <%
                 Cookie idChookie = new Cookie("id","zhangsan");
                 Cookie pwdChookie = new Cookie("pwd","123456");
                 response.addCookie(idChookie);
                 response.addCookie(pwdChookie);
            %>
            return true;
        }
        return false;
    }

    function reSet() {
        $("#id").val("<%=id%>");
        $("#pwd").val("<%=pwd%>");
    }
</script>

</body>
</html>
