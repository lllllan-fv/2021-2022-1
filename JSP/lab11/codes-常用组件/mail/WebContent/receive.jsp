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
    //String password="34c3e478dc913e25";//��Ȩ��
	//����SMTP����������
	int n =mail.indexOf('@');
	int m=mail.length() ;
	String mailserver ="pop3."+mail.substring(n+1,m);
	//1�������ʼ��������Ĳ�������
    Properties props = new Properties();
    //���ô���Э��
    props.setProperty("mail.store.protocol", "pop3");
    //�����ռ��˵�POP3������
    props.setProperty("mail.pop3.host", mailserver);
    //2��������������Ӧ�ó�������Ļ�����Ϣ�� Session ����
    Session sess = Session.getInstance(props);    
    Store store = sess.getStore("pop3");
    //�����ռ���POP3������
    store.connect(mailserver, mail, password);
    //����û����ʼ��˻���ע��ͨ��pop3Э���ȡĳ���ʼ��е�����ֻ��Ϊinbox
    Folder folder = store.getFolder("inbox");
    //���ö��ʼ��˻��ķ���Ȩ��
    folder.open(Folder.READ_ONLY);
    //�õ��ʼ��˻��������ʼ���Ϣ
    Message [] messages = folder.getMessages();
    for(int i = 0 ; i < messages.length ; i++){
        //����ʼ�����
        String subject = messages[i].getSubject();
        //����ʼ�������
        Address[] from = messages[i].getFrom();
        //��ȡ�ʼ����ݣ������ʼ����ݵ�html���룩
        String content = (String) messages[i].getContent();
        
%>
<%="From:"+from[0] %><br>
<%="Subject:"+subject %><br>
<%="Content:"+content %><br>
<hr>
<%
    }
     
    //�ر��ʼ��ж���
    folder.close(true);
    //�ر����Ӷ���
    store.close();
}catch(Exception e){
	e.printStackTrace();
}

%>
