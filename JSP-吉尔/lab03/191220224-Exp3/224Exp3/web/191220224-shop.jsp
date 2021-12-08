<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>实验3-224：Java Bean与Java Servlet编程</title>
    <link rel="stylesheet" href="191220224-Exp3.css" type="text/css"/>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 2.6.9 vue.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.6.9/vue.min.js"></script>

    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

</head>

<body>
<div id="header"></div>
<div id="navigator">
    <ul id="navigator">
        <li><a href="#">首页</a></li>
        <li><a href="../实验1/191220xxx-Exp1.html">实验一</a></li>
        <li><a href="http://localhost:8080/xxxExp2/191220xxx-Exp2.jsp">实验二</a></li>
        <li><a href="http://localhost:8080/xxxExp3/191220xxx-Exp3.jsp">实验三</a></li>
        <li><a href="#">论坛</a></li>
        <li><a href="#">帮助</a></li>
    </ul>
</div>
<div id="content">
    <h3>实验三&nbsp;&nbsp;Java Bean与Java Servlet编程</h3>
    <h4>【实验目的】</h4>
    <p>1．掌握Java Bean的编程方法，以及在JSP中使用Java Bean的方法。</p>
    <p>2．掌握Java Servlet的编程创建、部署、运行方法，以及通过JSP页面访问Java Servlet的方法。</p>
    <h4>【实验内容】</h4>

    <%
        String cardNo = request.getParameter("cardno");
        session.setAttribute("cardNo", cardNo);
    %>

    <div id="invform">

        <h3>模拟网上商店</h3>
        <p>
            会员卡号：<%=cardNo%>
        </p>

        <el-table :data="tableData"
                  style="width: 90%; border-radius: 10px; margin-top: 20px; ">
            <el-table-column label="编号"
                             type="index"
                             width="120"
                             align="center">
            </el-table-column>
            <el-table-column prop="name"
                             label="商品名称"
                             width="120"
                             align="center">
            </el-table-column>
            <el-table-column prop="price"
                             label="单价（元）"
                             width="120"
                             align="center">
            </el-table-column>
            <el-table-column prop="action"
                             label="选入购物车"
                             width="120"
                             align="center">
                <template slot-scope="scope">
                    <el-button @click="change(scope.row, 1)" type="text" size="small">增加</el-button>
                    <el-button @click="change(scope.row, -1)" type="text" size="small">
                        减少
                    </el-button>
                </template>
            </el-table-column>
            <el-table-column prop="number"
                             label="选购数量"
                             width="120"
                             align="center">
            </el-table-column>
        </el-table>

        <div align="center" style="margin: 10px 0 0 0;">
            <button @click="toServlet">查看购物车</button>
            <button @click="clear">清空购物车</button>
            <button @click="window.location.href = '191220224-Exp3.jsp'">返回</button>
        </div>

    </div>

    <script>
        var vm = new Vue({
            el: '#invform',
            data() {
                return {
                    tableData: [],
                }
            },
            methods: {
                clear() {
                    this.tableData.forEach(function (item) {
                        item.number = 0;
                        sessionStorage.setItem(item.name, item.number);
                    })
                },
                toServlet() {
                    var url = "Servlet224?";
                    this.tableData.forEach(function (item, index) {
                        if (index) url += "&";
                        url += "name" + index + "=" + item.name + "&price" + index + "+" + item.price + "&num" + index + "=" + item.number;
                    })
                    console.log(url);

                    window.location.href = url;
                },
                change(item, k) {
                    item.number = Math.max(parseInt(item.number) + k, 0);
                    sessionStorage.setItem(item.name, item.number);
                },
            },
            beforeMount: function () {
                let item1 = sessionStorage.getItem("商品名称1");
                if (item1 == null) item1 = 0;

                let item2 = sessionStorage.getItem("商品名称2");
                if (item2 == null) item2 = 0;

                let item3 = sessionStorage.getItem("商品名称3");
                if (item3 == null) item3 = 0;

                let item4 = sessionStorage.getItem("商品名称4");
                if (item4 == null) item4 = 0;

                let item5 = sessionStorage.getItem("商品名称5");
                if (item5 == null) item5 = 0;

                let item6 = sessionStorage.getItem("商品名称6");
                if (item6 == null) item6 = 0;

                let data = [];
                data.push({name: '商品名称1', price: '28.0', number: item1});
                data.push({name: '商品名称2', price: '38.0', number: item2});
                data.push({name: '商品名称3', price: '48.0', number: item3});
                data.push({name: '商品名称4', price: '58.0', number: item4});
                data.push({name: '商品名称5', price: '68.0', number: item5});
                data.push({name: '商品名称6', price: '78.0', number: item6});
                this.tableData = data;
            }
        })
    </script>

</div>
<div id="footer">
    <p>上海立信会计金融学院&nbsp;&nbsp;信息管理学院&nbsp;&nbsp;《JSP动态网页设计》课程实验</p>
</div>
</body>
</html>
