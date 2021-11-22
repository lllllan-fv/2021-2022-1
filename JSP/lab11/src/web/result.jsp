<%@ page import="db.FileDAO" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/22
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>result</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

    <!-- bootstrap-icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- 4.1.1 animate.min.css -->
    <link href="https://cdn.bootcdn.net/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <!-- 1.1.2 wow.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <!-- 2.6.9 vue.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.6.9/vue.min.js"></script>

    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

    <style>
        <!--
        .datalist {
            border: 1px solid #0058a3; /* 表格边框 */
            font-family: Arial;
            border-collapse: collapse; /* 边框重叠 */
            background-color: #eaf5ff; /* 表格背景色 */
            font-size: 14px;
            margin: 0 auto;
            width: 80%;
        }

        .datalist caption {
            padding-bottom: 5px;
            font-size: 18px;
            text-align: center;
            font-weight: bold;
        }

        .datalist th {
            border: 1px solid #0058a3; /* 行名称边框 */
            background-color: #4bacff; /* 行名称背景色 */
            color: #FFFFFF; /* 行名称颜色 */
            font-weight: bold;
            padding-top: 4px;
            padding-bottom: 4px;
            padding-left: 12px;
            padding-right: 12px;
            text-align: center;
        }

        .datalist td {
            border: 1px solid #0058a3; /* 单元格边框 */
            text-align: center;
            padding-top: 4px;
            padding-bottom: 4px;
            padding-left: 10px;
            padding-right: 10px;
        }

        .datalist tr.altrow {
            background-color: #c7e5ff; /* 隔行变色 */
        }

        -->
    </style>

</head>
<body>


<%
    if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
        out.println("<script >alert('" + request.getAttribute("result") + "');</script>"); //页面显示提示信息
    }
    //查询所有文件信息
%>

<div class="alert alert-light" style="font-size:20px;height=20px;text-align:center;">所有文件</div>
<table class="table table-hover table-striped table-bordered">
    <tr>
        <th style="width: 6%;">序号</th>
        <th>文件名</th>
        <th>上传日期</th>
        <th>上传时间</th>
        <th>路径</th>
        <th>下载</th>
    </tr>


    <%
        FileDAO dao = new FileDAO();
        ArrayList<Map<String, String>> files = dao.queryAll();
        int i = 0;

        for (Map<String, String> file : files) {
    %>
    <tr>
        <td style="width: 6%;"><%=++i %>
        </td>
        <td><%=file.get("file_name") %>
        </td>
        <td><%=file.get("date") %>
        </td>
        <td><%=file.get("time") %>
        </td>
        <td><%=file.get("file_path") %>
        </td>
        <%--        <td><%=file.get("file_path").substring(file.get("file_path").lastIndexOf("/") + 1)%></td>--%>
        <td><a href='download?filename=<%=URLEncoder.encode(
                file.get("file_path").substring(file.get("file_path").lastIndexOf("/") + 1)
                , "UTF-8") %>'>下载文件</a></td>
    </tr>
    <%
        }
    %>

    <tr>
        <td colspan="6" style="text-align: center"><a href="index.jsp">上传文件</a></td>
    </tr>

</table>

</body>
</html>
