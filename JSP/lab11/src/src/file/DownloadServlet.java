package file;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DownloadServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("filename");
        String n = URLDecoder.decode(fname, "UTF-8");

        String fullFilePath = this.getServletContext().getRealPath("/upload") + "/" + fname;

        File file = new File(fullFilePath);


        if (file.exists()) {
            System.out.println("File exists!");
            String filename = URLEncoder.encode(file.getName(), "UTF-8");
            response.reset();
            response.setContentType("application/x-msdownloade");
            response.addHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
            int fileLength = (int) file.length();
            response.setContentLength(fileLength);
            //如果文件长度大于0
            if (fileLength != 0) {
                //创建输入流
                InputStream inStream = new FileInputStream(file);
                byte[] buf = new byte[4096];
                //*创建输出流
                ServletOutputStream servletOS = response.getOutputStream();
                int readLength;
                while ((readLength = inStream.read(buf)) != -1) {
                    servletOS.write(buf, 0, readLength);
                }
                inStream.close();
                servletOS.flush();
                servletOS.close();
            }
        }

    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
