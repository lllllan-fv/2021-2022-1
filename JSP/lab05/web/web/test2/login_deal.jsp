<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/10/11
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
%>

<p>
    username: <%=id%>
</p>
<p>
    pwd: <%=pwd%>
</p>
</body>
</html>
