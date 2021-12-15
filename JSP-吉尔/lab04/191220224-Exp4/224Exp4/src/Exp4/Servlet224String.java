package Exp4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Servlet224String")
public class Servlet224String extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String data = request.getParameter("data");
        String calType = request.getParameter("calType");

        String[] split = data.split(",");
        List<Double> list = new ArrayList<>();
        for (String s : split) {
            list.add(Double.valueOf(s));
        }
        DataList224 dataList224 = new DataList224(list);

        HttpSession session = request.getSession();
        session.setAttribute("list", dataList224);
        session.setAttribute("type", calType);
        session.setAttribute("string", "1");

        response.sendRedirect("191220224-showResult.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
