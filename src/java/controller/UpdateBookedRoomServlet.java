package controller;

import DAO.AuthDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;
import model.Room;

public class UpdateBookedRoomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null && action.equals("update")) {

            try {
                int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
                String inDate = request.getParameter("inDate");
                String outDate = request.getParameter("outDate");
                UserDAO dao = new UserDAO();
                List<Room> rooms = dao.getAvailableRooms(roomTypeID, inDate, outDate);
                System.out.println("rooms" + rooms);

                request.setAttribute("rooms", rooms);

                request.getRequestDispatcher("/pages/booking/UpdateBookedRoom.jsp").forward(request, response);
                return;
            } catch (Exception ex) {
                Logger.getLogger(UpdateBookedRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.getRequestDispatcher("/pages/booking/MyRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        int booking_id = Integer.parseInt(request.getParameter("booking_id"));
        int roomID = Integer.parseInt(request.getParameter("roomNumber"));
        String customer_name = request.getParameter("customer_name");
        String customer_address = request.getParameter("customer_address");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");

        try {

            // Create a Bookings object with the updated information
            Booking booking = new Booking();
            booking.setBooking_id(booking_id);
            booking.setCustomer_name(customer_name);
            booking.setCustomer_address(customer_address);
            booking.setCustomer_phone(customer_phone);
            booking.setCustomer_email(customer_email);
            booking.setRoomID(roomID);
            // Update the booked room
            UserDAO d = new UserDAO();
            d.UpdateBookedRoom(booking);

            // Redirect to the StudentForm.jsp page after updating the student
            request.getRequestDispatcher("/pages/booking/MyRoom.jsp").forward(request, response);

        } catch (ClassNotFoundException | ParseException ex) {
            Logger.getLogger(UpdateBookedRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UpdateBookedRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
