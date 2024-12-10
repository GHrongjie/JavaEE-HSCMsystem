package HSCM.LoginRegister;

import DataClass.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import static HSCM.LoginRegister.LoginRegisterService.searchInfo;

@WebServlet("/getIdentity")
public class GetUserIdentityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username= (String) req.getSession().getAttribute("SESSIONID");

        List<User> user= (List<User>) searchInfo(username,0);

        req.getSession().setAttribute("identity",user.get(0).getIdentity());
    }
}
