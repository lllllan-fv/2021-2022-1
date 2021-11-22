<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%
try{
	request.setCharacterEncoding("gb2312");
	String mail=request.getParameter("mail");
    String password=request.getParameter("password");
    //String password="34c3e478dc913e25";//授权码
	//生成SMTP的主机名称
	int n =mail.indexOf('@');
	int m=mail.length() ;
	String mailserver ="pop3."+mail.substring(n+1,m);
	//1、连接邮件服务器的参数配置
    Properties props = new Properties();
    //设置传输协议
    props.setProperty("mail.store.protocol", "pop3");
    //设置收件人的POP3服务器
    props.setProperty("mail.pop3.host", mailserver);
    //2、创建定义整个应用程序所需的环境信息的 Session 对象
    Session sess = Session.getInstance(props);    
    Store store = sess.getStore("pop3");
    //连接收件人POP3服务器
    store.connect(mailserver, mail, password);
    //获得用户的邮件账户，注意通过pop3协议获取某个邮件夹的名称只能为inbox
    Folder folder = store.getFolder("inbox");
    //设置对邮件账户的访问权限
    folder.open(Folder.READ_ONLY);
    //得到邮件账户的所有邮件信息
    Message [] messages = folder.getMessages();
    for(int i = 0 ; i < messages.length ; i++){
        //获得邮件主题
        String subject = messages[i].getSubject();
        //获得邮件发件人
        Address[] from = messages[i].getFrom();
        //获取邮件内容（包含邮件内容的html代码）
        String content = (String) messages[i].getContent();
        
%>
<%="From:"+from[0] %><br>
<%="Subject:"+subject %><br>
<%="Content:"+content %><br>
<hr>
<%
    }
     
    //关闭邮件夹对象
    folder.close(true);
    //关闭连接对象
    store.close();
}catch(Exception e){
	e.printStackTrace();
}

%>
