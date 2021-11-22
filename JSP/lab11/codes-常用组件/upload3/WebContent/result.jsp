<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="db.FileDAO"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
<!--
.datalist {
	border: 1px solid #0058a3; /* 表格边框 */
	font-family: Arial;
	border-collapse: collapse; /* 边框重叠 */
	background-color: #eaf5ff; /* 表格背景色 */
	font-size: 14px;
	margin: 0 auto;
	width: 80%;
}

.datalist caption {
	padding-bottom: 5px;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
}

.datalist th {
	border: 1px solid #0058a3; /* 行名称边框 */
	background-color: #4bacff; /* 行名称背景色 */
	color: #FFFFFF; /* 行名称颜色 */
	font-weight: bold;
	padding-top: 4px;
	padding-bottom: 4px;
	padding-left: 12px;
	padding-right: 12px;
	text-align: center;
}

.datalist td {
	border: 1px solid #0058a3; /* 单元格边框 */
	text-align: center;
	padding-top: 4px;
	padding-bottom: 4px;
	padding-left: 10px;
	padding-right: 10px;
}

.datalist tr.altrow {
	background-color: #c7e5ff; /* 隔行变色 */
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>


	<%
		if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
			out.println("<script >alert('" + request.getAttribute("result")
					+ "');</script>"); //页面显示提示信息    	
		}

		//查询所有文件信息
	%>
<div class="alert alert-light" style="font-size:20px;height=20px;text-align:center;">所有文件</div>
	<table class="table table-hover table-striped table-bordered">
		<tr>
			<th style="width: 6%;">序号</th>
			<th>文件名</th>
			<th>上传日期</th>
			<th>上传时间</th>
			<th>路径</th>
			<th>下载</th>
		</tr>


		<%
			FileDAO dao = new FileDAO();
			ArrayList<Map<String, String>> files = dao.queryAll();
			int i=0;

			for (Map<String, String> file : files) {
				
			%>
		<tr>
			<td style="width: 6%;"><%=++i %></td>
			<td><%=file.get("filename") %></td>
			<td><%=file.get("date") %></td>
			<td><%=file.get("time") %></td>
			<td><%=file.get("path") %></td>
			<td><a href='download?filename=<%=URLEncoder.encode(file.get("filename"), "UTF-8") %>'>下载文件</a></td>
		</tr>
			<%
			}
		%>
		
	</table>
	
	<div style="text-align:left;height:25px;"><a href="index.jsp">上传文件</a></div>

	
</body>
</html>
