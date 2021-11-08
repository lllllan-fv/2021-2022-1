<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <title>实验2-224：动态网页设计</title>
    <link rel="stylesheet" href="style/191220224-Exp2.css">
</head>

<body>

<%
    Object count = application.getAttribute("count");

    if (count == null) {
        count = 1;
        application.setAttribute("count", 1);
    } else {
        application.setAttribute("count", (int) (count) + 1);
    }

    Object count1 = application.getAttribute("userCount");
    if (count1 == null) {
        count1 = 1;
        application.setAttribute("count1", 1);
    } else {
        if (session.isNew())
            application.setAttribute("count1", (int) (count1) + 1);
    }

    int visCount = (int) count;
    int userCount = (int) count1;
%>

<jsp:include page="view/191220224-header.jsp"></jsp:include>

<div id="content">
    <h3>实验二&nbsp;&nbsp;动态网页设计</h3>
    <h4>【实验目的】</h4>
    <p>1．掌握JSP基本语法，熟悉JSP页面结构、脚本元素、指令标记和动作标记。</p>
    <p>2．掌握内置对象的基本使用方法，熟练掌握request对象、reponse对象、out对象、session对象、application对象的具体用法。</p>
    <h4>【实验内容】</h4>

    <div id="invform">
        <h3>网页访问计数器</h3>
        <p>
            这是该网页被第&nbsp;
            <b>
                <%=visCount%>
            </b>&nbsp;
            次访问。
        </p>

        <h3>使用include动作标记</h3>
        <jsp:include page="view/191220224-first.jsp">
            <jsp:param name="rows" value="6"/>
            <jsp:param name="cols" value="18"/>
        </jsp:include>
        <br>

        <h3>使用request对象</h3>
        <form action="view/2019220224-show.jsp" method="post">
            <input type="submit" value="显示客户端信息" name="submit"/>
        </form>

        <h3>模拟购物车</h3>
        <form action="" method="post">
            <table id="formlayout">
                <tr>
                    <td style="text-align:right;">会员卡号：</td>
                    <td><input type="text" name="cardno" value="12345678"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="购物" name="submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="重置" name="reset"/></td>
                </tr>
            </table>
        </form>

        <h3>网站访客计数器</h3>
        <p>
            这是该网站被第&nbsp;
            <b>
                <%=userCount%>
            </b>&nbsp;
            个用户访问。
        </p>
    </div>

</div>

<jsp:include page="view/191220224-footer.jsp"></jsp:include>

</body>
</html>
