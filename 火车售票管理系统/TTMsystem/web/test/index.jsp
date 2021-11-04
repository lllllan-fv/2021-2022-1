<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/4
  Time: 0:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

    <!-- bootstrap-icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- 4.1.1 animate.min.css -->
    <link href="https://cdn.bootcdn.net/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <!-- 1.1.2 wow.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <!-- 2.6.9 vue.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.6.9/vue.min.js"></script>

    <!-- style.css -->
    <link href="../src/style/style.css" rel="stylesheet">

</head>
<body style="background-image: url('../src/img/background.jpg'); background-repeat: no-repeat;background-size: cover ">

<jsp:include page="head.jsp"></jsp:include>

<div id="login-box" class="jumbotron col-sm-3 col-sm-offset-2">
    <div class="col-sm-5 col-sm-offset-1 text-center">
        <a class="login-box-tab" href="#login" data-toggle="tab">用户登录</a>
    </div>
    <div class="col-sm-5 text-center">
        <a class="login-box-tab" href="#register" data-toggle="tab">用户注册</a>
    </div>

    <div class="tab-content col-sm-10 col-sm-offset-1" style="margin-top: 2em">
        <div class="tab-pane fade in active" id="login">
            <jsp:include page="loginForm.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" id="register">
            <jsp:include page="registerForm.jsp"></jsp:include>
        </div>
    </div>

</div>


<jsp:include page="foot.jsp"></jsp:include>


</body>
</html>
