<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 0:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<p>往返时刻表</p><br>

<Row>
    <i-col span="12">
        始发站：{{ currentData.round_trip[0].departure_station }} {{ currentData.round_trip[0].departure_time }}
    </i-col>
    <i-col span="12">
        目的站：{{ currentData.round_trip[0].destination_station }} {{ currentData.round_trip[0].destination_time }}
    </i-col>
</Row>
<br>

<Row>
    <i-col span="12">
        始发站：{{ currentData.round_trip[1].departure_station }} {{ currentData.round_trip[1].departure_time }}
    </i-col>
    <i-col span="12">
        目的站：{{ currentData.round_trip[1].destination_station }} {{ currentData.round_trip[1].destination_time }}
    </i-col>
</Row>