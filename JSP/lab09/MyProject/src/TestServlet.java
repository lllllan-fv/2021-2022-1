import bean.Info;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String[] hobbies = request.getParameterValues("hobbies");
        String education = request.getParameter("education");
        String introduction = request.getParameter("introduction");

//        HttpSession session = request.getSession();
//        bean.Info info = (bean.Info) session.getAttribute("info");

        Info info = new Info();

        info.setName(name);
        info.setAge(age);
        info.setSex(sex);
        info.setHobbies(hobbies);
        info.setEducation(education);
        info.setIntroduction(introduction);

        HttpSession session = request.getSession();
        session.setAttribute("info", info);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("getInfo.jsp");
        requestDispatcher.forward(request, response);
    }
}
