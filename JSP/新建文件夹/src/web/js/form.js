
function formSubmit() {

    if ($("#inputName").val() == "" || $("#inputName").val().length <= 2) {
        console.log("name");
        $("#errName").html("姓名不能为空，长度大于2！");
        return false;
    } else {
        $("#errName").html("");
    }

    if ($("#inputAge").val().length != 2) {
        $("#errAge").html("年龄必须为两位的数字!");
        return false;
    } else if (parseInt($("#inputAge").val()) < 18 || parseInt($("#inputAge").val()) > 30) {
        $("#errAge").html("年龄应该在18~30之间!");
        return false;
    } else {
        $("#errAge").html("");
    }

    if ($("#checkbox1").is(':checked') ||
        $("#checkbox2").is(':checked') ||
        $("#checkbox3").is(':checked') ||
        $("#checkbox4").is(':checked') ||
        $("#checkbox5").is(':checked')) {
        $("#errCheckbox").html("");
    } else {
        $("#errCheckbox").html("至少要选择一项爱好!");
        return false;
    }

    return true;
}