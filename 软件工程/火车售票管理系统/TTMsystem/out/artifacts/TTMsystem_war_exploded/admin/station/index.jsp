<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/12
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>station</title>

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

<div id="stationVue">

    <jsp:include page="station_title.jsp"></jsp:include>

    <jsp:include page="station_count.jsp"></jsp:include>

    <Divider plain orientation="left">各省市火车站信息</Divider>

    <jsp:include page="station_card.jsp"></jsp:include>

    <jsp:include page="station_page.jsp"></jsp:include>

    <jsp:include page="station_modal.jsp"></jsp:include>

</div>

<script>
    let stationVue = new Vue({
        el: "#stationVue",
        data: {
            dataCount: 2,
            pageSize: 5,
            addProvinceModal: false,
            addCityModal: false,
            addStationModal: false,
            provinceData: {
                sourceData: [
                    {
                        p_id: 1,
                        p_name: "广东",
                        city: [
                            {
                                c_id: 1,
                                c_name: "潮州",
                                station: [
                                    {
                                        s_id: 1,
                                        s_name: '潮汕站'
                                    },
                                ]
                            }, {
                                c_id: 2,
                                c_name: "广州",
                                station: [
                                    {
                                        s_id: 2,
                                        s_name: '广州站'
                                    }, {
                                        s_id: 3,
                                        s_name: '广州东站'
                                    }, {
                                        s_id: 4,
                                        s_name: '广州南站'
                                    }, {
                                        s_id: 5,
                                        s_name: '广州北站'
                                    }, {
                                        s_id: 6,
                                        s_name: '广州西站'
                                    },
                                ]
                            }
                        ]
                    }, {
                        p_id: 2,
                        p_name: "浙江",
                        city: [
                            {
                                c_id: 2,
                                c_name: "杭州",
                                station: [
                                    {
                                        s_id: 7,
                                        s_name: '杭州东站'
                                    }, {
                                        s_id: 8,
                                        s_name: '杭州南站'
                                    },
                                ],
                            }
                        ],
                    },
                ],
                tmpData: [],
                tableData: [],
            },
            stationColumns: [
                {
                    title: '火车站编号',
                    key: 's_id',
                    align: 'center'
                }, {
                    title: '火车站名称',
                    slot: 's_name',
                    align: 'center'
                }, {
                    title: '简介',
                    slot: 's_about',
                    align: 'center',
                }, {
                    title: '操作',
                    slot: 'action',
                    align: 'center'
                }
            ],
        },
        methods: {
            // 页面切换
            changePage(index) {
                let _start = (index - 1) * this.pageSize;
                let _end = index * this.pageSize;
                this.provinceData.tableData = this.provinceData.tmpData.slice(_start, _end);
            },
            showErrorMsg() {
                this.$Notice.error({
                    title: '很抱歉地通知您',
                    render: h => {
                        return h('span', '该功能暂未开通')
                    }
                });
            },
        },
        computed: {},
        created() {
            // 创建时初始化第一页
            this.provinceData.tmpData = this.provinceData.sourceData;
            this.changePage(1);
        },
    });
</script>

</body>
</html>
