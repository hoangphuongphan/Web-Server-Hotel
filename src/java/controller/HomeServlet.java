/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AuthDAO;
import DAO.RoomDAO;
import DAO.ServiceDAO;
import controller.RoomDetailServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.RoomType;
import model.Service;

/**
 *
 * @author Admin
 */

@WebServlet("")
public class HomeServlet extends HttpServlet {

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

        String role = new AuthDAO().getValueCookie(request, response, "role");

        System.out.println("role" + role);
        if (role == null) {
            request.getRequestDispatcher("./pages/home/home.jsp").forward(request, response);
            return;
        }
        if (role.equals("CUSTOMMER")) {
            try {

                RoomDAO d = new RoomDAO();
                ServiceDAO s = new ServiceDAO();

                List<RoomType> listRoom = d.getAllRoomType();
                List<Service> listService = s.getList();

                System.out.println("list room" + listRoom);
                request.setAttribute("listRoom", listRoom);
                request.setAttribute("listService", listService);

            } catch (Exception ex) {
                Logger.getLogger(RoomDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.getRequestDispatcher("./pages/home/home.jsp").forward(request, response);
        } else if (role.equals("ADMIN")) {
            response.sendRedirect("/hotel/admin/dashboard");
        } else if (role.equals("EMPLOYEE")) {
            response.sendRedirect("/hotel/schedule");
        }

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
