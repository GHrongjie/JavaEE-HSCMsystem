package HSCM.LoginRegister;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int type = LoginRegisterService.addInfo(username, password);

        String Reason = null;
        if(username.isEmpty()||password.isEmpty()){
            Reason = "wrongReturn.jsp?reason=Username or password can not be NULL!";
            resp.sendRedirect(Reason);
        }else{
            switch (type) {
                case 0://注册成功
                    Reason = "wrongReturn.jsp?reason=Register successful!";
                    resp.sendRedirect(Reason);
                    break;
                case 1://注册失败
                    Reason = "wrongReturn.jsp?reason=" + username + " has been rigistered!";
                    resp.sendRedirect(Reason);
                    break;
            }
        }

    }
}
