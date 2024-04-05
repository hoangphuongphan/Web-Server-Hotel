/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.RoomDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.RoomType;

/**
 *
 * @author VINHNQ
 */
@WebServlet(name = "CreateServlet", urlPatterns = {"/manage/room/create"})
public class CreateServlet extends HttpServlet {

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/room/createForm.jsp");
            dispatcher.forward(request, response);
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
            // Get parameters from request
            String roomName = request.getParameter("roomName");
            String description = request.getParameter("description");
            String overview = request.getParameter("overview");
            String featured = request.getParameter("featured");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int price = Integer.parseInt(request.getParameter("price"));
            String thumbnail = request.getParameter("thumbnail");
            
            // Create a new RoomType object
            RoomType newRoomType = new RoomType();
            newRoomType.setRoomName(roomName);
            newRoomType.setDescription(description);
            newRoomType.setOverview(overview);
            newRoomType.setFeatured(featured);
            newRoomType.setQuantity(quantity);
            newRoomType.setCapacity(capacity);
            newRoomType.setPrice(price); // Cast to int for this example
            newRoomType.setThumbnail(thumbnail);
            
            // Initialize your DAO class here
            RoomDAO roomDao = new RoomDAO();
            boolean result = roomDao.addRoomType(newRoomType);
            
            // Redirect or forward based on result
            if (result) {
                response.sendRedirect("/hotel/manage/room "); // Redirect to a success page
            } else {
                request.getRequestDispatcher("/admin/room/createForm.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
