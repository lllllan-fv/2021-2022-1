<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%

	if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
		out.println("<script >alert('" + request.getAttribute("result")
				+ "');</script>"); //页面显示提示信息
	}	
	String filePath = (String) request.getAttribute("filepath");

	if(filePath!=null){
		
		String fileName=filePath.substring(filePath.lastIndexOf("/"));

%>
<a href="<%=filePath%>">下载文件:<%=fileName %></a><br>
<%
	}
%>

<br>
<br>
<a href="index.jsp">上传文件</a>
