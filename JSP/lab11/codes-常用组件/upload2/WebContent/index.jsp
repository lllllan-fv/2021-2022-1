<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>应用commons-fileUpload实现文件上传</title>
<style type="text/css">
ul{list-style: none;}
li{padding:5px;}
</style>
</head>
<body>
	<script type="text/javascript">
		function validate() {
			if (form1.file.value == "") {
				alert("请选择要上传的文件");
				return false;
			}
		}
	</script>
	<!-- 定义表单 -->
	<form action="UploadServlet" method="post"
		enctype="multipart/form-data" name="form1" id="form1"
		onsubmit="return validate()">
		<ul>
		<li>文件说明：<input type="text" size="20" name="intro"></li>
			<li>请选择要上传的附件：</li>
			<li>上传文件： <input type="file" name="file1" /> <!-- 文件上传组件 --></li>
			<li>上传文件： <input type="file" name="file2" /> <!-- 文件上传组件 --></li>

			<li><input type="submit" name="Submit" value="上传" /> <input
							type="reset" name="Submit2" value="重置" /></li>
		</ul>
	</form>
</body>
</html>
