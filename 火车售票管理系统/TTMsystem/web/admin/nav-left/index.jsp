<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/5
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>nav-left</title>

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

    <link rel="stylesheet" href="../common/style/page.css">

</head>
<body>

<div class="page" id="app">
    <div class="nav-left">
        <div class="LogoName"> WDTLoong Cloud</div>
        <div class="navDiv">
            <div class="navName">导航</div>
            <div class="nav-list">
                <ul>
                    <li class="nav-tab a_active waves-effect">
                        <a href="html/home.html" class="li-a active" target="iframe">
                            <i class='bi bi-house'></i>
                            主页
                            <span class="badge badge-pill badge-primary float-right">3</span>
                        </a>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a">
                            <i class='bi bi-layers'></i>
                            设备管理
                            <i class='bi bi-chevron-right' style="float: right;"></i>
                        </a>
                        <div class="nav-box">
                            <a href="html/device/device.html" class="li-a-a" target="iframe">当前能耗</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a">
                            <i class='bx bx-cog'></i>
                            维修保养
                            <i class='bi bi-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="html/device/device.html" class="li-a-a" target="iframe">养护计划</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a"><i class='bx bx-buildings'></i> 巡检管理
                            <i class='bi bi-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="html/device/device.html" class="li-a-a" target="iframe">巡检计划</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a"><i class='bx bx-edit'></i> 工单管理
                            <i class='bi bi-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="html/device/device.html" class="li-a-a" target="iframe">维修计划</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="nav-right">
        <div class="nav-top">
            上方导航
        </div>
        <div class="content-page">
            <iframe name="iframe" width="100%" height="100%" frameborder="0" src="html/home.html"></iframe>
        </div>
    </div>
</div>

<%--<script type="text/javascript" src="js/jquery.min.js"></script>--%>
<script type="text/javascript">
    $(function () {
        // let navflag = false;
        $('.nav-tab').click(function () {
            $(this).siblings().each(function () {
                $(this).removeClass('a_active');
                // $(this).removeClass('a_active');
                $(this).find('.nav-box').css('height', '0')
                //关闭右侧箭头
                if ($(this).attr('class').indexOf('nav-ul') != -1) {
                    $(this).find('.bi-chevron-right').css('transform', 'rotateZ(0deg)')
                    $(this).find('.bi-chevron-right').css('transition', 'all .5s')
                    $(this).removeClass('nav-show')
                    // $(this).find('div').removeClass('nav-box')
                }
            })
            //当前选中
            $(this).addClass('a_active')
            $(this).find('.li-a').addClass('active')
            // 打开右侧箭头
            $(this).find('.bi-chevron-right').css('transform', 'rotateZ(90deg)')
            $(this).find('.bi-chevron-right').css('transition', 'all .5s')
            $(this).addClass('nav-show')
            // $(this).find('div').addClass('nav-box')
        })
        /* 二级菜单a点击事件 */
        $(".li-a-a").click(function () {
            $(".li-a-a").each(function () {
                $(this).removeClass('active-li-a');
            })
            $(this).addClass('active-li-a');
        })
    })
</script>
</body>
</html>
