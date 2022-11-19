/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package EditBooks;

import Signup.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

/**
 *
 * @author Hritik
 */
public class EditBooks extends HttpServlet {

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
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            String id = request.getParameter("id").toString();
            out.println("${id}");

            Class.forName("com.mysql.jdbc.Driver");
//        Connection con = DriverManager.getConnection();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
            out.print("Databse connected");
            pst = con.prepareStatement("UPDATE `books` SET (?,?,?,?,?) WHERE id=");
//            User loginBean = new User();
//            HttpSession ses = request.getSession();
//            User user = (User) ses.getAttribute("user");
//        ResultSet rs = pst.executeQuery();
//            BooksBean books = new BooksBean(title, description, author);
            Random ran = new Random();
            pst.setString(1, title);
            pst.setString(2, description);
            pst.setString(3, author);
//              pst.setString(4, 3);

            pst.setString(4, id);
            pst.setString(5, price);
//            pst.setString(6, id);

            pst.executeUpdate();
            pst.close();

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
