/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Login;

import Signup.User;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Login.LoginDao;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
//    private static final long serialVersionUID = 1 L;

    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("email");
        String password = request.getParameter("password");
                String name = request.getParameter("name");
                
//                String 

//    Connection con = 

        User loginBean = new User(username,password);
        out.println(loginBean);
        loginBean.setEmail(username);
        loginBean.setPassword(password);


        try {
            if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
                 session.setAttribute("user",loginBean);
                out.println("Hello");
                response.sendRedirect("homepage.jsp");

            } else {
                                    out.println("Hello");

                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        }
    }
}
