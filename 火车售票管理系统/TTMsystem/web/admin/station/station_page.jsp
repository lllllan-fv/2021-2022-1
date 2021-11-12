<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/12
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="margin: 40px; overflow: hidden">
    <div style="float: right;">
        <Page simple :total="dataCount" :page-size="pageSize" @on-change="changePage"></Page>
    </div>
</div>
