<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<title>������ͨ�ı���ʽ��E-mail</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" rel="stylesheet">
<script language="javascript">
function checkform(myform){
	for(i=0;i<myform.length;i++){
		if(myform.elements[i].value==""){
			alert(myform.elements[i].title+"����Ϊ�գ�");
			myform.elements[i].focus();
			return false;
		}
	}
}
</script>
</head>
<body>
<form name="form1" method="post" action="receive.jsp" onSubmit="return checkform(form1)">
<table width="649" height="454"  border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.jpg">
  <tr>
    <td width="67" height="109" background="Images/board_left.gif">&nbsp;</td>
    <td width="531" background="Images/board_left.gif">&nbsp;</td>
    <td width="51" background="Images/board_left.gif">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td height="247">&nbsp;</td>
    <td valign="top"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="16%" height="27" align="center">�����ַ��</td>
        <td width="84%" colspan="2" align="left"><input name="mail" type="text" id="to" size="60"></td>
      </tr>
      <tr>
        <td height="27" align="center">��&nbsp;&nbsp;�룺</td>
        <td colspan="2" align="left"><input name="password" type="password" id="password" size="60"></td>
      </tr>
      <tr>
      <tr>
        <td height="30" align="center">&nbsp;</td>
        <td height="40" align="right"><input name="Submit" type="submit" class="btn_grey" value="����">
          &nbsp;
          <input name="Submit2" type="reset" class="btn_grey" value="����">
          &nbsp;&nbsp;&nbsp;</td>
        <td align="left">&nbsp;</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr valign="top">
    <td height="48">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
