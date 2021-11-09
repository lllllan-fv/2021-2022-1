<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/10
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user_info_drawer</title>

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

<Row style="margin: 20px 0 20px 0">
    <i-col span="5" offset="4">
        <Avatar shape="square" icon="ios-person" size="large"/>
    </i-col>
    <i-col span="10" offset="2">
        <h5>用户ID: {{ currentRowData.id }}</h5><br>
        <h5>创建时间: {{ currentRowData.create_time }}</h5>
    </i-col>
</Row>

<hr style="margin: 40px 0 20px 0">


<form id="user_info_form" action="#" method="post" onsubmit="return false;">

    <Row style="margin-top: 20px">
        <i-col span="12">
            <label>用户名: </label>
            <i-input name="user_name" :disabled="!userInfoDrawer.drawerEditable" v-model="currentRowData.name"
                     style="width: 90%"/>
        </i-col>
        <i-col span="12">
            <label>手机号: </label>
            <i-input name="user_tel" :disabled="!userInfoDrawer.drawerEditable" v-model="currentRowData.tel"
                     style="width: 90%"/>
        </i-col>
    </Row>

    <Row style="margin-top: 20px">
        <i-col span="12">
            <label>用户类型: </label>
            <i-input name="user_type" :disabled="!userInfoDrawer.drawerEditable" v-model="currentRowData.type"
                     style="width: 90%"/>
        </i-col>
        <i-col span="12">
            <label>用户状态: </label>
            <i-select name="user_state" :disabled="!userInfoDrawer.drawerEditable" style="width: 90%"
                      v-model="currentRowData.state">
                <i-option value="正常">正常</i-option>
                <i-option value="冻结">冻结</i-option>
                <i-option value="注销">注销</i-option>
            </i-select>
        </i-col>
    </Row>

    <button type="submit" class="btn btn-primary" @click="drawerClose">确定</button>

</form>


</body>
</html>
