<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/10/11
  Time: 13:42
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

    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String name = request.getParameter("inputName");

    String age = request.getParameter("inputAge");

    String sex = request.getParameter("sexRadios");

    String edu = request.getParameter("eduSelect");

    String[] hobby = request.getParameterValues("hobbyCheckbox");
    String hobbys = "";
    for (String s : hobby) {
        hobbys += " " + s;
    }

    String info = request.getParameter("selfinfo");
%>

<br>
<br>
<div class="container">
    <p>
        姓名：<%=name%>
    </p>
    <p>
        年龄：<%=age%>
    </p>
    <p>
        学历：<%=edu%>
    </p>
    <p>
        兴趣爱好：<%=hobbys.trim().replaceAll(" ", ", ")%>
    </p>
    <p>
        个人简介：<%=info%>
    </p>
</div>
</body>
</html>
