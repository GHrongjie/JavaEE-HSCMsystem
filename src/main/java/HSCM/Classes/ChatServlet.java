package HSCM.Classes;

import DataClass.ChatData;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static HSCM.Classes.ChatService.*;

@WebServlet("/chatData")
public class ChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String chatType= (String) req.getSession().getAttribute("chatType");
        System.out.println("chatType:"+chatType);

        resp.setContentType("text/html;charset=UTF-8");
        List<ChatData> ChatData = null;
        String className= (String) req.getSession().getAttribute("IntoClass");
        String creator=(String) req.getSession().getAttribute("IntoClassCreator");

        switch (chatType){
            case "1"://获取班级聊天信息
                ChatData= (List<DataClass.ChatData>) getClassChatHistory(className,creator);break;
            case "2"://获取个人对话信息
                String userID= (String) req.getSession().getAttribute("SESSIONID");
                String tarMember= (String) req.getSession().getAttribute("selectMember");

                ChatData= (List<DataClass.ChatData>) getMemberChatHistory(userID,tarMember,className,creator);break;
        }
        if (ChatData != null) {
            PrintWriter out = resp.getWriter();
            for (ChatData item : ChatData) {
                out.println("<li><span class=\"speaker\">[" + item.getSpeaker() + "]: </span>"
                        + "<span class=\"content\">" + item.getContent() + "</span></li>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String chatType = (String) req.getSession().getAttribute("chatType");
        System.out.println("chatType:" + chatType);

        String userID = (String) req.getSession().getAttribute("SESSIONID");
        String className = (String) req.getSession().getAttribute("IntoClass");
        String creator = (String) req.getSession().getAttribute("IntoClassCreator");
        String content = req.getParameter("message");
        if (chatType.equals("2")) {
            String tarMember = (String) req.getSession().getAttribute("selectMember");
            sendMessage(chatType,userID,tarMember,content,className,creator);
        } else {
            sendMessage(chatType, userID, null, content, className, creator);
        }
    }
}
