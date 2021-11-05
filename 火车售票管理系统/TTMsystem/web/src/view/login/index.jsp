<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/4
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>

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

    <!-- index.css | js -->
    <link rel="stylesheet" href="index.css">
    <script src="index.js"></script>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

</head>
<body>

<jsp:include page="../component/head.jsp"></jsp:include>

<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">

            <div class="cont_info_log_sign_up">

                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>手机登录</h2>
                        <p>阿巴阿巴</p>
                        <button class="btn_login" onClick="cambiar_login()">手机登录</button>
                    </div>
                </div>

                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>扫码登录</h2>
                        <p>阿巴阿巴</p>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">扫码登录</button>
                    </div>
                </div>

            </div>

            <div class="cont_back_info">
                <div class="cont_img_back_grey"><img src="background.jpg" alt=""/></div>
            </div>

            <div class="cont_forms">

                <div class="cont_img_back_"><img src="background.jpg" alt=""/></div>

                <div class="cont_form_login">
                    <a href="#" onClick="ocultar_login_sign_up()">
                        <i class="bi bi-chevron-left" style="font-size: 3rem"></i>
                    </a>
                    <h2>登录</h2>

                    <jsp:include page="login_form/index.jsp"></jsp:include>

                </div>

                <div class="cont_form_sign_up">
                    <a href="#" onClick="ocultar_login_sign_up()">
                        <i class="bi bi-chevron-left" style="font-size: 3rem"></i>
                    </a>

                    <img src="code.png" width="100%">

                </div>

            </div>

        </div>
    </div>
</div>

<jsp:include page="../component/foot.jsp"></jsp:include>

</body>
</html>
