<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%
if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
	out.println("<script >alert('" + request.getAttribute("result") + "');</script>"); //页面显示提示信息
	String intro = (String) request.getAttribute("intro");
	out.println(intro + "<br>");
	ArrayList files = (ArrayList) request.getAttribute("files");
%>
<%
	Iterator iter = files.iterator();
	String filePath = null;
	String fileName = null;
	//String fileName_video=null;
	//String fileName_pic=null;
	if (iter != null) {
		while (iter.hasNext()) {
			filePath = (String) iter.next();
			fileName = filePath.substring(filePath.lastIndexOf('/') + 1);
			int index = fileName.lastIndexOf('.');
			if (index > 0) {
				fileName = fileName.substring(0, index);
			}

%>
		<a href="<%=filePath%>">下载文件:<%=fileName%></a>
		<br>
<%
		}
	}
%>

	<br>
	<br>
	<a href="index.jsp">上传文件</a>
<%
}
%>