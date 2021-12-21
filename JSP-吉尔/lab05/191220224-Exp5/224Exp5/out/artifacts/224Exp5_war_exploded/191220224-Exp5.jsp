<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>实验5-224：EL与JSTL编程</title>
    <link rel="stylesheet" href="191220224-Exp5.css" type="text/css"/>
</head>

<body>
<div id="header"></div>
<div id="navigator">
    <ul id="navigator">
        <li><a href="#">首页</a></li>
        <li><a href="../实验1/191220xxx-Exp1.html">实验一</a></li>
        <li><a href="http://localhost:8080/xxxExp2/191220xxx-Exp2.jsp">实验二</a></li>
        <li><a href="http://localhost:8080/xxxExp3/191220xxx-Exp3.jsp">实验三</a></li>
        <li><a href="http://localhost:8080/xxxExp4/191220xxx-Exp4.jsp">论坛四</a></li>
        <li><a href="#">帮助</a></li>
    </ul>
</div>
<div id="content">
    <h3>实验五&nbsp;&nbsp;EL与JSTL编程</h3>
    <h4>【实验目的】</h4>
    <p>1．掌握JSP的表达式语言EL的语法和编程方法。</p>
    <p>2．掌握JSP标准标签库JSTL的语法和编程方法。</p>
    <h4>【实验内容】</h4>

    <div id="invform">

        <h3>使用forEach标签输出九九乘法表</h3>
        九九乘法表

        <table border="1">
            <c:forEach var="i" begin="1" end="9">
                <tr>
                    <c:forEach var="j" begin="1" end="${i}">
                        <td><c:out value="${j} * ${i} = ${j * i}"></c:out></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>

        <br>
        <h3>使用forTokens对如下整段文章进行切分，分隔符为中文标点符号，显示切分的句子序号</h3>
        <p><font color="blue">JSTL（Java server pages standarded tag library，即JSP标准标签库）是由JCP（Java community
            Proces）所制定的标准规范，它主要提供给Java
            Web开发人员一个标准通用的标签库，并由Apache的Jakarta小组来维护。开发人员可以利用这些标签取代JSP页面上的Java代码，从而提高程序的可读性，降低程序的维护难度。
        </font></p>
        <b>切分后：</b><br>
        <br>
        <%
            int cnt = 1;
            String str = "JSTL（Java server pages standarded tag library，即JSP标准标签库）是由JCP（Java community）所制定的标准规范，它主要提供给JavaWeb开发人员一个标准通用的标签库，并由Apache的Jakarta小组来维护。开发人员可以利用这些标签取代JSP页面上的Java代码，从而提高程序的可读性，降低程序的维护难度。";
            request.setAttribute("str", str);
        %>
        <c:forTokens items="${str}" delims="（，）。" var="item" varStatus="varStatus" begin="0" end="110">
            ${varStatus.index + 1} ${item}<br>
        </c:forTokens>

    </div>

</div>
<div id="footer">
    <p>上海立信会计金融学院&nbsp;&nbsp;信息管理学院&nbsp;&nbsp;《JSP动态网页设计》课程实验</p>
</div>
</body>
</html>
