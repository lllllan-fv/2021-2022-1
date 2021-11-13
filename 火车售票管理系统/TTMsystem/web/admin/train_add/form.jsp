<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/13
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--    火车名称
        火车类型
        始发站 - 目的站
--%>

<form action="#" method="post" onsubmit="return false;"
      class="form-horizontal">

    <div class="form-group">
        <label class="col-sm-2 control-label">火车车次</label>
        <div class="col-sm-10">
            <i-input name="train_number"
                     size="large"
                     prefix="md-train"
                     placeholder="eg: 1818"/>
            </i-input>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">火车类型</label>
        <div class="col-sm-10">
            <i-select name="train_type">
                <i-option value="动车">动车</i-option>
                <i-option value="高铁">高铁</i-option>
                <i-option v-for="item in train_type_list"
                          :value="item.value"
                          :key="item.value"
                          disabled>
                    {{ item.label }}
                </i-option>
            </i-select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">始发站</label>
        <div class="col-sm-4">
            <Cascader name="departure_station"
                      :data="station_list" trigger="hover"></Cascader>
        </div>
        <label class="col-sm-2 control-label">目的站</label>
        <div class="col-sm-4">
            <Cascader name="destination_station"
                      :data="station_list" trigger="hover"></Cascader>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">启程时间</label>
        <div class="col-sm-4">
            <Cascader name="departure_time1"
                      :data="time_list" trigger="hover"></Cascader>
            </i-select>
        </div>
        <label class="col-sm-2 control-label">到达时间</label>
        <div class="col-sm-4">
            <Cascader name="arrive_time1"
                      :data="time_list" trigger="hover"></Cascader>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">返程时间</label>
        <div class="col-sm-4">
            <Cascader name="departure_time2"
                      :data="time_list" trigger="hover"></Cascader>
        </div>
        <label class="col-sm-2 control-label">到达时间</label>
        <div class="col-sm-4">
            <Cascader name="arrive_time2"
                      :data="time_list" trigger="hover"
                      @on-change="timeOnChange"></Cascader>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>