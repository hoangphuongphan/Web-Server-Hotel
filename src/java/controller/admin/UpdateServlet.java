/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.RoomDAO;
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
@WebServlet(name = "UpdateServlet", urlPatterns = {"/manage/updateRoom"})
public class UpdateServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            
            String idStr = request.getParameter("id");
            int id = 0;
            
            // Validate the id parameter before parsing
            if (idStr != null && !idStr.isEmpty()) {
                try {
                    id = Integer.parseInt(idStr);
                } catch (NumberFormatException e) {
                    // Handle the case where id is not a valid integer
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid room type ID format.");
                    return; // Stop further execution
                }
            } else {
                // Handle the case where id parameter is missing
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Room type ID is required.");
                return; // Stop further execution
            }
            
            RoomDAO dao = new RoomDAO();
            RoomType roomType = dao.getRoomTypeByID(id);
            
            if (roomType != null) {
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("/admin/room/update.jsp").forward(request, response);
            } else {
                  request.getRequestDispatcher("/admin/room/room.admin.jsp").forward(request, response);
//                response.sendRedirect("/hotel/manage/room");
            }   } catch (Exception ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        request.setCharacterEncoding("UTF-8");
        try {
            
            int id = Integer.parseInt(request.getParameter("id"));
            String roomName = request.getParameter("roomName");
            String description = request.getParameter("description");
            String overview = request.getParameter("overview");
            String featured = request.getParameter("featured");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int price =  Integer.parseInt(request.getParameter("price")); 
            String thumbnail = request.getParameter("thumbnail");

           
            RoomType roomType = new RoomType(id, roomName, description, overview, featured, price, quantity, capacity, thumbnail);

            RoomDAO dao = new RoomDAO();
            boolean updateResult = dao.updateRoomType(roomType);

            if (updateResult) {
                response.sendRedirect("/hotel/manage/room");
            } else {
                // Trả về một thông báo lỗi hoặc trang lỗi nếu cập nhật không thành công
                response.getWriter().println("Failed to update the room type. Please try again.");
            }
        } catch (NumberFormatException e) {
            // Xử lý lỗi khi chuyển đổi số
            response.getWriter().println("Error in input format: " + e.getMessage());
        } catch (IOException e) {
            // Xử lý các ngoại lệ khác
            response.getWriter().println("An error occurred: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
