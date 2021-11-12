<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/12
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<i-table stripe
         :height="trainData.tableHeight"
         :columns="trainTableColumns"
         :data="trainData.tableData"
         style="margin-top: 20px">

    <template slot-scope="{ row }" slot="departure">
        {{ row.round_trip[0].departure_station }} / {{ row.round_trip[0].destination_station }}
    </template>

    <template slot-scope="{ row }" slot="destination">
        {{ row.round_trip[1].departure_station }} / {{ row.round_trip[1].destination_station }}
    </template>

    <template slot-scope="{ row, index }" slot="about">
        <i-button @click="showInfo(index)">查看</i-button>
    </template>

</i-table>