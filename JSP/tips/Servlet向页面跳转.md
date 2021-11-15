# Servlet 向页面跳转



#### 向新页面传递参数

- 获取 session
- 通过session传递 JavaBean

```java
HttpSession session = request.getSession();
session.setAttribute("info", info);

RequestDispatcher requestDispatcher = request.getRequestDispatcher("getInfo.jsp");
requestDispatcher.forward(request, response);
```



