package au.id.wangchaoyi.web.servlet;

import au.id.wangchaoyi.domain.User;
import au.id.wangchaoyi.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String verifycode = request.getParameter("verifycode");

        HttpSession session = request.getSession();
        String checkcodeServer = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");

        if (!checkcodeServer.equalsIgnoreCase(verifycode)){
            request.setAttribute("login_msg","Verify Code not Correct!");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }

        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        UserServiceImpl service = new UserServiceImpl();
        User loginUser = (User) service.login(user);
        if (loginUser != null){
            session.setAttribute("user", loginUser);
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else{
            request.setAttribute("login_msg","Username or Password not Correct!");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
