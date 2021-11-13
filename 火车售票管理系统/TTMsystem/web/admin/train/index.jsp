<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/12
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>train</title>

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

<div id="trainVue">

    <jsp:include page="train_title.jsp"></jsp:include>

    <div style="margin: 0 40px 0 40px;">

        <jsp:include page="train_table.jsp"></jsp:include>

        <jsp:include page="train_page.jsp"></jsp:include>

        <Divider plain orientation="left">火车详细信息</Divider>

        <jsp:include page="train_info/"></jsp:include>

    </div>

</div>

<script>
    let trainVue = new Vue({
        el: "#trainVue",
        data: {
            // 表格数据显示行数
            pageSize: 5,
            // trainTable中点击的当前数据
            currentData: {
                train_id: 1,
                train_number: 'G000',
                train_type: '高铁',
                train_state: '正常',
                round_trip: [
                    {
                        departure_station: 'null',
                        departure_time: 'null',
                        destination_station: 'null',
                        destination_time: 'null',
                    }, {
                        departure_station: 'null',
                        departure_time: 'null',
                        destination_station: 'null',
                        destination_time: 'null',
                    },
                ],
                running: [],
            },
            trainData: {
                tableHeight: 0,
                sourceData: [
                    {
                        train_id: 1,
                        train_number: 'G1818',
                        train_type: '高铁',
                        train_state: '正常',
                        round_trip: [
                            {
                                departure_station: '潮汕站',
                                departure_time: '07:30',
                                destination_station: '杭州东站',
                                destination_time: '15:00',
                            }, {
                                departure_station: '杭州东站',
                                departure_time: '7:30',
                                destination_station: '潮汕站',
                                destination_time: '15:00',
                            },
                        ],
                        running: [
                            {
                                running_id: 1,
                                departure_station: '潮汕站',
                                destination_station: '杭州东站',
                                departure_time: '2021-11-11 07:30',
                                running_state: '已完成',
                            },
                            {
                                running_id: 2,
                                departure_station: '杭州东站',
                                destination_station: '潮汕站',
                                departure_time: '2021-11-12 07:30',
                                running_state: '已完成',
                            },
                            {
                                running_id: 3,
                                departure_station: '潮汕站',
                                destination_station: '杭州东站',
                                departure_time: '2021-11-13 07:30',
                                running_state: '已完成',
                            },
                            {
                                running_id: 4,
                                departure_station: '杭州东站',
                                destination_station: '潮汕站',
                                departure_time: '2021-11-14 07:30',
                                running_state: '未开始',
                            },
                            {
                                running_id: 5,
                                departure_station: '潮汕站',
                                destination_station: '杭州东站',
                                departure_time: '2021-11-15 07:30',
                                running_state: '未开始',
                            },
                        ],
                    },
                    {
                        train_id: 1,
                        train_number: 'G1818',
                        train_type: '高铁',
                        train_state: '正常',
                        round_trip: [
                            {
                                departure_station: '潮汕站',
                                departure_time: '07:30',
                                destination_station: '杭州东站',
                                destination_time: '15:00',
                            }, {
                                departure_station: '杭州东站',
                                departure_time: '7:30',
                                destination_station: '潮汕站',
                                destination_time: '15:00',
                            },
                        ],
                        running: [],
                    },
                    {
                        train_id: 1,
                        train_number: 'G1818',
                        train_type: '高铁',
                        train_state: '正常',
                        round_trip: [
                            {
                                departure_station: '潮汕站',
                                departure_time: '07:30',
                                destination_station: '杭州东站',
                                destination_time: '15:00',
                            }, {
                                departure_station: '杭州东站',
                                departure_time: '7:30',
                                destination_station: '潮汕站',
                                destination_time: '15:00',
                            },
                        ],
                        running: [],
                    },
                ],
                tmpData: [],
                tableData: [],
            },
            runningData: {
                tableHeight: 0,
                tmpData: [],
                tableData: [],
            },
            trainTableColumns: [
                {
                    title: '火车编号',
                    key: 'train_id',
                    align: 'center',
                }, {
                    title: '车次名称',
                    key: 'train_number',
                    align: 'center',
                }, {
                    title: '火车类型',
                    key: 'train_type',
                    align: 'center',
                }, {
                    title: '始发站',
                    slot: 'departure',
                    align: 'center',
                }, {
                    title: '目的站',
                    slot: 'destination',
                    align: 'center',
                }, {
                    title: '火车状态',
                    key: 'train_state',
                    align: 'center',
                }, {
                    title: '更多信息',
                    slot: 'about',
                    align: 'center',
                }
            ],
            runningTableColumns: [
                {
                    title: '运行编号',
                    key: 'running_id',
                    align: 'center'
                }, {
                    title: '始发站',
                    key: 'departure_station',
                    align: 'center',
                }, {
                    title: '发车日期-时间',
                    key: 'departure_time',
                    align: 'center',
                }, {
                    title: '目的站',
                    key: 'destination_station',
                    align: 'center',
                }, {
                    title: '运行状态',
                    key: 'running_state',
                    align: 'center',
                }
            ],
        },
        methods: {
            // trainTable 页面切换
            changePage(index) {
                let _start = (index - 1) * this.pageSize;
                let _end = index * this.pageSize;
                this.trainData.tableData = this.trainData.tmpData.slice(_start, _end);
                this.trainData.tableHeight = Math.max(this.trainData.tableData.length * 48 + 42, 90);
            },
            // runningTable 页面切换
            changePage1(index) {
                let _start = (index - 1) * this.pageSize;
                let _end = index * this.pageSize;
                this.runningData.tableData = this.runningData.tmpData.slice(_start, _end);
                this.runningData.tableHeight = Math.max(this.runningData.tableData.length * 48 + 42, 90);
            },
            showInfo(index) {
                // 下方展示该火车的详细信息
                this.currentData = this.trainData.tableData[index];
                this.runningData.tmpData = this.currentData.running;
                this.changePage1(1);
            },
        },
        created() {
            // 创建时初始化第一页
            this.trainData.tmpData = this.trainData.sourceData;
            this.changePage(1);
            this.runningData.tmpData = this.currentData.running;
            this.changePage1(1);
        }
        ,
    })
</script>

</body>
</html>
