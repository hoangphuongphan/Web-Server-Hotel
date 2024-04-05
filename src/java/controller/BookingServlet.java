/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AuthDAO;
import DAO.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Booking;

/**
 *
 * @author Admin
 */
public class BookingServlet extends HttpServlet {

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
        
        boolean auth = new AuthDAO().authenticate(request, response);

        if (!auth) {
            request.getRequestDispatcher("/pages/access/login.jsp").forward(request, response);
            return;
        }
        String inputInDate = request.getParameter("InDate");
        String inputOutDate = request.getParameter("OutDate");
        
        request.setAttribute("checkInDate", inputInDate);
        request.setAttribute("checkOutDate", inputOutDate);
        
        request.getRequestDispatcher("/pages/booking/booking.jsp").forward(request, response);

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

        String userID = new AuthDAO().getValueCookie(request, response, "user_id");

        if (userID == null) {
            response.sendRedirect("/hotel/login");
            return;
        }

  
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String checkInDateStr = request.getParameter("inDate");
        String checkOutDateStr = request.getParameter("outDate");
        String[] roomNumbers = request.getParameter("selectedRoomNumbers").split(",");

        try {
            System.out.println("checkInDateStr: " + checkInDateStr + "checkOutDateStr" + checkOutDateStr);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = dateFormat.parse(checkInDateStr);
            Date checkOutDate = dateFormat.parse(checkOutDateStr);

            int userIdParse = Integer.parseInt(userID);
            System.out.println("user_id" + userIdParse);

            // Lưu thông tin vào cơ sở dữ liệu
            Booking booking = new Booking();
            booking.setCustomer_name(name);
            booking.setCustomer_address(address);
            booking.setCustomer_phone(phone);
            booking.setCustomer_email(email);
            booking.setCheckInDate(checkInDate);
            booking.setCheckOutDate(checkOutDate);
            booking.setUserId(userIdParse);

            for (String roomNumber : roomNumbers) {
                if (!roomNumber.isEmpty() && roomNumber.matches("\\d+")) {
                    booking.addRoomId(Integer.parseInt(roomNumber.trim()));
                }
            }

            BookingDAO bookingDAO = new BookingDAO();

            bookingDAO.AddBookings(booking);
            bookingDAO.closeConnection();

            // Gửi thông tin đến trang kết quả
            request.setAttribute("name", name);
            request.setAttribute("roomNumbers", roomNumbers);
            request.getRequestDispatcher("/pages/booking/confirm.jsp").forward(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
