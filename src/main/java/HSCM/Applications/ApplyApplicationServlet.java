package HSCM.Applications;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static HSCM.Applications.ApplyApplicationService.*;


@WebServlet("/changeApplications")
public class ApplyApplicationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type= Integer.parseInt(req.getParameter("changeType"));
        System.out.println("changeType:"+type);

        switch (type)
        {
            case 1://是否修改用户身份为教师
                String tapplicationsID= req.getParameter("applicationId");
                String tapplyUsername= req.getParameter("applyUsername");
                String tifpass= req.getParameter("ifPass");
                changeIdentity(tapplicationsID,tapplyUsername,tifpass);
                resp.sendRedirect("reviewTeacherInfo.jsp");break;
            case 2://是否添加班级
                String capplicationsID=req.getParameter("applicationId");
                String capplyUsername=req.getParameter("applyUsername");
                String applyClassname=req.getParameter("applyClassname");
                String cifpass=req.getParameter("ifPass");
                addClass(capplicationsID,capplyUsername,applyClassname,cifpass);
                resp.sendRedirect("reviewClassInfo.jsp");break;
            case 3://是否添加班级成员
                String japplicationsID=req.getParameter("applicationId");
                String japplyUsername=req.getParameter("applyUsername");
                String japplyClassname=req.getParameter("applyClassname");
                String applyCreator=req.getParameter("applyCreator");
                String jifpass=req.getParameter("ifPass");
                addMember(japplicationsID,japplyUsername,japplyClassname,applyCreator,jifpass);
                resp.sendRedirect("reviewJoiner.jsp");break;
        }
    }
}
