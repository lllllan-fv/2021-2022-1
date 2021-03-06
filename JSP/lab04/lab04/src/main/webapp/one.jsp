<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>表单</title>


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
    <br>
    <div class="container">

        <form class="form-horizontal" action='process.jsp' method='GET' onsubmit="return formSubmit();">

            <div class="form-group">
                <label for="inputDigit" class="col-sm-4 control-label">请输入1-100的整数：</label>
                <div class="col-sm-4">
                    <input class="form-control" id="inputDigit" name="inputDigit" placeholder="1">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </div>

        </form>

    </div>

    <script>
        function formSubmit() {
            console.log($("#inputDigit").val());
            return $("#inputDigit").val() != "";
        }
    </script>

</body>

</html>