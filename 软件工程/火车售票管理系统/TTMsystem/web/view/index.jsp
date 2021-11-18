<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/17
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>index</title>

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

    <!-- 0.21.1 axios.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.1/axios.min.js"></script>

    <!-- iview.css -->
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
    <!-- iview.min.js -->
    <script type="text/javascript" src="http://unpkg.com/iview/dist/iview.min.js"></script>

</head>
<body>

<div id="indexVue">
    <jsp:include page="common/head.jsp"></jsp:include>

    <jsp:include page="index/index.jsp"></jsp:include>

    <jsp:include page="common/foot.jsp"></jsp:include>
</div>

<script>
    var indexVue = new Vue({
        el: '#indexVue',
        data: {
            departure_date: '',
            departure_city: '',
            destination_city: '',
            cityList: [
                {
                    value: '杭州',
                    label: '杭州',
                },
                {
                    value: '潮州',
                    label: '潮州',
                },
            ],
            dateList: [],
        },
        methods: {
            exchange: function () {
                this.$Message.error('出了点错误，你自己交换一下吧');
            }
        },
        created: function () {
            let toDay = new Date();
            for (let i = 1; i <= 15; ++i) {
                let month = toDay.getMonth() + 1;
                let day = toDay.getDate();
                let _day = month + "-" + day;
                let date = {
                    value: _day,
                    label: _day,
                };
                this.dateList.push(date);
                toDay.setDate(toDay.getDate() + 1);
            }
        }
    });
</script>

</body>
</html>