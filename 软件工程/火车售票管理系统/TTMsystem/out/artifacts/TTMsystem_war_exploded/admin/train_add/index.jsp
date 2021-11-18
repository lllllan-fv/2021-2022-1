<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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

<div id="trainAddVue">

    <Card style="margin: 40px; padding: 20px; border-radius: 10px">

        <Row>
            <i-col span="12" offset="6">

                <jsp:include page="form.jsp"></jsp:include>

            </i-col>
        </Row>

    </Card>

</div>

<script>
    let trainAddVue = new Vue({
        el: '#trainAddVue',
        data: {
            // 火车类型选择框列表
            train_type_list: [
                {
                    value: '临时列车',
                    label: '临时列车',
                },
                {
                    value: '快速列车',
                    label: '快速列车',
                },
                {
                    value: '特快列车',
                    label: '特快列车',
                },
                {
                    value: '直达特快列车',
                    label: '直达特快列车',
                },
                {
                    value: '城际快速列车',
                    label: '城际快速列车',
                },
            ],
            // 火车站级联选择框列表
            station_list: [
                {
                    value: '广东',
                    label: '广东',
                    children: [
                        {
                            value: '潮州',
                            label: '潮州',
                            children: [
                                {
                                    value: '潮汕站',
                                    label: '潮汕站',
                                },
                            ],
                        },
                        {
                            value: '广州',
                            label: '广州',
                            children: [
                                {
                                    value: '广州站',
                                    label: '广州站',
                                },
                                {
                                    value: '广州东站',
                                    label: '广州东站',
                                },
                            ],
                        },
                    ],
                },
                {
                    value: '浙江',
                    label: '浙江',
                    children: [
                        {
                            value: '杭州',
                            label: '杭州',
                            children: [
                                {
                                    value: '杭州东站',
                                    label: '杭州东站',
                                }
                            ],
                        },
                    ],
                },
            ],
            // 时间联选择框列表
            time_list: [
                {
                    value: '当日',
                    label: '当日',
                    children: [
                        {
                            value: '00:00',
                            label: '00:00',
                        },
                        {
                            value: '01:00',
                            label: '01:00',
                        },
                        {
                            value: '02:00',
                            label: '02:00',
                        },
                        {
                            value: '03:00',
                            label: '03:00',
                        },
                        {
                            value: '04:00',
                            label: '04:00',
                        },
                        {
                            value: '05:00',
                            label: '05:00',
                        },
                        {
                            value: '06:00',
                            label: '06:00',
                        },
                        {
                            value: '07:00',
                            label: '07:00',
                        },
                        {
                            value: '08:00',
                            label: '08:00',
                        },
                        {
                            value: '09:00',
                            label: '09:00',
                        },
                        {
                            value: '10:00',
                            label: '10:00',
                        },
                        {
                            value: '11:00',
                            label: '11:00',
                        },
                        {
                            value: '12:00',
                            label: '12:00',
                        },
                        {
                            value: '13:00',
                            label: '13:00',
                        },
                        {
                            value: '14:00',
                            label: '14:00',
                        },
                        {
                            value: '15:00',
                            label: '15:00',
                        },
                        {
                            value: '16:00',
                            label: '16:00',
                        },
                        {
                            value: '17:00',
                            label: '17:00',
                        },
                        {
                            value: '18:00',
                            label: '18:00',
                        },
                        {
                            value: '19:00',
                            label: '19:00',
                        },
                        {
                            value: '20:00',
                            label: '20:00',
                        },
                        {
                            value: '21:00',
                            label: '21:00',
                        },
                        {
                            value: '22:00',
                            label: '22:00',
                        },
                        {
                            value: '23:00',
                            label: '23:00',
                        },
                    ],
                },
                {
                    value: '次日',
                    label: '次日',
                    children: [
                        {
                            value: '00:00',
                            label: '00:00',
                        },
                        {
                            value: '01:00',
                            label: '01:00',
                        },
                        {
                            value: '02:00',
                            label: '02:00',
                        },
                        {
                            value: '03:00',
                            label: '03:00',
                        },
                        {
                            value: '04:00',
                            label: '04:00',
                        },
                        {
                            value: '05:00',
                            label: '05:00',
                        },
                        {
                            value: '06:00',
                            label: '06:00',
                        },
                        {
                            value: '07:00',
                            label: '07:00',
                        },
                        {
                            value: '08:00',
                            label: '08:00',
                        },
                        {
                            value: '09:00',
                            label: '09:00',
                        },
                        {
                            value: '10:00',
                            label: '10:00',
                        },
                        {
                            value: '11:00',
                            label: '11:00',
                        },
                        {
                            value: '12:00',
                            label: '12:00',
                        },
                        {
                            value: '13:00',
                            label: '13:00',
                        },
                        {
                            value: '14:00',
                            label: '14:00',
                        },
                        {
                            value: '15:00',
                            label: '15:00',
                        },
                        {
                            value: '16:00',
                            label: '16:00',
                        },
                        {
                            value: '17:00',
                            label: '17:00',
                        },
                        {
                            value: '18:00',
                            label: '18:00',
                        },
                        {
                            value: '19:00',
                            label: '19:00',
                        },
                        {
                            value: '20:00',
                            label: '20:00',
                        },
                        {
                            value: '21:00',
                            label: '21:00',
                        },
                        {
                            value: '22:00',
                            label: '22:00',
                        },
                        {
                            value: '23:00',
                            label: '23:00',
                        },
                    ],
                },
                {
                    value: '次次日',
                    label: '次次日',
                    children: [
                        {
                            value: '00:00',
                            label: '00:00',
                        },
                        {
                            value: '01:00',
                            label: '01:00',
                        },
                        {
                            value: '02:00',
                            label: '02:00',
                        },
                        {
                            value: '03:00',
                            label: '03:00',
                        },
                        {
                            value: '04:00',
                            label: '04:00',
                        },
                        {
                            value: '05:00',
                            label: '05:00',
                        },
                        {
                            value: '06:00',
                            label: '06:00',
                        },
                        {
                            value: '07:00',
                            label: '07:00',
                        },
                        {
                            value: '08:00',
                            label: '08:00',
                        },
                        {
                            value: '09:00',
                            label: '09:00',
                        },
                        {
                            value: '10:00',
                            label: '10:00',
                        },
                        {
                            value: '11:00',
                            label: '11:00',
                        },
                        {
                            value: '12:00',
                            label: '12:00',
                        },
                        {
                            value: '13:00',
                            label: '13:00',
                        },
                        {
                            value: '14:00',
                            label: '14:00',
                        },
                        {
                            value: '15:00',
                            label: '15:00',
                        },
                        {
                            value: '16:00',
                            label: '16:00',
                        },
                        {
                            value: '17:00',
                            label: '17:00',
                        },
                        {
                            value: '18:00',
                            label: '18:00',
                        },
                        {
                            value: '19:00',
                            label: '19:00',
                        },
                        {
                            value: '20:00',
                            label: '20:00',
                        },
                        {
                            value: '21:00',
                            label: '21:00',
                        },
                        {
                            value: '22:00',
                            label: '22:00',
                        },
                        {
                            value: '23:00',
                            label: '23:00',
                        },
                    ],
                },
            ],
        },
        methods: {
            // 级联选择框返回函数
            timeOnChange(value, data) {
                console.log(value);
                console.log(data);
            }
        }
        ,
    })
</script>

</body>
</html>
