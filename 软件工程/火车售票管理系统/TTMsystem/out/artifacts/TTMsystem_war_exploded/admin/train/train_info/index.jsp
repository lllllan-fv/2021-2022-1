<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<Card style="margin-bottom: 40px ;border-radius: 10px;">

    <h1 slot="title">{{ currentData.train_type }} {{ currentData.train_number }}</h1>

    <%-- 基本信息 --%>
    <jsp:include page="info_basic.jsp"></jsp:include>

    <Divider></Divider>

    <%--  往返时刻表  --%>
    <jsp:include page="info_round_trip.jsp"></jsp:include>

    <Divider></Divider>

    <%--  运行信息  --%>
    <jsp:include page="info_running.jsp"></jsp:include>
    <jsp:include page="info_page.jsp"></jsp:include>

</Card>