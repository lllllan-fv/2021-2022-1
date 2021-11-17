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

    <style>
        .ivu-drawer-mask {
            background-color: rgba(55, 55, 55, 0.1);
        }
    </style>
</head>
<body>

<div id="userVue">

    <%--  页面标题  --%>
    <jsp:include page="user_title.jsp"></jsp:include>

    <%--  显示数据的表格  --%>
    <jsp:include page="user_table.jsp"></jsp:include>

    <jsp:include page="user_info_drawer.jsp"></jsp:include>

    <jsp:include page="user_add_drawer.jsp"></jsp:include>

</div>

<%-- vue --%>
<script>
    var userVue = new Vue({
        el: "#userVue",
        data: {
            // 源数据
            sourceData: [
                {
                    id: 1,
                    tel: '19106850000',
                    name: '王小明',
                    age: 18,
                    type: '普通用户',
                    state: '正常',
                    create_time: '2021-11-7',
                },
                {
                    id: 1,
                    tel: '19106850000',
                    name: '王小明',
                    age: 18,
                    type: '普通用户',
                    state: '正常',
                    create_time: '2021-11-7',
                },
                {
                    id: 2,
                    tel: '19106850001',
                    name: '张三',
                    age: 19,
                    type: 'VIP用户',
                    state: '正常',
                    create_time: '2021-11-7',
                },
                {
                    id: 3,
                    tel: '19106850002',
                    name: '赵四',
                    age: 20,
                    type: '管理员',
                    state: '冻结',
                    create_time: '2021-11-7',
                },
                {
                    id: 4,
                    tel: '19106850004',
                    name: '王五',
                    age: 21,
                    type: '普通用户',
                    state: '注销',
                    create_time: '2021-11-7',
                },
            ],
            // 中间数据
            tmpData: [],
            // 表格显示数据
            tableData: [],
            // 当前行数据
            currentRowData: {},
            // 关联搜索框[用户名、手机号]
            tableSearchInfo: {
                userName: '',
                userTel: '',
            },
            buttonSize: 'large',
            formInline: {
                user: '',
                password: ''
            },
            tableHeight: null,
            pageSize: 10,
            userInfoDrawer: {
                maskCloseable: true,
                drawerVisible: false,
                drawerEditable: false,
                stateSelect: '',
                typeSelect: '',
            },
            addUserDrawer: {
                maskCloseable: false,
                drawerVisible: false,
                typeSelect: '普通用户',
                stateSelect: '正常',
            },
            loading: false,
            userTableColumns: [
                {
                    type: 'selection',
                    width: 60,
                    align: 'center'
                }, {
                    title: '姓名',
                    key: 'name',
                    sortable: true,
                    align: 'center'
                }, {
                    title: '手机号',
                    key: 'tel',
                    align: 'center'
                }, {
                    title: '用户类型',
                    slot: 'type',
                    align: 'center',
                    filters: [
                        {
                            label: '普通用户',
                            value: '普通用户'
                        }, {
                            label: 'VIP用户',
                            value: 'VIP用户'
                        }, {
                            label: '管理员',
                            value: '管理员'
                        }
                    ],
                    filterMethod(value, row) {
                        return row.type.indexOf(value) > -1;
                    }
                }, {
                    title: '用户状态',
                    slot: 'state',
                    align: 'center',
                    filters: [
                        {
                            label: '正常',
                            value: '正常'
                        }, {
                            label: '冻结',
                            value: '冻结'
                        }, {
                            label: '注销',
                            value: '注销'
                        }
                    ],
                    filterMethod(value, row) {
                        return row.state.indexOf(value) > -1;
                    }
                }, {
                    title: '创建时间',
                    key: 'create_time',
                    sortable: true,
                    align: 'center'
                }, {
                    title: '订单信息',
                    slot: 'order',
                    width: 150,
                    align: 'center'
                }, {
                    title: '操作',
                    slot: 'action',
                    width: 150,
                    align: 'center'
                },
            ],
        },
        computed: {},
        methods: {
            // 根据显示数据行数修改表格高度
            setTableHeight() {
                if (this.tableData.length == 0) {
                    this.tableHeight = 90;
                } else {
                    this.tableHeight = this.tableData.length * 48 + 42;
                }
            },
            // 根据数据显示表格
            tableInit() {
                this.loading = true;
                // 初始化显示，小于每页显示条数，全显，大于每页显示条数，取前每页条数显示
                if (this.tmpData.length < this.pageSize) {
                    this.tableData = this.tmpData;
                } else {
                    this.tableData = this.tmpData.slice(0, this.pageSize);
                }
                this.setTableHeight();
                this.loading = false;
            },
            // 表格内容搜索
            tableSearch() {
                let name = this.tableSearchInfo.userName;
                let tel = this.tableSearchInfo.userTel;
                let arr = [];

                this.loading = true;
                this.tmpData = [];
                this.sourceData.forEach(function (item, index, array) {
                    let nameFlag = (name == "" || item.name.indexOf(name) != -1);
                    let telFlag = (tel == "" || item.tel.indexOf(tel) != -1);
                    if (nameFlag && telFlag) {
                        arr.push(item);
                    }
                });
                this.tmpData = arr;
                this.tableInit();
                this.loading = false;
            },
            // 搜索重置
            tableSearchUnset() {
                this.tableSearchInfo.userName = this.tableSearchInfo.userTel = '';
                this.tmpData = this.sourceData;
                this.tableInit();
            },
            // 根据用户状态返回 Badge 类型
            getUserState(state) {
                if (state === '正常') return 'success';
                else if (state === '冻结') return 'warning';
                return 'error';
            },
            // 表格刷新
            tableRefresh() {
            },
            // 表格全选
            selectAll: function (link) {
                console.log(link);
            },
            // 表格删除其中一行
            removeRow(index) {
                let removeItem = this.tableData[index];

                // 从中间数据中删除该数据
                let removeIndex = -1;
                this.tmpData.forEach(function (item, idx, array) {
                    if (item == removeItem) {
                        removeIndex = idx;
                    }
                });
                if (removeIndex != -1) this.tmpData.splice(removeIndex, 1);

                // 从源数据中删除该行
                removeIndex = -1;
                this.sourceData.forEach(function (item, idx, array) {
                    if (item == removeItem) {
                        removeIndex = idx;
                    }
                });
                if (removeIndex != -1) this.sourceData.splice(removeIndex, 1);

                this.tableInit();
            },
            // 链接跳转查看用户订单信息
            linkToOrder(index) {
                sessionStorage.setItem("nav_ul_index", 3);
                sessionStorage.setItem("nav_li_index", 0);

                // 从iframe刷新整体页面
                window.parent.location.href = "http://ticket.lllllan.cn/admin/";
            },
            // 页面变换
            changePage: function (index) {
                let _start = (index - 1) * this.pageSize;
                let _end = index * this.pageSize;
                this.tableData = this.tmpData.slice(_start, _end);
                this.setTableHeight();
            },
            // 表格当前行点击
            tableRowShow: function (data, index) {
                console.log("row");
                this.currentRowData = this.tableData[index];
                this.userInfoDrawer.drawerVisible = true;
                // 加载抽屉中的用户信息
                loadInfo(this.currentRowData);
                this.userInfoDrawer.stateSelect = this.currentRowData.state;
                this.userInfoDrawer.typeSelect = this.currentRowData.type;
            },
            // 编辑按钮点击事件
            tableRowEdit() {
                console.log("btn");
                this.userInfoDrawer.maskCloseable = false;
                this.userInfoDrawer.drawerVisible = true;
                this.userInfoDrawer.drawerEditable = true;
            },
            // 抽屉中关闭按钮点击事件
            drawerClose() {
                this.userInfoDrawer.maskCloseable = true;
                this.userInfoDrawer.drawerVisible = false;
                this.userInfoDrawer.drawerEditable = false;
                this.addUserDrawer.drawerVisible = false;
            },
            // 编辑用户信息的提交按钮点击
            editUserInfoSubmit() {
                this.drawerClose();
            },
            // 添加用户点击事件
            addUser() {
                this.addUserDrawer.drawerVisible = true;
                this.addUserDrawer.stateSelect = '正常';
                this.addUserDrawer.typeSelect = '普通用户';
                loadInfo(null);
            },
            // 添加用户提交按钮点击
            addUserSubmit() {
                this.drawerClose();
            },

        },
        created() {
            // 初始化表格
            this.tmpData = this.sourceData;
            this.tableInit();
        },
    });
</script>

<script>
    // 根据当前点击的行，加载抽屉中的用户信息
    function loadInfo(user) {
        $("input[name='user_name']").val(user == null ? "" : user.name);
        $("input[name='user_tel']").val(user == null ? "" : user.tel);
        $("input[name='user_type']").val(user == null ? "" : user.type);
        $("input[name='user_email']").val(user == null ? "" : "12580@qq.com");
        $("textarea").val(user == null ? "" : "这个人很懒，什么都没留下。");
    }
</script>

</body>
</html>
