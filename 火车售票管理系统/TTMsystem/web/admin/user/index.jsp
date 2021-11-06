<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/5
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user admin</title>

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

<div id="userTableVue">
    <%--  stripe 斑马纹  --%>
    <%--  highlight-row，可以选中某一行 --%>
    <%--  type: 'selection'，即可自动开启多选功能 --%>
    <%--  sortable: true，即可对该列数据进行排序 --%>
    <%--  设置 filters，可进行筛选，filters 接收一个数组 --%>

    <Card>
        <i-table stripe :loading="loading" :columns="userTableColumns" :data="data1"
                 @on-row-click="tableClick"
                 @on-select-all="selectAll" :height="tableHeight" ref="table">

            <template slot-scope="{ row }" slot="name">
                <div>
                    <Icon type="md-person"></Icon>
                    <strong>{{ row.name }}</strong>
                </div>
            </template>

            <template slot-scope="{ row }" slot="state">
                <div>
                    <Badge :status="getState(row.state)" :text="row.state"/>

                    <%--  <strong>{{ row.state }}</strong>--%>
                </div>
            </template>

            <template slot-scope="{ row, index }" slot="action">
                <i-button type="primary" size="small" style="margin-right: 5px" @click="value1 = true">View
                </i-button>
                <i-button type="error" size="small" @click="remove(index)">Delete</i-button>
                <Drawer title="Basic Drawer" :closable="false" v-model="value1">
                    <p>Some contents...</p>
                </Drawer>
            </template>

        </i-table>

        <Page simple :total="dataCount" :page-size="pageSize" show-total
              @on-change="changepage"
              style="float: right; margin-top: 10px">
        </Page>


        Change Loading Status
        <i-switch v-model="loading" style="margin-top: 10px"></i-switch>
    </Card>

</div>

<script>
    let testData = [
        {
            keyid: 1,
            tel: '19106850000',
            name: '王小明',
            age: 18,
            type: '普通用户',
            state: '正常',
            create_time: '2021-11-7',
        },
        {
            keyid: 2,
            tel: '19106850001',
            name: '张三',
            age: 19,
            type: 'VIP用户',
            state: '正常',
            create_time: '2021-11-7',
        },
        {
            keyid: 3,
            tel: '19106850002',
            name: '赵四',
            age: 20,
            type: '管理员',
            state: '关闭',
            create_time: '2021-11-7',
        },
        {
            keyid: 4,
            tel: '19106850004',
            name: '王五',
            age: 21,
            type: '普通用户',
            state: '冻结',
            create_time: '2021-11-7',
        },
    ];

    var vm = new Vue({
            el: "#userTableVue",
            data: function () {
                return {
                    tableHeight: null,
                    ajaxHistoryData: [],
                    dataCount: 3, pageSize: 10,
                    value1: false, loading: false,
                    userTableColumns: [
                        {
                            type: 'selection',
                            width: 60,
                            align: 'center'
                        }, {
                            title: '手机号',
                            key: 'tel',
                        }, {
                            title: '姓名',
                            slot: 'name',
                            sortable: true
                        }, {
                            title: '年龄',
                            key: 'age',
                            sortable: true
                        }, {
                            title: '用户类型',
                            key: 'type',
                            sortable: true
                        }, {
                            title: '用户状态',
                            slot: 'state',
                            sortable: true
                        }, {
                            title: '创建时间',
                            key: 'create_time',
                            sortable: true
                        }, {
                            title: 'Action',
                            slot: 'action',
                            width: 150,
                            align: 'center'
                        },
                    ],
                    data1: []
                }
            },
            computed: {},
            methods: {
                getState(state) {
                    if (state === '正常') return 'success';
                    else if (state === '冻结') return 'warning';
                    return 'error';
                },
                getAge(birth) {
                    let birthdays = new Date(birth.replace(/-/g, "/"));
                    let d = new Date();
                    let age = d.getFullYear() - birthdays.getFullYear() -
                        (d.getMonth() < birthdays.getMonth() ||
                        (d.getMonth() == birthdays.getMonth() &&
                            d.getDate() < birthdays.getDate()) ? 1 : 0);
                    return age;
                },
                handleListApproveHistory() {
                    // 保存取到的所有数据
                    this.ajaxHistoryData = testData
                    this.dataCount = testData.length;
                    // 初始化显示，小于每页显示条数，全显，大于每页显示条数，取前每页条数显示
                    if (testData.length < this.pageSize) {
                        this.data1 = this.ajaxHistoryData;
                    } else {
                        this.data1 = this.ajaxHistoryData.slice(0, this.pageSize);
                    }
                },
                selectAll: function (link) {
                    console.log(link);
                }, tableClick: function (data, index) {
                    this.value1 = true;
                }, remove(index) {
                    this.data1.splice(index, 1);
                }, changepage(index) {
                    var _start = (index - 1) * this.pageSize;
                    var _end = index * this.pageSize;
                    this.data1 = this.ajaxHistoryData.slice(_start, _end);
                },
            },
            created() {
                this.handleListApproveHistory();
                this.tableHeight = (this.pageSize + 1) * 48 - 6;
            },
        })
    ;
</script>


</body>
</html>
