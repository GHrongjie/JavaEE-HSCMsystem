package HSCM.LoginRegister;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(
        name = "loginServlet",
        urlPatterns = {"/login"},
        loadOnStartup = 1
)
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        req.getSession().invalidate();
        int loginType= Integer.parseInt(req.getParameter("loginType"));

        //System.out.println(username+" "+password+" "+loginType);

        int checkInfo= LoginRegisterService.checkInfo(username,password,loginType);

        String wrongReason=null;
        switch (checkInfo)
        {
            case 0://未注册
                wrongReason="wrongReturn.jsp?reason=The user has not Register!";
                resp.sendRedirect(wrongReason);break;
            case 1://密码错误
                wrongReason="wrongReturn.jsp?reason=PassWord is wrong!";
                resp.sendRedirect(wrongReason);break;
            case 2:
                req.getSession().setAttribute("SESSIONID",username);
                if(loginType==0){//登录普通用户
                    resp.sendRedirect("userMain.jsp");
                }else//登录管理员
                    resp.sendRedirect("managerMain.jsp");
                break;
        }

    }

}
