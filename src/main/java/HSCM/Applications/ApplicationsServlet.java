package HSCM.Applications;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static HSCM.Applications.ApplicationsService.*;

@WebServlet("/applications")
public class ApplicationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type= Integer.parseInt(req.getParameter("reviewType"));
        System.out.println("reviewType:"+type);

        String userID= (String) req.getSession().getAttribute("SESSIONID");

        switch (type)
        {
            case 1://获取教师申请
                req.getSession().setAttribute("teacherApplications",getTeacherApplications());
                req.getSession().setAttribute(req.getParameter("tApplicationsState"),"1");break;
            case 2://获取班级申请
                req.getSession().setAttribute("classApplications",getClassApplications());
                req.getSession().setAttribute(req.getParameter("cApplicationsState"),"1");break;
            case 3://获取班级加入申请
                req.getSession().setAttribute("memberApplications",getJoinClassApplications(userID));
                req.getSession().setAttribute(req.getParameter("jApplicationsState"),"1");break;
        }
    }
}
