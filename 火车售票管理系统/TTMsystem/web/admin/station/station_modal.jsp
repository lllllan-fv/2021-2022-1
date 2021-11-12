<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/12
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<Modal
        v-model="addProvinceModal"
        title="注册省份"
        @on-ok=""
        @on-cancel="">
    <p>Content of dialog</p>
</Modal>

<Modal
        v-model="addCityModal"
        title="注册城市"
        @on-ok=""
        @on-cancel="">
    <p>Content of dialog</p>
</Modal>

<Modal
        v-model="addStationModal"
        title="注册火车站"
        @on-ok=""
        @on-cancel="">
    <p>Content of dialog</p>
</Modal>