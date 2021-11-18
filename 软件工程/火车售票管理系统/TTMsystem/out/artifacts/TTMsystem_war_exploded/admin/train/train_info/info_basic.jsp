<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 0:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<p>基本信息</p><br>

<Row>
    <i-col span="8">
        火车类型：{{ currentData.train_type }}
    </i-col>
    <i-col span="8">
        火车名称：{{ currentData.train_number }}
    </i-col>
</Row>
<br>

<Row>
    <i-col span="8">
        出厂日期：2021-11-11
    </i-col>
    <i-col span="8">
        上次检查：2021-11-13
    </i-col>
    <i-col span="8">
        维修负责人：张三
    </i-col>
</Row>
<br>

<Alert type="warning" show-icon>
    上面一行信息未完善，非真实数据
</Alert>