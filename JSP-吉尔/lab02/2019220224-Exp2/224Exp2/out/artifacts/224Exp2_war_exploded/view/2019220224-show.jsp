<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/8
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show</title>

</head>
<body>

<%
    String remoteAddr = request.getRemoteAddr();
    String remoteHost = request.getRemoteHost();
    String serverName = request.getServerName();
    int serverPort = request.getServerPort();

    response.setHeader("Refresh", "5; url=../191220224-Exp2.jsp");
%>

<h3>
    客户端的IP地址：<%=remoteAddr%>
</h3>

<h3>
    客户机的名称：<%=remoteHost%>
</h3>

<h3>
    服务器的名称：<%=serverName%>
</h3>

<h3>
    服务器的端口号：<%=serverPort%>
</h3>

</body>
</html>
