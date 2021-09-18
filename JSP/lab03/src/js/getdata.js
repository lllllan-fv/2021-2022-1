var province_id = 1;
var city_id = 0;

$().ready(function () {
    console.log("ready()");
    menuOnLoad();
})

function menuOnLoad() {
    console.log("menuOnLoad()");
    $("#province").html("");
    $("#city").html("");

    var province, city;

    var first_flag = true;
    $.each(cityData, function (i, e) {
        if (e.pid == 0) {
            if (e._id == province_id) {
                province = e.city_name;
                $("#province_name").html(e.city_name);
            }
            $("#province").append("<li><a href='#' onclick='provinceClick(" + e._id + ")'>" + e.city_name + "</a></li>");
        } else if (e.pid == province_id) {
            if (first_flag && (city_id == 0 || city_id == e._id)) {
                city_id = e._id;
                first_flag = false;
                city = e.city_name;
                $("#city_name").html(e.city_name);
            }
            $("#city").append("<li><a href='#' onclick='cityClick(" + e._id + ")'>" + e.city_name + "</a></li>");
        }
    });

    $("#pro-city").html(province + "<small>&ensp;" + city + "</small>");
    getData();
}

function provinceClick(id) {
    province_id = id;
    city_id = 0;
    menuOnLoad();
}

function cityClick(id) {
    city_id = id;
    menuOnLoad();
}

function getData() {
    console.log("getData()");

    var str = " <table class=\"table table-striped table-hover\">\
                    <tr>\
                        <th>日期</th>\
                        <th>天气情况</th>\
                        <th>最低温度</th>\
                        <th>最高温度</th>\
                        <th>风向</th>\
                        <th>风速</th>\
                        <th>日出时间</th>\
                    </tr>";

    console.log(city_id);
    $.ajax({
        async: false,
        url: 'http://www.class-space.cn/weather/query?cityCode=' + cityData[city_id - 1].city_code,
        success: function (res) {
            console.log(res);
            $.each(res.data["forecast"], function (i, e) {
                console.log(e);

                str += "<tr>\
                            <td>" + e["ymd"] + "</td>\
                            <td>" + e["type"] + "</td>\
                            <td>" + e["low"] + "</td>\
                            <td>" + e["high"] + "</td>\
                            <td>" + e["fx"] + "</td>\
                            <td>" + e["fl"] + "</td>\
                            <td>" + e["sunrise"] + "</td>\
                        </tr>";
            });
        }, error: function () {
            alert("error");
        }
    })

    str += "</table>";
    $("#table").html(str);
}
