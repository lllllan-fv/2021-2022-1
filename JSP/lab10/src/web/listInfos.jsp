<%@ page import="bean.Info" %>
<%@ page import="bean.InfoList" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/15
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 3.4.1 Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

    <!-- bootstrap-icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- 4.1.1 animate.min.css -->
    <link href="https://cdn.bootcdn.net/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <!-- 1.1.2 wow.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <!-- 2.6.9 vue.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.6.9/vue.min.js"></script>

    <!-- 0.21.1 axios.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.1/axios.min.js"></script>

    <!-- iview.css -->
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
    <!-- iview.min.js -->
    <script type="text/javascript" src="http://unpkg.com/iview/dist/iview.min.js"></script>

    <script type="text/javascript" src="js/form.js"></script>

</head>
<body style="background-color: #eee">

<%
    InfoList infoList = (InfoList) session.getAttribute("list");
    ArrayList<Info> list = (ArrayList) infoList.getInfoList();
%>

<div id="vm">
    <Card style="margin: 40px; border-radius: 10px">
        <h2 slot="title">信息统计表</h2>
        <i-table stripe
                 :height="height"
                 :columns="col"
                 :data="data">

            <template slot-scope="{ row, index }" slot="action">
                <i-button type="primary" size="small" style="margin-right: 5px" @click="show(index)">查看</i-button>
                <i-button type="success" size="small" style="margin-right: 5px" @click="edit(index)">修改</i-button>
                <i-button type="error" size="small" @click="remove(index)">删除</i-button>
            </template>
        </i-table>
    </Card>

    <Card style="margin: 40px; border-radius: 10px">
        <h2 slot="title">个人详情表</h2>
        <div v-if="showData" style="padding-bottom: 40px">

            <form class="form-horizontal" action='updateServlet' method='post' onsubmit="return formSubmit();">
                <input name="_id" class="hide" v-model="formData.id">
                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">姓名：</label>
                    <div class="col-sm-4">
                        <input class="form-control" id="inputName" placeholder="您的姓名" name="name"
                               v-model="formData.name" :disabled="!editAble">
                    </div>
                    <label id="errName" class="col-sm-4 control-label" style="color: red;"></label>
                </div>
                <div class="form-group">
                    <label for="inputAge" class="col-sm-2 control-label">年龄：</label>
                    <div class="col-sm-4">
                        <input onkeyup="this.value=this.value.replace(/^0(0+|\d+)|[^\d]+/g,'')" class=" form-control"
                               id="inputAge" placeholder="您的年龄" name="age"
                               v-model="formData.age" :disabled="!editAble">
                    </div>
                    <label id="errAge" class="col-sm-4 control-label" style="color: red;"></label>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">性别：</label>
                    <div class="radio col-sm-4">
                        <label>
                            <input type="radio" name="sex" id="optionsRadios1" value="男"
                                   :checked="formData.sex=='男'" :disabled="!editAble">
                            男
                        </label>
                        <label>
                            <input type="radio" name="sex" id="optionsRadios2" value="女"
                                   :checked="formData.sex=='女'" :disabled="!editAble">
                            女
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">爱好：</label>
                    <div class="col-sm-4">
                        <div class="checkbox">
                            <label>
                                <input id="checkbox1" type="checkbox" value="旅游" name="hobbies"
                                       :checked="formData.hobby.indexOf('旅游')!=-1" :disabled="!editAble">旅游
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="checkbox2" type="checkbox" value="登山" name="hobbies"
                                       :checked="formData.hobby.indexOf('登山')!=-1" :disabled="!editAble">登山
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="checkbox3" type="checkbox" value="健身" name="hobbies"
                                       :checked="formData.hobby.indexOf('健身')!=-1" :disabled="!editAble">健身
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="checkbox4" type="checkbox" value="上网" name="hobbies"
                                       :checked="formData.hobby.indexOf('上网')!=-1" :disabled="!editAble">上网
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="checkbox5" type="checkbox" value="游泳" name="hobbies"
                                       :checked="formData.hobby.indexOf('游泳')!=-1" :disabled="!editAble">游泳
                            </label>
                        </div>
                        <div>
                            <label id="errCheckbox" style="color: red;"></label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">学历：</label>
                    <div class=" col-sm-4">
                        <select class="form-control" name="education"
                                v-model="formData.education" :disabled="!editAble">
                            <option>硕士</option>
                            <option>本科</option>
                            <option>高中</option>
                            <option>初中</option>
                            <option>小学</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">自我介绍：</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="3" name="introduction"
                                  v-model="formData.introduction" :disabled="!editAble">
                        </textarea>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <center>
                        <button type="submit" name="submit" class="btn btn-default"
                                v-if="editAble">提交
                        </button>&emsp;
                    </center>
                </div>
            </form>

        </div>
    </Card>
</div>

<script>
    var vm = new Vue({
        el: '#vm',
        data: {
            height: null,
            col: [
                {
                    title: '序号',
                    key: 'id',
                    align: 'center'
                }, {
                    title: '姓名',
                    key: 'name',
                    align: 'center'
                }, {
                    title: '年龄',
                    key: 'age',
                    align: 'center',
                }, {
                    title: '性别',
                    key: 'sex',
                    align: 'center'
                }, {
                    title: '学历',
                    key: 'education',
                    align: 'center'
                }, {
                    title: '爱好',
                    key: 'hobby',
                    align: 'center'
                }, {
                    title: '操作',
                    slot: 'action',
                    align: 'center'
                }
            ],
            data: [],
            showData: null,
            editAble: false,
            formData: {
                id: '',
                name: '',
                age: '',
                sex: '',
                education: '',
                hobby: '',
                introduction: ''
            },
        },
        methods: {
            show: function (index) {
                this.editAble = false;
                this.showData = this.data[index];
                this.formData.id = this.showData.id;
                this.formData.name = this.showData.name;
                this.formData.age = this.showData.age;
                this.formData.sex = this.showData.sex;
                this.formData.education = this.showData.education;
                this.formData.hobby = this.showData.hobby;
                this.formData.introduction = this.showData.introduction;
            },
            edit: function (index) {
                this.show(index);
                this.editAble = true;
            },
            remove: function (index) {
                $.ajax({
                    type: 'POST',
                    url: 'deleteServlet',
                    data: {_id: this.data[index].id},
                    success: function (res) {
                        console.log(res);
                    }
                });
                this.data.splice(index, 1);
                this.height = Math.max(this.data.length * 48 + 42, 90);
            },
        },
        created: function () {
            var tmp = [];
            <%
                for (Info info : list) {
            %>
            var info = {
                id: '<%=info.getId()%>',
                name: '<%=info.getName()%>',
                age: '<%=info.getAge()%>',
                sex: '<%=info.getSex()%>',
                education: '<%=info.getEducation()%>',
                hobby: '<%=info.getHobby()%>',
                introduction: '<%=info.getIntroduction()%>',
            };
            tmp.push(info);
            <%
                }
            %>
            this.data = tmp;
            this.height = Math.max(this.data.length * 48 + 42, 90);
        },
    })

</script>

</body>
</html>
