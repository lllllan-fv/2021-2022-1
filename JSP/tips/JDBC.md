# JDBC



#### jar包：java.sql, javax.sql

按道理 `jdk-8/rt.jar/java/` 和`jdk-8/rt.har/javax` 里会有，如果出错，自行百度下载然后导入。



#### 连接数据库一般步骤

```java
// 装载驱动程序
Class.forName("com.mysql.jdbc.Driver");
System.out.println("数据库驱动加载成功");

// 建立与数据库的连接：url、用户名、密码
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab10", "root", "root");
System.out.println("数据库连接成功");

// 建立语句对象
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

// 关闭相关对象
if (stmt != null) stmt.close();
if (conn != null) conn.close();
```



#### 插入数据

```java
String sql = "insert info value('张三', 23, '男', '初中', '吃饭，睡觉')";
stmt.executeUpdate(sql);
```



#### 查询数据

```java
String sql = "select * from info";
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()) {
    String name = rs.getString("name");
    int age = rs.getInt("age");
    // ...
}

rs.close();
```



#### 更新数据

```java
String sql = "update info set age=22 where name='张三'";
stmt.executeUpdate(sql);
```



#### 删除数据

```java
String sql = "delete from info where name='张三'";
stmt.executeUpdate(sql);
```

