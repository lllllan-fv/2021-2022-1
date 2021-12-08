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

    <div id="invform">

        <h3>使用Bean进行数据传递和处理</h3>
        输入三角形的三边边长：

        <form action="191220224-Triangle.jsp" method="post">
            <p>
                边A的长度：<input name="edgeA">
            </p>
            <p>
                边B的长度：<input name="edgeB">
            </p>
            <p>
                边C的长度：<input name="edgeC">
            </p>

            <div style="margin: 10px 0 0 60px">
                <button type="submit">计算三角形面积和周长</button>
                <button type="reset">重置</button>
            </div>

        </form>

        <br>

        <h3>利用Servlet处理购物车结算</h3>
        <form action="191220224-shop.jsp" method="post">
            <table id="formlayout">
                <tr>
                    <td style="text-align:right;">会员卡号：</td>
                    <td><input type="text" name="cardno" value="12345678"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="购物" name="submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="重置" name="reset"/></td>
                </tr>
            </table>
        </form>

    </div>

</div>
<div id="footer">
    <p>上海立信会计金融学院&nbsp;&nbsp;信息管理学院&nbsp;&nbsp;《JSP动态网页设计》课程实验</p>
</div>
</body>
</html>
