<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 0:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<p>运行时刻表</p>

<i-table :height="runningData.tableHeight"
         :columns="runningTableColumns"
         :data="runningData.tableData"
         style="margin-top: 20px">

    <template slot-scope="{ row, index }" slot="about">
        <i-button @click="linkToRunning">查看</i-button>
    </template>

</i-table>