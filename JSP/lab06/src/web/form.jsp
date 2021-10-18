<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/10/18
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>form</title>

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


<form action="result.jsp" method="post" onsubmit="return formSubmit();" class="form-horizontal">
    <div class="form-group">
        <div class="col-sm-3">
            <input class="form-control" oninput="value=value.replace(/[^\d]/g,'')" name="guessNum" id="guessNum"
                   placeholder="请输入一个数字"
                   autofocus="autofocus">
        </div>
        <button type="submit" class="btn btn-default ">送出</button>
    </div>
</form>

<script>
    function formSubmit() {
        var guess = $("#guessNum").val();

        if (guess == "") return false;

        <%
            Object guessAns = session.getAttribute("guessAns");
            if (guessAns == null) {
                int rnd = new Random().nextInt(100) + 1;
                session.setAttribute("guessAns", rnd);
            }
        %>

        return true;
    }
</script>

</body>
</html>
