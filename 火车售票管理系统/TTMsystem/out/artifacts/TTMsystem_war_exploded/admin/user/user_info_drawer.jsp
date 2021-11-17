<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/10
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<Drawer title="添加用户" :width="35"
        key="user_info"
        :closable="false"
        :mask-closable="userInfoDrawer.maskCloseable"
        v-model="userInfoDrawer.drawerVisible">

    <Row style="margin: 20px 0 20px 0">
        <i-col span="5" offset="4">
            <Avatar shape="square" icon="ios-person" size="large"/>
        </i-col>
        <i-col span="10" offset="2">
            <h5>用户ID: {{ currentRowData.id }}</h5><br>
            <h5>创建时间: {{ currentRowData.create_time }}</h5>
        </i-col>
    </Row>

    <hr style="margin: 40px 0 20px 0">

    <form id="user_info_form" action="#" method="post" onsubmit="return false;">

        <Row style="margin-top: 20px">
            <i-col span="11">
                <label>用户名: </label>
                <i-input name="user_name"
                         :disabled="!userInfoDrawer.drawerEditable"/>
            </i-col>
            <i-col span="11" offset="2">
                <label>手机号: </label>
                <i-input name="user_tel"
                         :disabled="!userInfoDrawer.drawerEditable"/>
            </i-col>
        </Row>

        <Row style="margin-top: 20px">
            <i-col span="11">
                <label>用户类型: </label>
                <i-select name="user_type"
                          v-model="userInfoDrawer.typeSelect"
                          :disabled="!userInfoDrawer.drawerEditable">
                    <i-option value="普通用户">普通用户</i-option>
                    <i-option value="VIP用户">VIP用户</i-option>
                    <i-option value="管理员">管理员</i-option>
                </i-select>
            </i-col>

            <i-col span="11" offset="2">
                <label>用户状态: </label>
                <i-select name="user_state"
                          v-model="userInfoDrawer.stateSelect"
                          :disabled="!userInfoDrawer.drawerEditable">
                    <i-option value="正常">正常</i-option>
                    <i-option value="冻结">冻结</i-option>
                    <i-option value="注销">注销</i-option>
                </i-select>
            </i-col>
        </Row>

        <hr style="margin: 20px 0 20px 0">

        <Alert type="warning" show-icon>
            信息待完善
            <template slot="desc">
                以下信息为示例数据，非用户真实数据。
            </template>
        </Alert>

        <Row style="margin-top: 20px">
            <i-col span="11">
                <label>邮箱: </label>
                <i-input name="user_email" value="12580@qq.com"/>
            </i-col>
            <i-col span="11" offset="2">
                <label>所在地区: </label>
                <i-select value="广东">
                    <i-option value="广东">广东</i-option>
                </i-select>
            </i-col>
        </Row>

        <Row style="margin-top: 20px">
            <label>个人简介: </label>
            <i-input type="textarea" name="user_introduction" value="这个人很懒，什么都没留下。"/>
        </Row>

        <hr style="margin: 20px 0 20px 0">

        <button v-if="userInfoDrawer.drawerEditable" type="submit" class="btn btn-primary" @click="editUserInfoSubmit"
                style="float: right">
            确定
        </button>

    </form>

</Drawer>