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
<body style="background-color: #45aaf2">

<jsp:include page="head.jsp"></jsp:include>

<div id="login-box" class="jumbotron col-sm-3 col-sm-offset-7">
    <form class="form-horizontal">
        <div class="form-group form-group-lg">
            <div class="col-sm-5 col-sm-offset-1 text-center">
                <label class="control-label">
                    <a href="#home" data-toggle="tab">哇哈哈</a>
                </label>
            </div>
            <div class="col-sm-5 text-center">
                <label class="control-label">
                    <a href="#ios" data-toggle="tab">哇哈哈</a>
                </label>
            </div>
        </div>

        <div class="tab-content col-sm-10 col-sm-offset-1" style="margin-top: 2em">
            <div class="tab-pane fade in active" id="home">
                <div class="form-group input-group">
                    <span class="form-control-feedback">
                        <i class="bi bi-person-circle" style="font-size: 3rem; color: cornflowerblue;"></i>
                    </span>
                    <input type="text" class="form-control form-control-pl-30 input-lg" id="login-account"
                           placeholder="电话" autocomplete="off">
                </div>
                <div class="form-group input-group">
                    <span class="form-control-feedback">
                        <i class="bi bi-shield-lock" style="font-size: 3rem; color: cornflowerblue;"></i>
                    </span>
                    <input type="password" class="form-control input-lg" id="login-pwd" placeholder="密码"
                           autocomplete="off">
                </div>
                <div class="form-group">
                    <div>
                        <div class="checkbox-inline navbar-left">
                            <label> <input type="checkbox"> 记住密码 </label>
                        </div>
                        <div class="navbar-right">
                            <a href="#" class="checkbox-inline">忘记密码？</a>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ios">
                <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                    TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
            </div>
        </div>
    </form>
</div>


<jsp:include page="foot.jsp"></jsp:include>


</body>
</html>
