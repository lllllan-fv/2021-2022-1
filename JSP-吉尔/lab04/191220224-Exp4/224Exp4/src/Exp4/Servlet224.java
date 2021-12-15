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

@WebServlet("/Servlet224")
public class Servlet224 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String data1 = request.getParameter("data1");
        String data2 = request.getParameter("data2");
        String data3 = request.getParameter("data3");
        String data4 = request.getParameter("data4");
        String data5 = request.getParameter("data5");
        String data6 = request.getParameter("data6");

        String calType = request.getParameter("calType");

        List<Double> list = new ArrayList<>();
        list.add(Double.valueOf(data1));
        list.add(Double.valueOf(data2));
        list.add(Double.valueOf(data3));
        list.add(Double.valueOf(data4));
        list.add(Double.valueOf(data5));
        list.add(Double.valueOf(data6));
        DataList224 dataList224 = new DataList224(list);

        HttpSession session = request.getSession();
        session.setAttribute("list", dataList224);
        session.setAttribute("type", calType);
        session.setAttribute("string", "0");

        response.sendRedirect("191220224-showResult.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
