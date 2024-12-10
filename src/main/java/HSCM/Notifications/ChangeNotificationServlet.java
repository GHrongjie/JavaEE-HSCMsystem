package HSCM.Notifications;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/changeNotifications")
public class ChangeNotificationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type= Integer.parseInt(req.getParameter("changeType"));
        System.out.println("changeType:"+type);
        String userID= (String) req.getSession().getAttribute("SESSIONID");

        switch (type)
        {
            case 1://发布系统通知
                String noticeContent=req.getParameter("sysNoticeContent");
                if(noticeContent.isEmpty()){
                    resp.sendRedirect("creatNotification.jsp");break;
                }
                ChangeNotificationService.createSysNotification(userID,noticeContent);
                resp.sendRedirect("systemNotification.jsp");break;
            case 2://删除发布的系统通知
                String noteID=req.getParameter("notificationID");
                ChangeNotificationService.delSelfNotifications(noteID);
                resp.sendRedirect("delSysNotifications.jsp");break;
            case 3://发布班级通知
                String cnoticeContent=req.getParameter("classNoticeContent");
                if(cnoticeContent.isEmpty()){
                    resp.sendRedirect("creatNotification.jsp");break;
                }
                String className= (String) req.getSession().getAttribute("IntoClass");
                String creator= (String) req.getSession().getAttribute("IntoClassCreator");
                ChangeNotificationService.createClassNotification(userID,cnoticeContent,className,creator);
                resp.sendRedirect("classNotification.jsp");break;
            case 4://删除发布的班级通知
                String cnoteID=req.getParameter("notificationID");
                ChangeNotificationService.delSelfClassNotifications(cnoteID);
                resp.sendRedirect("delClassNotifications.jsp");break;
        }
    }
}
