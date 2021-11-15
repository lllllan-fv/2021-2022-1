package db;

import bean.Info;
import bean.InfoList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/selectServlet")
public class selectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("数据库驱动加载成功");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab10", "root", "root");
            System.out.println("数据库连接成功");

            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            String sql = "select * from info";
            ResultSet rs = stmt.executeQuery(sql);

            List<Info> list = new ArrayList<>();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String education = rs.getString("education");
                String hobby = rs.getString("hobby");
                String introduction = rs.getString("introduction");

                Info info = new Info(id, name, age, sex, education, hobby, introduction);
                list.add(info);
            }

            InfoList infoList = new InfoList(list);

            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();

            HttpSession session = request.getSession();
            session.setAttribute("list", infoList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("listInfos.jsp");
            requestDispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {

        }
    }
}
