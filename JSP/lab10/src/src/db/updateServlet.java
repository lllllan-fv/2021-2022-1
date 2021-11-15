package db;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("_id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        String[] hobbies = request.getParameterValues("hobbies");
        String education = request.getParameter("education");
        String introduction = request.getParameter("introduction");

        String hobby = "";
        for (String s : hobbies) hobby += " " + s;
        hobby = hobby.trim();
        hobby = hobby.replaceAll(" ", ", ");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("数据库驱动加载成功");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab10", "root", "root");
            System.out.println("数据库连接成功");

            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            String sql = "update info set name='" + name + "', " +
                    "age=" + age + ", sex='" + sex + "', hobby='" + hobby + "', " +
                    "education='" + education + "', introduction='" + introduction + "'" +
                    "where id=" + id;
            stmt.executeUpdate(sql);

            if (stmt != null) stmt.close();
            if (conn != null) conn.close();

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("selectServlet");
            requestDispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
