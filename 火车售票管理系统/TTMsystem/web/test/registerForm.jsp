<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/4
  Time: 19:36
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

    <!-- bootstrap-icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- 4.1.1 animate.min.css -->
    <link href="https://cdn.bootcdn.net/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <!-- 1.1.2 wow.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <!-- 2.6.9 vue.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.6.9/vue.min.js"></script>

</head>
<body>

<form id="register-form" class="form-horizontal" action="#" method="post" onsubmit="">
    <div class="form-group input-group">
        <span class="form-control-feedback">
            <i class="bi bi-telephone" style="font-size: 3rem; "></i>
        </span>
        <input type="text" class="form-control form-control-pl-30 input-lg" id="login-account"
               placeholder="电话" autocomplete="off">
    </div>
    <div class="form-group input-group">
        <span class="form-control-feedback">
            <i class="bi bi-lock" style="font-size: 3rem; "></i>
        </span>
        <input type="password" class="form-control input-lg" id="login-pwd" placeholder="密码"
               autocomplete="off">
    </div>

    <div class="form-group">
        <div>
            <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
        </div>
    </div>
</form>

</body>
</html>
