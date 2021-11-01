<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/1
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>

<div class="container" style="padding-top: 2em">
    <form class="form-horizontal" action="getScore.jsp" method="post" onsubmit="return formSubmit();">
        <div class="form-group">
            <label for="inputID" class="col-sm-2 control-label">学号: </label>
            <div class="col-sm-4">
                <input class="form-control form-input" name="account" id="inputID" placeholder="学生学号"
                       autofocus="autofocus">
            </div>
        </div>

        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">姓名: </label>
            <div class="col-sm-4">
                <input class="form-control form-input" name="name" id="inputName" placeholder="学生姓名">
            </div>
        </div>

        <div class="form-group">
            <label for="inputCourse" class="col-sm-2 control-label">课程: </label>
            <div class="col-sm-4">
                <input class="form-control form-input" name="course" id="inputCourse" placeholder="课程名称">
            </div>
        </div>

        <div class="form-group">
            <label for="inputScore" class="col-sm-2 control-label">分数: </label>
            <div class="col-sm-4">
                <input class="form-control form-input" name="fraction" id="inputScore" placeholder="课程分数">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">提交</button>
            </div>
        </div>
    </form>
</div>

<script>
    function formSubmit() {
        var flag = true;
        $(".form-input").each(function (i) {
            if (this.value == "") {
                $(this).parent("div").addClass("has-error");
                flag = false;
            } else {
                $(this).parent("div").removeClass("has-error");
            }
        })
        return flag;
    }
</script>

</body>
</html>
