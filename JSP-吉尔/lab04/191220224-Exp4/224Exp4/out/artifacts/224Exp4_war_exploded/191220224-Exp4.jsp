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

        <h3>对数据列表进行计算</h3>
        <form action="Servlet224" method="post">
            <table id="formlayout">
                <tr>
                    <td style="text-align:right;width:75px;">数据列表：</td>
                    <td>
                        <input type="text" name="data1" value="12" style="width:40px;">
                        <input type="text" name="data2" value="23" style="width:40px;">
                        <input type="text" name="data3" value="34" style="width:40px;">
                        <input type="text" name="data4" value="45" style="width:40px;">
                        <input type="text" name="data5" value="56" style="width:40px;">
                        <input type="text" name="data6" value="67" style="width:40px;">
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">计算类型：</td>
                    <td>
                        <input type="radio" name="calType" value="AVG" checked/>计算均值&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="calType" value="SD"/>计算方差&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="calType" value="MSD"/>计算均方差
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="执行计算" name="submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="重置" name="reset"/>
                        <input type="hidden" name="action" value="DATALIST"/>
                    </td>
                </tr>
            </table>
        </form>

        <br>

        <h3>对数据字符串进行计算</h3>
        <form action="Servlet224String" method="post">
            <table id="formlayout">
                <tr>
                    <td style="text-align:right;width:75px;">数据列表：</td>
                    <td>
                        <input type="text" name="data" value="11,12,13,14,15,16" style="width:250px;">
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">计算类型：</td>
                    <td>
                        <input type="radio" name="calType" value="AVG" checked/>计算均值&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="calType" value="SD"/>计算方差&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="calType" value="MSD"/>计算均方差
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="执行计算" name="submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="重置" name="reset"/>
                        <input type="hidden" name="action" value="DATALIST"/>
                    </td>
                </tr>
            </table>
        </form>
        <br>
    </div>

</div>
<div id="footer">
    <p>上海立信会计金融学院&nbsp;&nbsp;信息管理学院&nbsp;&nbsp;《JSP动态网页设计》课程实验</p>
</div>
</body>
</html>
