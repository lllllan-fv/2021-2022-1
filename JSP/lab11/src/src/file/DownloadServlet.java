package file;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DownloadServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("filename");
        name = this.getServletContext().getRealPath("/upload/" + name);
        FileInputStream fileInputStream = new FileInputStream(name);

        String fileName = name.substring(name.lastIndexOf("\\") + 1);
        response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));

        int len = 0;
        byte[] bytes = new byte[1024];
        ServletOutputStream servletOutputStream = response.getOutputStream();
        while ((len = fileInputStream.read(bytes)) > 0) {
            servletOutputStream.write(bytes, 0, len);
        }
        servletOutputStream.close();
        fileInputStream.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
