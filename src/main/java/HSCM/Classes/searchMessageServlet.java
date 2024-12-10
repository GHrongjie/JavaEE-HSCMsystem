package HSCM.Classes;

import DataClass.ChatData;
import DataClass.ClassNotification;
import DataClass.SearchParameter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static HSCM.Classes.searchMessageService.searchMessage;

@WebServlet("/searchMessage")
public class searchMessageServlet extends HttpServlet {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID= (String) req.getSession().getAttribute("SESSIONID");
        SearchParameter searchParameter=new SearchParameter();

        searchParameter.setNoticeType(req.getParameter("noticeType"));
        searchParameter.setMessageType(req.getParameter("messageType"));

        searchParameter.setClassName(req.getParameter("className"));
        searchParameter.setClassCreator(req.getParameter("classCreator"));
        searchParameter.setFromdate(req.getParameter("fromdate"));
        searchParameter.setTodate(req.getParameter("todate"));
        searchParameter.setContent(req.getParameter("content"));
        searchParameter.setWho(req.getParameter("who"));

        if(searchParameter.getNoticeType().equals("班级通知")){
            List<ClassNotification> res1= (List<ClassNotification>) searchMessage(userID,searchParameter);
            if (res1 != null) {
                PrintWriter out = resp.getWriter();
                for (ClassNotification item : res1) {
                    out.println("<li>" +
                            "<div class=\"notification-header\">教师：" + item.getNotifierId()+"</div>" +
                            "<div class=\"notification-date\">时间："+ item.getDate()+"</div>" +
                            "<div class=\"notification-content\">内容："+ item.getContent()+"</div></li>");
                }
            }
        }else if(searchParameter.getNoticeType().equals("站内信息")){
            List<ChatData> res2= (List<ChatData>) searchMessage(userID,searchParameter);
            if (res2 != null) {
                PrintWriter out = resp.getWriter();
                if(searchParameter.getMessageType().equals("群聊")){
                    for (ChatData item : res2) {
                        out.println("<li><span class=\"speaker\">[" + item.getSpeaker() + "]: </span>"
                                + "<span class=\"content\">" + item.getContent() + "</span></li>");
                    }
                }
                else{
                    for (ChatData item : res2) {
                        out.println("<li><span class=\"speaker\">"+"[" + item.getSpeaker() + "]"+"to"+"[" + item.getReciver() + "]: </span>"
                                + "<span class=\"content\">" + item.getContent() + "</span></li>");
                    }
                }
            }
        }
    }
}
