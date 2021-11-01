<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/1
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getScore</title>

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

<jsp:useBean id="student" class="cn.lllllan.bean.StudentBean">
    <jsp:setProperty name="student" property="*"/>
</jsp:useBean>


<div class="container" style="padding-top: 2em">
    <h3>
        学生学号:
        <jsp:getProperty name="student" property="account"/>
    </h3>

    <h3>
        学生姓名:
        <jsp:getProperty name="student" property="name"/>
    </h3>

    <h3>
        课程名称:
        <jsp:getProperty name="student" property="course"/>
    </h3>


    <h3>
        课程分数:
        <jsp:getProperty name="student" property="fraction"/>
    </h3>
</div>

</body>
</html>
