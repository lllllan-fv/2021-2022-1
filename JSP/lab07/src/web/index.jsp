<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/10/25
  Time: 8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>

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

<%
    Vector<String> names = new Vector<>();
    Vector<String> values = new Vector<>();

    Enumeration<String> initParameterNames = application.getInitParameterNames();
    while (initParameterNames.hasMoreElements()) {
        String name = initParameterNames.nextElement();
        String value = (String) application.getInitParameter(name);

        names.add(name);
        values.add(value);
    }
%>

<div class="container" style="padding-top: 2em">

    <table class="table table-bordered">
        <tr>
            <th>param-name</th>
            <th>param-value</th>
        </tr>

        <%
            for (int i = 0; i < names.size(); ++i) {
        %>
        <tr>
            <td>
                <%=names.get(i)%>
            </td>
            <td>
                <%=values.get(i)%>
            </td>
        </tr>
        <%}%>

    </table>

</div>

</body>
</html>
