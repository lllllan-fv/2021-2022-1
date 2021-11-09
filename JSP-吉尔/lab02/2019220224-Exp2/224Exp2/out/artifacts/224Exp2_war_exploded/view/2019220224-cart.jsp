<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/8
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>cart</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <style>
        table {
            table-layout: fixed;
            border: 1px solid;
        }

        td {
            width: 100px;
            text-align: center;
            border: 1px solid;
        }
    </style>

</head>
<body>

<div id="show">

</div>

<button><a href="../191220224-Exp2.jsp">返回</a></button>

<script>

    var watermelon = sessionStorage.getItem("西瓜");
    var banana = sessionStorage.getItem("香蕉");
    var mango = sessionStorage.getItem("芒果");
    var grape = sessionStorage.getItem("葡萄");

    if (watermelon > 0 || banana > 0 || mango > 0 || grape > 0) {
        var str = "<table>";
        str += "<tr>";
        str += "<th>商品</th>";
        str += "<th>数量</th>";
        str += "</tr>";

        if (watermelon > 0) {
            str += "<tr>";
            str += "<td>西瓜</td>";
            str += "<td>" + watermelon + "</td>";
            str += "</tr>";
        }

        if (banana > 0) {
            str += "<tr>";
            str += "<td>香蕉</td>";
            str += "<td>" + banana + "</td>";
            str += "</tr>";
        }

        if (mango > 0) {
            str += "<tr>";
            str += "<td>芒果</td>";
            str += "<td>" + mango + "</td>";
            str += "</tr>";
        }

        if (banana > 0) {
            str += "<tr>";
            str += "<td>葡萄</td>";
            str += "<td>" + grape + "</td>";
            str += "</tr>";
        }

        str += "</table>";
        str += "<button id='cls'>清空购物车</button>";

        $("#show").html(str);
    } else {
        $("#show").html("<h3>你没有添加任何商品</h3>");
    }

    $('#cls').click(function () {
        sessionStorage.setItem("西瓜", 0);
        sessionStorage.setItem("香蕉", 0);
        sessionStorage.setItem("芒果", 0);
        sessionStorage.setItem("葡萄", 0);

        location.reload();
    })

</script>

</body>
</html>
