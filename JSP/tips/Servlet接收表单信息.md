

# JavaBean 接收表单信息



- 设置字符集

```java
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
```

- 通过 `request` 接收数据 

```java
String name = request.getParameter("name");
String age = request.getParameter("age");
String sex = request.getParameter("sex");
String[] hobbies = request.getParameterValues("hobbies");
String education = request.getParameter("education");
```



