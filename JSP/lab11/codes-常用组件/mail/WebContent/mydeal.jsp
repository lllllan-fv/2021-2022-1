<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%
try{
	request.setCharacterEncoding("gb2312");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	String subject=request.getParameter("subject");
	String messageText=request.getParameter("content");
    String password=request.getParameter("password");
	//����SMTP����������
	int n =from.indexOf('@');
	int m=from.length() ;
	String mailserver ="smtp."+from.substring(n+1,m);
    //String mailserver="wanggh";    
    //�����ʼ��Ự
	Properties pro=new Properties();
    pro.put("mail.smtp.host",mailserver);
    pro.put("mail.smtp.auth","true");
    Session sess=Session.getInstance(pro);
    sess.setDebug(true);
    //�½�һ����Ϣ����
    MimeMessage message=new MimeMessage(sess);
    //���÷�����
    InternetAddress from_mail=new InternetAddress(from);
    message.setFrom(from_mail);
   //�����ռ���
    InternetAddress to_mail=new InternetAddress(to);
    message.setRecipient(Message.RecipientType.TO ,to_mail);
    //��������
    message.setSubject(subject);
   //��������
   message.setText(messageText);
   //���÷���ʱ��
   message.setSentDate(new Date());
   //�����ʼ�
   message.saveChanges();  //��֤��ͷ��ͬ�Ự���ݱ���һ��
   Transport transport =sess.getTransport("smtp");
   transport.connect(mailserver,from,password);
   transport.sendMessage(message,message.getAllRecipients());
   transport.close();
   out.println("<script language='javascript'>alert('�ʼ��ѷ��ͣ�');window.location.href='sendmail.jsp';</script>");
}catch(Exception e){
	System.out.println("�����ʼ������Ĵ���"+e.getMessage());
	out.println("<script language='javascript'>alert('�ʼ�����ʧ�ܣ�');window.location.href='sendmail.jsp';</script>");
}
%>
