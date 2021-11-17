<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 0:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="margin: 40px 0 0px 0; overflow: hidden">
    <div style="float: right;">
        <Page simple :total="runningData.tmpData.length" :page-size="pageSize" @on-change="changePage1"></Page>
    </div>
</div>
