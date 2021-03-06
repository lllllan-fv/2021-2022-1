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

    <form class="form-horizontal" action='TestServlet' method='post' onsubmit="return formSubmit();">
        <div class="form-group">
            <center>
                <div class="col-sm-6">
                    <h3>???????????????</h3>
                </div>
            </center>
        </div>

        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">?????????</label>
            <div class="col-sm-4">
                <input class="form-control" id="inputName" placeholder="????????????" name="name">
            </div>
            <label id="errName" class="col-sm-4 control-label" style="color: red;"></label>
        </div>
        <div class="form-group">
            <label for="inputAge" class="col-sm-2 control-label">?????????</label>
            <div class="col-sm-4">
                <input onkeyup="this.value=this.value.replace(/^0(0+|\d+)|[^\d]+/g,'')" class=" form-control"
                       id="inputAge" placeholder="????????????" name="age">
            </div>
            <label id="errAge" class="col-sm-4 control-label" style="color: red;"></label>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">?????????</label>
            <div class="radio col-sm-4">
                <label>
                    <input type="radio" name="sex" id="optionsRadios1" value="???" checked>
                    ???
                </label>
                <label>
                    <input type="radio" name="sex" id="optionsRadios2" value="???">
                    ???
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">?????????</label>
            <div class="col-sm-4">
                <div class="checkbox">
                    <label>
                        <input id="checkbox1" type="checkbox" value="??????" name="hobbies">??????
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox2" type="checkbox" value="??????" checked name="hobbies">??????
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox3" type="checkbox" value="??????" checked name="hobbies">??????
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox4" type="checkbox" value="??????" name="hobbies">??????
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="checkbox5" type="checkbox" value="??????" name="hobbies">??????
                    </label>
                </div>
                <div>
                    <label id="errCheckbox" style="color: red;"></label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">?????????</label>
            <div class=" col-sm-4">
                <select class="form-control" name="education">
                    <option>??????</option>
                    <option>??????</option>
                    <option>??????</option>
                    <option>??????</option>
                    <option>??????</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">???????????????</label>
            <div class="col-sm-4"><textarea class="form-control" rows="3" name="introduction"></textarea></div>
        </div>

        <div class="form-group col-sm-6">
            <center>
                <button type="submit" name="submit" class="btn btn-default">??????</button>&emsp;
                <button type="button" class="btn btn-default">??????</button>
            </center>
        </div>
    </form>

</div>

<script>

    function formSubmit() {

        if ($("#inputName").val() == "" || $("#inputName").val().length <= 2) {
            console.log("name");
            $("#errName").html("?????????????????????????????????2???");
            return false;
        } else {
            $("#errName").html("");
        }

        if ($("#inputAge").val().length != 2) {
            $("#errAge").html("??????????????????????????????!");
            return false;
        } else if (parseInt($("#inputAge").val()) < 18 || parseInt($("#inputAge").val()) > 30) {
            $("#errAge").html("???????????????18~30??????!");
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
            $("#errCheckbox").html("???????????????????????????!");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
