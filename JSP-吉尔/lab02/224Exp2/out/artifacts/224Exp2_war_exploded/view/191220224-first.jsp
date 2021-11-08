<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>first</title>

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

<%
    int rows = Integer.parseInt(request.getParameter("rows"));
    int cols = Integer.parseInt(request.getParameter("cols"));
%>

<table>
    <%
        for (int i = 1; i <= rows; ++i) {
            out.print("<tr>");

            for (int j = 1; j <= cols; ++j) {
                out.print("<td>" + (i * j) + "</td>");
            }

            out.print("</tr>");
        }
    %>
</table>

</body>
</html>
