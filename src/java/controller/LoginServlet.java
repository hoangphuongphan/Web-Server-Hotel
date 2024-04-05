/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccessDAO;
import model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

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
   
        request.getRequestDispatcher("/pages/access/login.jsp").forward(request, response);
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
        try {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
                request.setAttribute("errorMessage", "Missing Parameter");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/access/login.jsp");
                dispatcher.forward(request, response);

            }

            AccessDAO d = new AccessDAO();

            User user = d.authenticate(username, password, request, response);

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            Cookie userIDCookie = new Cookie("user_id", user.getID() + "");

            userIDCookie.setMaxAge(3600 * 24 * 30); // 1 month

            response.addCookie(userIDCookie);

            Cookie useNameCookie = new Cookie("username", user.getUsername());

            response.addCookie(useNameCookie);

            Cookie roleCookie = new Cookie("role", user.getRole());

            response.addCookie(roleCookie);

            Cookie isLoginCookie = new Cookie("isLogin", "true");
            isLoginCookie.setMaxAge(3600 * 24 * 30); 

            response.addCookie(isLoginCookie);
            String redirectURL;
            switch (user.getRole()) {
                case "CUSTOMER":
                    redirectURL = "/";
                    break;
                case "EMPLOYEE":
                    redirectURL = "/schedule";
                    break;
                case "ADMIN":
                    redirectURL = "/admin/dashboard";
                    break;
                default:
                    redirectURL = "/";
            }

            // handle redirect via ROLE of user
            response.sendRedirect(request.getContextPath() + redirectURL);

        } catch (Exception e) {

            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, e);
        }
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
