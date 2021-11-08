<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/8
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>shop</title>

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

<table>
    <tr>
        <th>商品</th>
        <th>操作</th>
        <th>数量</th>
    </tr>
    <tr>
        <td>西瓜</td>
        <td>
            <button type="submit">+</button>
            <button>-</button>
        </td>
        <td>0</td>
    </tr>
    <tr>
        <td>香蕉</td>
        <td>
            <button>+</button>
            <button>-</button>
        </td>
        <td>0</td>
    </tr>
    <tr>
        <td>芒果</td>
        <td>
            <button>+</button>
            <button>-</button>
        </td>
        <td>0</td>
    </tr>
    <tr>
        <td>葡萄</td>
        <td>
            <button>+</button>
            <button>-</button>
        </td>
        <td>0</td>
    </tr>
</table>

<button><a href="../191220224-Exp2.jsp">返回</a></button>
<button><a href="2019220224-cart.jsp">查看购物车</a></button>

<script>
    $(function () {
        var watermelon = sessionStorage.getItem("西瓜");
        var banana = sessionStorage.getItem("香蕉");
        var mango = sessionStorage.getItem("芒果");
        var grape = sessionStorage.getItem("葡萄");

        $('tr').each(function (index, item) {
            if ($(item).children().eq(0).html() == "西瓜") {
                if (watermelon > 0) $(item).children().eq(2).html(watermelon);
            } else if ($(item).children().eq(0).html() == "香蕉") {
                if (banana > 0) $(item).children().eq(2).html(banana);
            } else if ($(item).children().eq(0).html() == "芒果") {
                if (mango > 0) $(item).children().eq(2).html(mango);
            } else if ($(item).children().eq(0).html() == "葡萄") {
                if (grape > 0) $(item).children().eq(2).html(grape);
            }
        })
    })

    $("button").not(".skip").click(function () {

        var num = Math.max(0, parseInt($(this).parent().next().html()) + Math.pow(-1, $(this).index()));
        $(this).parent().next().html(num);

        sessionStorage.setItem($(this).parent().prev().html(), num);
    })

</script>

</body>
</html>
