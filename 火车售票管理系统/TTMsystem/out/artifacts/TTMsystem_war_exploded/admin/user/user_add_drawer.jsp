<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/10
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<Drawer title="用户信息" :width="35"
        key="user_add"
        :closable="false"
        :mask-closable="addUserDrawer.maskCloseable"
        v-model="addUserDrawer.drawerVisible">

    <form id="user_add_form" action="#" method="post" onsubmit="return false;">

        <Row style="margin-top: 20px">
            <i-col span="11">
                <label>用户名: </label>
                <i-input name="user_name" placeholder="爷傲、奈我何"/>
            </i-col>
            <i-col span="11" offset="2">
                <label>手机号: </label>
                <i-input name="user_tel" placeholder="25041"/>
            </i-col>
        </Row>

        <Row style="margin-top: 20px">
            <i-col span="11">
                <label>用户类型: </label>
                <i-select name="user_type"
                          v-model="addUserDrawer.typeSelect">
                    <i-option value="普通用户">普通用户</i-option>
                    <i-option value="VIP用户">VIP用户</i-option>
                    <i-option value="管理员">管理员</i-option>
                </i-select>
            </i-col>

            <i-col span="11" offset="2">
                <label>用户状态: </label>
                <i-select name="user_state"
                          v-model="addUserDrawer.stateSelect">
                    <i-option value="正常">正常</i-option>
                    <i-option value="冻结">冻结</i-option>
                    <i-option value="注销">注销</i-option>
                </i-select>
            </i-col>
        </Row>

        <hr style="margin: 20px 0 20px 0">

        <Alert type="warning" show-icon>
            功能待完善
            <template slot="desc">
                以下信息不需要填写，反正也不会生效。
            </template>
        </Alert>

        <Row style="margin-top: 20px">
            <i-col span="11">
                <label>邮箱: </label>
                <i-input name="user_email" placeholder="邮箱地址"/>
            </i-col>
            <i-col span="11" offset="2">
                <label>所在地区: </label>
                <i-select value="广东">
                    <i-option value="广东">广东</i-option>
                    <i-option value="你只能在广东" disabled>你只能在广东</i-option>
                </i-select>
            </i-col>
        </Row>

        <Row style="margin-top: 20px">
            <label>个人简介: </label>
            <i-input type="textarea" name="user_location" placeholder="写点什么吧，就算什么也不会被留下。"/>
        </Row>

        <hr style="margin: 20px 0 20px 0">

        <button type="submit" class="btn btn-primary" @click="addUserSubmit"
                style="float: right">
            确定
        </button>

    </form>

</Drawer>