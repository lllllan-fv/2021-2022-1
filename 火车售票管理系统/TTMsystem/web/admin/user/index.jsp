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

<div id="vue">
    <%--  stripe 斑马纹  --%>
    <%--  highlight-row，可以选中某一行 --%>
    <%--  type: 'selection'，即可自动开启多选功能 --%>
    <%--  sortable: true，即可对该列数据进行排序 --%>
    <%--  设置 filters，可进行筛选，filters 接收一个数组 --%>
    <i-table highlight-row stripe :columns="columns1" :data="data1"
             @on-current-change="todo" @on-select-all="selectAll"></i-table>
</div>

<script>
    var vm = new Vue({
            el: "#vue",
            data: function () {
                return {
                    columns1: [
                        {
                            type: 'selection',
                            width: 60,
                            align: 'center'
                        },
                        {
                            title: '姓名',
                            key: 'name'
                        },
                        {
                            title: '年龄',
                            key: 'age',
                            sortable: true
                        },
                        {
                            title: '地址',
                            key: 'address',
                            filters: [
                                {
                                    label: '北京',
                                    value: '北京'
                                },
                                {
                                    label: '上海',
                                    value: '上海'
                                },
                                {
                                    label: '深圳',
                                    value: '深圳'
                                }
                            ],
                            filterMethod: function (value, row) {
                                return row.address.indexOf(value) > -1;
                            }
                        },
                        {
                            title: '操作',
                            key: 'action',
                            width: 150,
                            align: 'center',
                            render: function (row, column, index) {
                                return `<i-button type="primary" size="small" @click="show(${index})">查看</i-button> <i-button type="error" size="small" @click="remove(${index})">删除</i-button>`;
                            }
                        }
                    ],
                    data1: [
                        {
                            name: '王小明',
                            age: 18,
                            address: '北京市朝阳区芍药居'
                        },
                        {
                            name: '张小刚',
                            age: 25,
                            address: '北京市海淀区西二旗'
                        },
                        {
                            name: '李小红',
                            age: 30,
                            address: '上海市浦东新区世纪大道'
                        },
                        {
                            name: '周小伟',
                            age: 26,
                            address: '深圳市南山区深南大道'
                        }
                    ]
                }
            },
            methods: {
                selectAll: function (link) {
                    console.log(link);
                },
                todo: function (currentRow, oldCurrentRow) {
                    console.log(oldCurrentRow);
                },
            }
        })
    ;
</script>


</body>
</html>
