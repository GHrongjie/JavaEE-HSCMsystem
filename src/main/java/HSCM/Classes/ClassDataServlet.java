package HSCM.Classes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static HSCM.Classes.ClassDataService.*;

@WebServlet("/classData")
public class ClassDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取班级信息
        String userID= (String) req.getSession().getAttribute("SESSIONID");

        req.getSession().setAttribute("classData",getUserClasses(userID));
        req.getSession().setAttribute(req.getParameter("classDataState"),"1");
    }
}
