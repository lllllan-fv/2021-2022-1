<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/10/18
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>success</title>

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
    int count = (int) session.getAttribute("count");
    int guessAns = (int) session.getAttribute("guessAns");
    long cost = (new Date().getTime() - session.getCreationTime());
%>

<div class="container">
    <h3>恭喜你，猜对了</h3>

    <h3>
        你一共猜了<%=count%>次
    </h3>

    <h3>
        用时<%=cost / 1000%>秒
    </h3>

    <h3>
        这个数字就是<%=guessAns%>
    </h3>

    <button class="btn btn-default" id="btn">再来一次</button>
</div>

<script>
    $("#btn").click(function () {
        <%
            session.invalidate();
        %>
        location.href = "guessForm.jsp";
    })
</script>

</body>
</html>
