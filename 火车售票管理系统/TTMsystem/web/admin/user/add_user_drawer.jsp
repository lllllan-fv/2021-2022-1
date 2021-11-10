<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/10
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add_user_drawer</title>

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

<form id="user_info_form" action="#" method="post" onsubmit="return false;">

    <Row style="margin-top: 20px">
        <i-col span="11">
            <label>用户名: </label>
            <i-input name="user_name"/>
        </i-col>
        <i-col span="11" offset="2">
            <label>手机号: </label>
            <i-input name="user_tel"/>
        </i-col>
    </Row>

    <Row style="margin-top: 20px">
        <i-col span="11">
            <label>用户类型: </label>
            <i-input name="user_type"/>
        </i-col>
        <i-col span="11" offset="2">
            <label>用户状态: </label>
            <i-select name="user_state"
                      v-model="userInfoDrawer.stateSelect">
                <i-option value="正常">正常</i-option>
                <i-option value="冻结">冻结</i-option>
                <i-option value="注销">注销</i-option>
            </i-select>
        </i-col>
    </Row>

    <hr style="margin: 20px 0 20px 0">

    <Alert type="warning" show-icon>
        功能待完善
        <template slot="desc">
            以下信息不需要填写，反正也不会生效。
        </template>
    </Alert>

    <Row style="margin-top: 20px">
        <i-col span="11">
            <label>邮箱: </label>
            <i-input/>
        </i-col>
        <i-col span="11" offset="2">
            <label>所在地区: </label>
            <i-select>
                <i-option value="广东">广东</i-option>
            </i-select>
        </i-col>
    </Row>

    <Row style="margin-top: 20px">
        <label>个人简介: </label>
        <i-input type="textarea"/>
    </Row>

    <hr style="margin: 20px 0 20px 0">

    <button type="submit" class="btn btn-primary" @click="addUserSubmit"
            style="float: right">
        确定
    </button>

</form>

<script>


</script>

</body>
</html>
