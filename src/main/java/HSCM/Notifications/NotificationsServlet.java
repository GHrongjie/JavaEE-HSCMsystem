package HSCM.Notifications;

import HSCM.Notifications.NotificationsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static HSCM.Notifications.NotificationsService.*;

@WebServlet("/notifications")
public class NotificationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type= Integer.parseInt(req.getParameter("NoticeType"));
        System.out.println("NoticeType:"+type);
        String userID= (String) req.getSession().getAttribute("SESSIONID");
        switch (type)
        {
            case 1://获取系统通知
                req.getSession().setAttribute("sysNotifications",getAllNotifications());
                req.getSession().setAttribute(req.getParameter("sysNoticesState"),"1");break;
            case 2://获取用户自己发布的系统通知
                req.getSession().setAttribute("mySysnotifications",getSelfNotifications(userID));
                req.getSession().setAttribute(req.getParameter("delSysNoticeState"),"1");break;
            case 3://获取班级通知
                String className= (String) req.getSession().getAttribute("IntoClass");
                String creator= (String) req.getSession().getAttribute("IntoClassCreator");
                req.getSession().setAttribute("classNotifications",getAllClassNotifications(className,creator));
                req.getSession().setAttribute(req.getParameter("classNoticesState"),"1");break;
            case 4://获取用户自己发布的班级通知
                String mclassName= (String) req.getSession().getAttribute("IntoClass");
                String mcreator= (String) req.getSession().getAttribute("IntoClassCreator");
                req.getSession().setAttribute("myClassnotifications",getSelfClassNotifications(userID,mclassName,mcreator));
                req.getSession().setAttribute(req.getParameter("delClassNoticeState"),"1");break;
        }
    }
}
