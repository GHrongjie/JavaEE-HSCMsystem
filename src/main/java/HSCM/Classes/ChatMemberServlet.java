package HSCM.Classes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static HSCM.Classes.ChatMemberService.*;

@WebServlet("/chatMember")
public class ChatMemberServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取聊天对象列表
        String className= (String) req.getSession().getAttribute("IntoClass");
        String creator=(String) req.getSession().getAttribute("IntoClassCreator");
        String userID= (String) req.getSession().getAttribute("SESSIONID");
        String identity= (String) req.getSession().getAttribute("identity");

        req.getSession().setAttribute("chatMembers",getClassChatMember(className,creator,userID,identity));
        req.getSession().setAttribute(req.getParameter("chatMemberState"),"1");
    }
}
