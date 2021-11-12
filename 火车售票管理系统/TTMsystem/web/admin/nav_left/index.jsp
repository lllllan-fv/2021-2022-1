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

    <!-- 3.4.1 Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
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

    <!-- iview.css -->
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
    <!-- iview.min.js -->
    <script type="text/javascript" src="http://unpkg.com/iview/dist/iview.min.js"></script>

</head>
<body>

<div class="LogoName">后台管理</div>
<div class="navDiv">
    <div class="navName">导航</div>
    <div class="nav-list">
        <ul>
            <li class="nav-tab a_active waves-effect">
                <a href="user/" class="li-a active" target="iframe">
                    <i class='bi bi-house'></i>
                    主页
                    <span class="badge badge-pill badge-primary" style="float: right;">
                            3
                        </span>
                </a>
            </li>
            <li class="nav-tab a_active waves-effect">
                <a href="user/" class="li-a active" target="iframe">
                    <i class='bi bi-people'></i> 用户管理
                </a>
            </li>
            <li class="nav-tab nav-ul">
                <a href="javascript:void[0]" class="li-a">
                    <%--                    <i class='bi bi-nut'></i>--%>
                    <i class="ivu-icon ivu-icon-ios-train-outline"></i>
                    火车管理
                    <i class='bi bi-chevron-right' style="float: right;"></i>
                </a>
                <div class="nav-box">
                    <a href="html/device/3.html" class="li-a-a" target="iframe">
                        车站信息
                    </a>
                    <a href="html/device/4.html" class="li-a-a" target="iframe">
                        火车信息
                    </a>
                    <a href="html/device/4.html" class="li-a-a" target="iframe">
                        添加火车
                    </a>
                    <a href="html/device/4.html" class="li-a-a" target="iframe">
                        运行信息
                    </a>
                    <a href="html/device/4.html" class="li-a-a" target="iframe">
                        历史运行
                    </a>
                </div>
            </li>
            <li class="nav-tab nav-ul">
                <a href="javascript:void[0]" class="li-a">
                    <i class='bi bi-building'></i>
                    订单管理
                    <i class='bi bi-chevron-right' style="float: right;"></i>
                </a>
                <div class="nav-box">
                    <a href="html/device/5.html" class="li-a-a" target="iframe">
                        订单信息
                    </a>
                    <a href="html/device/5.html" class="li-a-a" target="iframe">
                        退票审核
                    </a>
                </div>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        // 一二级菜单的序号
        let nav_ul_index = sessionStorage.getItem("nav_ul_index");
        let nav_li_index = sessionStorage.getItem("nav_li_index");

        console.log(window);

        // 如果刷新前有过点击，恢复先前页面
        if (nav_ul_index != null) {
            loadLi(nav_ul_index);
            if (nav_li_index != null) {
                loadA(nav_ul_index, nav_li_index);
            }
        }

        // let navflag = false;
        $('.nav-tab').click(function () {
            console.log($(this).index());
            loadLi($(this).index());
            // 将点击的一级菜单序号记入session
            sessionStorage.setItem("nav_ul_index", $(this).index());
        })

        /* 二级菜单a点击事件 */
        $(".li-a-a").click(function () {
            var index1 = $(this).parent().parent().index();
            var index2 = $(this).index();
            loadA(index1, index2);
            // 将点击的二级菜单序号记入session
            sessionStorage.setItem("nav_li_index", index2);
        })

        // 根据点击事件，为所有一级标题更新状态
        function loadLi(index) {
            $.each($(".nav-tab"), function (i, item) {
                if (i == index) {
                    //当前选中
                    $(item).addClass('a_active')
                    $(item).find('.li-a').addClass('active')
                    // 打开右侧箭头
                    $(item).find('.bi-chevron-right').css('transform', 'rotateZ(90deg)')
                    $(item).find('.bi-chevron-right').css('transition', 'all .5s')
                    $(item).addClass('nav-show')
                    $(item).find('div').addClass('nav-box')
                } else {
                    $(item).removeClass('a_active');
                    $(item).find('.nav-box').css('height', '0')
                    //关闭右侧箭头
                    if ($(item).attr('class').indexOf('nav-ul') != -1) {
                        $(item).find('.bi-chevron-right').css('transform', 'rotateZ(0deg)')
                        $(item).find('.bi-chevron-right').css('transition', 'all .5s')
                        $(item).removeClass('nav-show')
                    }
                }
            })
        }

        // 更新 iframe 内容
        function loadA(index1, index2) {
            $('.li-a-a').removeClass('active-li-a');
            $('.nav-tab').eq(index1).find('div a').eq(index2).addClass('active-li-a');

            var target = $('.nav-tab').eq(index1).find('div a').eq(index2).attr('href');
            $('iframe').attr('src', target);
        }

    })
</script>

</body>
</html>
