<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="UTF-8">
        <title>Insert title here</title>

        <!-- jquery -->
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
            integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

        <link href="http://lllllan.cn/index-style.css" >

    </head>

    <body>

        <% 
            String url = "";
            String text = request.getParameter("inputDigit"); 

            try {
                int num = Integer.parseInt(text);
                
                if (num >= 1 && num <= 100) {
                    url = (num > 50) ? "three.jsp" : "two.jsp";
                    
                    %>
                    <jsp:include page="<%=url%>">     
                        <jsp:param value="<%=text%>" name="digit" />
                    </jsp:include>
                    <%

                } else {

                    %>
                    <jsp:include page="error.jsp">     
                        <jsp:param value="the given number is not in the predefined range: 1~100." name="msg" />
                    </jsp:include>
                    <%

                }

            } catch (Exception e) {
                String msg = "For input String: \"" + text + "\"";
                %>
                <jsp:include page = "error.jsp">     
                    <jsp:param value="<%=msg%>" name="msg" />
                </jsp:include>
                <%
            }
            
        %>

    </body>

    </html>