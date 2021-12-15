<%@ page import="Exp4.DataList224" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>实验4-224：Java Bean与Java Servlet编程</title>
    <link rel="stylesheet" href="191220224-Exp4.css" type="text/css"/>
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
    <h3>实验四&nbsp;&nbsp;Servlet MVC编程</h3>
    <h4>【实验目的】</h4>
    <p>1．掌握WEB应用程序MVC设计模式的概念、实现方法。</p>
    <p>2．掌握Servlet MVC模式的编程、部署、运行方法。</p>
    <h4>【实验内容】</h4>

    <div id="invform">
        <%
            Object attribute1 = session.getAttribute("string");
            if (attribute1.equals("0")) {
        %>
        <h3>对数据列表进行计算</h3>
        <%
        } else {
        %>
        <h3>对数据字符串进行计算</h3>
        <%}%>

        <p>
            数据列表：
            <%
                DataList224 list = (DataList224) session.getAttribute("list");
                List<Double> list1 = list.getList();
                for (Double data : list1) {
            %>
            <%=data%>,
            <%}%>
        </p>

        <p>
            计算结果：数据列表的
            <%
                String attribute = (String) session.getAttribute("type");
                if (attribute.equals("AVG")) {
                    double avg = list.getAVG();
            %>
            平均值为：<%=avg%>
            <%
            } else if (attribute.equals("SD")) {
                double sd = list.getSD();
            %>
            方差为：<%=sd%>
            <%
            } else {
                double msd = list.getMSD();
            %>
            均方差为：<%=msd%>
            <%} %>
        </p>

        <p>
            <a href="191220224-Exp4.jsp">返回</a>
        </p>

    </div>

</div>
<div id="footer">
    <p>上海立信会计金融学院&nbsp;&nbsp;信息管理学院&nbsp;&nbsp;《JSP动态网页设计》课程实验</p>
</div>
</body>
</html>
