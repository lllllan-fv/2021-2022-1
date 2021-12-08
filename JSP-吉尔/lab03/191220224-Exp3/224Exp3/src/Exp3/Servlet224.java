package Exp3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Servlet224")
public class Servlet224 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter printWriter = response.getWriter();

        Shop224.Item[] items = new Shop224.Item[6];
        for (int i = 0; i < 6; ++i) {
            String name = request.getParameter("name" + i);
            String price = request.getParameter("price" + i);
            String num = request.getParameter("num" + i);

            items[i] = new Shop224.Item(name, price, name);
        }

        Shop224 shop = new Shop224(items);

        HttpSession session = request.getSession();
        session.setAttribute("shop", shop);

//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("191220224-cart.jsp");
//        requestDispatcher.forward(request, response);

        response.sendRedirect("191220224-cart.jsp");

        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
