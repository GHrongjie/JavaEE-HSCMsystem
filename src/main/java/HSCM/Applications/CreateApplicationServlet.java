package HSCM.Applications;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static HSCM.Applications.CreateApplicationService.*;

@WebServlet("/createApplication")
public class CreateApplicationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type= Integer.parseInt(req.getParameter("applicationType"));
        System.out.println("applicationType:"+type);

        switch (type)
        {
            case 1://创建教师申请
                String username=req.getParameter("username");
                String reason=req.getParameter("reason");
                createTeacherApplication(username,reason);
                resp.sendRedirect("userMain.jsp");break;
            case 2://创建班级加入申请
                String jusername=req.getParameter("username");
                String jclassName=req.getParameter("className");
                String creator=req.getParameter("creator");
                String identity= (String) req.getSession().getAttribute("identity");
                boolean jres=createJoinApplication(jusername,identity,jclassName,creator);
                if(jres){
                    resp.sendRedirect("classList.jsp");break;
                }else{
                    resp.sendRedirect("application.jsp");break;
                }
            case 3://创建新班级申请
                String cusername=req.getParameter("username");
                String className=req.getParameter("className");
                if(className.isEmpty()){
                    resp.sendRedirect("application.jsp");break;
                }
                boolean cres=createClassApplication(cusername,className);
                if(cres){
                    resp.sendRedirect("classList.jsp");break;
                }else{
                    resp.sendRedirect("application.jsp");break;
                }
        }
    }
}
