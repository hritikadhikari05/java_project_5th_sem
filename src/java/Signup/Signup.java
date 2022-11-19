/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Signup;

import java.io.IOException;
import java.sql.*;
import Signup.User;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import java.util.UUID;

/**
 *
 * @author Hritik
 */
public class Signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {   
            PrintWriter out = response.getWriter();
            PreparedStatement pst;
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String key = UUID.randomUUID().toString();
//            out.println("email" + email + " " + "password:" + password);
            Class.forName("com.mysql.jdbc.Driver");
//        Connection con = DriverManager.getConnection();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
            out.print("Databse connected");
            pst = con.prepareStatement("insert into user values(?,?,?,?,?)");
//        ResultSet rs = pst.executeQuery();
            User user = new User(email, password, name,"user");
//        out.println(user.email);
//            Random ran = new Random();

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
//              pst.setString(4, 3);

            pst.setString(4, key);
            pst.setString(5, "user");

            pst.executeUpdate();
            pst.close();
//out.println(ran.nextInt());
            out.println("\nSucessfully inserted");

            HttpSession ss = request.getSession();
            ss.setAttribute("user", user);

            response.sendRedirect("homepage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
