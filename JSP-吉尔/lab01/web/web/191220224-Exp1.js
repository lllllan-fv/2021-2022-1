function formSubmit() {
    if (!validName() || !validBirth() || !validID() || !validEmail()) {
        return false;
    }

    return true;
}

//去掉前后空格
function deltrim(x) {
    while (x.length > 0 && x.charAt(0) == ' ')
        x = x.substring(1, x.length);
    while (x.length > 0 && x.charAt(x.length - 1) == ' ')
        x = x.substring(0, x.length - 1);
    return x;
}

//非空验证
function isNull(x, message) {
    var va = deltrim(x);
    if (va == "") {
        alert(message + "不能为空!");
        return true;
    }
    return false;
}

function validName() {
    return !isNull($("#name").val(), "姓名");
}

function validBirth() {
    var birth = $("#birth").val();

    if (isNull(birth)) return false;

    var pattern = /^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/;
    if (!birth.match(pattern)) {
        alert("生日格式不正确！");
        return false;
    }

    return true;
}

function validID() {
    var id = $("#id").val();

    if (isNull(id, "学号")) return false;

    var pattern = /^([0-9]{6}[1-9])(0[1-9]|[1-9][0-9])$/;
    if (!id.match(pattern)) {
        alert("学号格式不正确！");
        return false;
    }
    return true;
}

function validEmail() {
    var email = $("#email").val();

    if (isNull(email, "电子邮箱")) return false;

    var pattern = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if (!email.match(parent)) {
        alert("电子邮箱格式不正确");
        return false;
    }
    return true;
}

function reSet() {
    location.reload();
}