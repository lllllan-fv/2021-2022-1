<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/8
  Time: 23:50
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

    <script type="text/javascript" src="js/form.js"></script>

</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<br>
<div class="container">

    <form class="form-horizontal" action='dbServlet' method='post' onsubmit="return formSubmit();">
        <div class="form-group">
            <center>
                <div class="col-sm-6">
                    <h3>信息统计表</h3>
                </div>
            </center>
        </div>

        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">姓名：</label>
            <div class="col-sm-4">
                <input class="form-control" id="inputName" placeholder="您的姓名" name="name">
            </div>
            <label id="errName" class="col-sm-4 control-label" style="color: red;"></label>
        </div>
        <div class="form-group">
            <label for="inputAge" class="col-sm-2 control-label">年龄：</label>
            <div class="col-sm-4">
                <input onkeyup="this.value=this.value.replace(/^0(0+|\d+)|[^\d]+/g,'')" class=" form-control"
                       id="inputAge" placeholder="您的年龄" name="age">
            </div>
            <label id="errAge" class="col-sm-4 control-label" style="color: red;"></label>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">性别：</label>
            <div class="radio col-sm-4">
                <label>
                    <input type="radio" name="sex" id="optionsRadios1" value="男" checked>
                    男
                </label>
                <label>
                    <input type="radio" name="sex" id="optionsRadios2" value="女">
                    女
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">爱好：</label>
            <div class="col-sm-4">
                <div class="checkbox">
                    <label>
                        <input id="checkbox1" type="checkbox" value="旅游" name="hobbies">旅游
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox2" type="checkbox" value="登山" checked name="hobbies">登山
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox3" type="checkbox" value="健身" checked name="hobbies">健身
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox4" type="checkbox" value="上网" name="hobbies">上网
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox5" type="checkbox" value="游泳" name="hobbies">游泳
                    </label>
                </div>
                <div>
                    <label id="errCheckbox" style="color: red;"></label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">学历：</label>
            <div class=" col-sm-4">
                <select class="form-control" name="education">
                    <option>硕士</option>
                    <option>本科</option>
                    <option>高中</option>
                    <option>初中</option>
                    <option>小学</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">自我介绍：</label>
            <div class="col-sm-4"><textarea class="form-control" rows="3" name="introduction"></textarea></div>
        </div>

        <div class="form-group col-sm-6">
            <center>
                <button type="submit" name="submit" class="btn btn-default">提交</button>&emsp;
                <button type="button" class="btn btn-default">重置</button>
            </center>
        </div>
    </form>

</div>

<script>

    function formSubmit() {

        if ($("#inputName").val() == "" || $("#inputName").val().length <= 2) {
            console.log("name");
            $("#errName").html("姓名不能为空，长度大于2！");
            return false;
        } else {
            $("#errName").html("");
        }

        if ($("#inputAge").val().length != 2) {
            $("#errAge").html("年龄必须为两位的数字!");
            return false;
        } else if (parseInt($("#inputAge").val()) < 18 || parseInt($("#inputAge").val()) > 30) {
            $("#errAge").html("年龄应该在18~30之间!");
            return false;
        } else {
            $("#errAge").html("");
        }

        if ($("#checkbox1").is(':checked') ||
            $("#checkbox2").is(':checked') ||
            $("#checkbox3").is(':checked') ||
            $("#checkbox4").is(':checked') ||
            $("#checkbox5").is(':checked')) {
            $("#errCheckbox").html("");
        } else {
            $("#errCheckbox").html("至少要选择一项爱好!");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
