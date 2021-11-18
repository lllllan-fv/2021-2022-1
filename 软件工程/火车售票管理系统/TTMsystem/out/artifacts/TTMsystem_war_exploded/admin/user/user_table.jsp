<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/10
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<Card style="margin: 20px; border-radius: 10px">

    <div style="margin-left: 20px; ">
        <lable>用户名：&emsp;</lable>
        <i-input style="width: 300px" v-model="tableSearchInfo.userName"></i-input>
        <lable style="margin-left: 30px">手机号：&emsp;</lable>
        <i-input style="width: 300px" v-model="tableSearchInfo.userTel"></i-input>
        <div style="float: right">
            <i-button type="primary" icon="ios-search" @click="tableSearch">查询</i-button>
            <i-button type="default" icon="md-refresh" @click="tableSearchUnset">重置</i-button>
        </div>
        <br> <br>
        <i-button :size="buttonSize" type="primary" @click="addUser">
            添加用户
        </i-button>
    </div>

    <i-table stripe :loading="loading" :columns="userTableColumns" :data="tableData"
             @on-row-click="tableRowShow"
             @on-select-all="selectAll" :height="tableHeight" ref="table"
             style="margin-top: 20px">

        <template slot-scope="{ row }" slot="type">
            <div>
                <Icon v-if="row.type == '管理员'" type="md-contact"></Icon>
                <span v-if="row.type == '普通用户'">{{ row.type }}</span>
                <strong v-else>{{ row.type}}</strong>
            </div>
        </template>

        <template slot-scope="{ row }" slot="state">
            <div>
                <Badge :status="getUserState(row.state)" :text="row.state"/>
            </div>
        </template>

        <template slot-scope="{ row, index }" slot="order">
            <%-- 当前行点击事件和单元格按钮的点击事件冲突 @clicl.native.stop 即可阻止 --%>
            <i-button type="success" size="small" @click.native.stop="linkToOrder(index)">查看</i-button>
        </template>

        <template slot-scope="{ row, index }" slot="action">
            <i-button type="primary" size="small" style="margin-right: 5px" @click="tableRowEdit">编辑</i-button>
            <%-- 当前行点击事件和单元格按钮的点击事件冲突 @clicl.native.stop 即可阻止 --%>
            <i-button type="error" size="small" @click.native.stop="removeRow(index)">删除</i-button>
        </template>

    </i-table>

    <div style="margin: 10px;overflow: hidden">
        <div style="float: right;">
            <Page simple :total="tmpData.length" :page-size="pageSize" @on-change="changePage"></Page>
        </div>
    </div>

</Card>