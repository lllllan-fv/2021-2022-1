package com.myupload.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7042756416806244618L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String adjunctname = null;
		String fileDir = getServletContext().getRealPath("/upload");
		System.out.println("fileDir: " + fileDir);
		// ָ���ϴ��ļ��ı����ַ
		String message = "�ļ��ϴ��ɹ�";
		String address = "";
		request.setCharacterEncoding("UTF-8");
		if (ServletFileUpload.isMultipartContent(request)) { // �ж��Ƿ����ϴ��ļ�
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(20 * 1024); // �����ڴ�������洢���ֽ���
			
			ServletFileUpload upload = new ServletFileUpload(factory); // �����µ��ϴ��ļ����

			int size = 5 * 1024 * 1024; // ָ���ϴ��ļ��Ĵ�С����
			List formlists = null; // ���������ϴ��ļ��ļ��϶���
			try {
				formlists = upload.parseRequest(request); // ��ȡ�ϴ��ļ�����
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator iter = formlists.iterator(); // ��ȡ������
			while (iter.hasNext()) {
				FileItem formitem = (FileItem) iter.next(); // ��ȡÿ���ϴ��ļ�
				if (!formitem.isFormField()) { // �ж��Ƿ�Ϊ�ļ��򣬺�����ͨ����
					String name = formitem.getName(); // ��ȡ�ϴ��ļ�������
					System.out.println("size:"+formitem.getSize());
					if (formitem.getSize() > size) { // ����ϴ��ļ����ڹ涨���ϴ��ļ��Ĵ�С
						message = "���ϴ����ļ�̫����ѡ�񲻳���2M���ļ�";		
						break; //�˳�����
					}
					String adjunctsize = new Long(formitem.getSize())
							.toString(); //��ȡ�ϴ��ļ��Ĵ�С
					if ((name == null) || (name.equals(""))
							&& (adjunctsize.equals("0"))) // ����ϴ��ļ�Ϊ��
						continue; // �˳�����
					adjunctname = name.substring(name.lastIndexOf("\\") + 1,
							name.length());
					address = fileDir + "\\" + adjunctname; // �����ϴ��ļ��ı����ַ
					File saveFile = new File(address); // �����ļ������ַ�������ļ�
					try {
						formitem.write(saveFile); // ���ļ�д����
						request.setAttribute("filepath", "upload/" + adjunctname);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		request.setAttribute("result", message); // ����ʾ��Ϣ������request������

		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("result.jsp"); // ������Ӧ���ص�ַ
		requestDispatcher.forward(request, response);
	}


}
