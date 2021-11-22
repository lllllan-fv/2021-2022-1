package file;

import db.FileDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import static java.lang.System.currentTimeMillis;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID = 7042756416806244618L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileDir = getServletContext().getRealPath("/upload");
        //检测目录是否存在，如果不存在就创建
        File dirUpload = new File(fileDir);
        if (!dirUpload.exists()) {
            dirUpload.mkdirs();
        }
        System.out.println("fileDir: " + fileDir);

        // 指定上传文件的保存地址
        String message = "文件上传成功";
        String address = "";
        String filename = null;
        String filepath = null;

        int i = 0;
        request.setCharacterEncoding("UTF-8");
        if (ServletFileUpload.isMultipartContent(request)) { // 判断是否是上传文件
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(20 * 1024); // 设置内存中允许存储的字节数
            ServletFileUpload upload = new ServletFileUpload(factory); // 创建新的上传文件句柄

            int size = 5 * 1024 * 1024; // 指定上传文件的大小
            List formList = null; // 创建保存上传文件的集合对象
            try {
                formList = upload.parseRequest(request); // 获取上传文件集合
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator iter = formList.iterator(); // 获取上传文件迭代器
            while (iter.hasNext()) {
                FileItem fileItem = (FileItem) iter.next(); // 获取每个上传文件
                if (!fileItem.isFormField()) { // 忽略不是上传文件的表单域
                    String name = fileItem.getName(); // 获取上传文件的名称
                    if (fileItem.getSize() > size) { // 如果上传文件大于规定的上传文件的大小
                        message = "您上传的文件太大，请选择不超过2M的文件";
                        break; // 退出程序
                    }
                    String fileSize = Long.toString(fileItem.getSize()); // 获取上传文件的大小
                    if ((name == null) || (name.equals("")) && (fileSize.equals("0"))) // 如果上传文件为空
                        continue; // 退出程序

                    filename = currentTimeMillis() + name.substring(name.lastIndexOf("."));
                    System.out.println(filename);

                    address = fileDir + "\\" + filename; // 创建上传文件的保存地址
                    File saveFile = new File(address); // 根据文件保存地址，创建文件
                    try {
                        fileItem.write(saveFile); // 向文件写数据
                        filepath = "upload/" + filename;

                        //保存到数据库
                        FileDAO dao = new FileDAO();
                        i = dao.insert(filename, filepath);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        if (i < 1) {
            message += "...文件信息保存失败";
        }

        request.setAttribute("result", message); // 将提示信息保存在request对象中

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp"); // 设置相应返回地址
        requestDispatcher.forward(request, response);
    }

    public void init() throws ServletException {
        // Put your code here
    }

}
