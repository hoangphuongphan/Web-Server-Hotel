/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import DB.SQLServerConnect;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Booking;
import model.Room;

/**
 *
 * @author Admin
 */
public class UserDAO extends SQLServerConnect {

    public UserDAO() throws Exception {
        this.connect();
    }

    public List<Room> getAvailableRooms(int roomTypeID, String checkInDate, String checkOutDate) {
        List<Room> availableRooms = new ArrayList<>();
        String SQL_QUERY
                = "SELECT R.roomID, R.name "
                + "FROM Room R "
                + "INNER JOIN RoomsType RT ON R.roomTypeID = RT.roomTypeID "
                + "WHERE R.isAvailable = 1 "
                + "AND RT.roomTypeID = ? "
                + "AND NOT EXISTS ( "
                + "    SELECT 1 "
                + "    FROM Booking B "
                + "    INNER JOIN BookingInfor BI ON B.booking_infor = BI.id "
                + "    WHERE B.room_id = R.roomID "
                + "    AND NOT (? < BI.check_in_date OR ? > BI.check_out_date) "
                + ")";
        try (PreparedStatement pstmt = connection.prepareStatement(SQL_QUERY)) {

            // Set parameters
            pstmt.setInt(1, roomTypeID);
            pstmt.setString(2, checkOutDate);
            pstmt.setString(3, checkInDate);

            // Execute query
            try (ResultSet rs = pstmt.executeQuery()) {
                // Process result set
                while (rs.next()) {

                    int roomID = rs.getInt("roomID");
                    String roomName = rs.getString("name");

                    // Create Room object
                    Room room = new Room(roomID, roomTypeID, roomName);
                    availableRooms.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exception properly
        }

        return availableRooms;
    }

    public List<Booking> getMyRooms(String userID) {
        ArrayList<Booking> myRooms = new ArrayList<>();
        try {
            int userIDParse = Integer.parseInt(userID);
            String query = "SELECT R.*, BI.*,B.*,RT.name AS roomTypeName\n"
                    + "FROM Booking AS B\n"
                    + "JOIN BookingInfor AS BI ON B.booking_infor = BI.id\n"
                    + "JOIN Room AS R ON B.room_id = R.roomID\n"
                    + "JOIN RoomsType AS RT ON R.roomTypeID = RT.roomTypeID\n"
                    + "WHERE BI.user_id =?\n"
                    + "AND BI.check_in_date >= ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, userIDParse);
            // Setting the check-in date parameter to today's date
            java.time.LocalDate today = java.time.LocalDate.now();
            statement.setDate(2, java.sql.Date.valueOf(today));

            ResultSet rs = statement.executeQuery();

            // Process the query result
            while (rs.next()) {

                int bookingId = rs.getInt("booking_id");
                String customerName = rs.getString("customer_name");
                String customerAddress = rs.getString("customer_address");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                Date checkInDate = rs.getDate("check_in_date");
                Date checkOutDate = rs.getDate("check_out_date");
                String nameRoom = rs.getString("name");
                String typeRoomName = rs.getString("roomTypeName");
                int roomTypeId = rs.getInt("roomTypeID");

                Booking booking = new Booking();
                booking.setBooking_id(bookingId);
                booking.setCustomer_name(customerName);
                booking.setCustomer_address(customerAddress);
                booking.setCustomer_phone(customerPhone);
                booking.setCustomer_email(customerEmail);
                booking.setCheckInDate(checkInDate);
                booking.setCheckOutDate(checkOutDate);
                booking.setRoomName(nameRoom);
                booking.setTypeRoom(typeRoomName);
                booking.setRoomTypeID(roomTypeId);
                myRooms.add(booking);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return myRooms;
    }

    public void UpdateBookedRoom(Booking booking) throws ClassNotFoundException {

        String queryBookings = "UPDATE BookingInfor\n"
                + "SET customer_name = ?, customer_address = ?, customer_phone = ?, customer_email = ?\n"
                + "FROM BookingInfor BI\n"
                + "JOIN Booking B ON BI.id = B.booking_infor\n"
                + "WHERE B.booking_id = ?;";

        String updateBookingRoom = "UPDATE Booking SET room_id = ? WHERE booking_id =? ";

        try {

            // Update the booking information
            PreparedStatement statement = this.connection.prepareStatement(queryBookings);

            statement.setString(1, booking.getCustomer_name());
            statement.setString(2, booking.getCustomer_address());
            statement.setString(3, booking.getCustomer_phone());
            statement.setString(4, booking.getCustomer_email());
            statement.setInt(5, booking.getBooking_id());
            statement.executeUpdate();

            PreparedStatement st = this.connection.prepareStatement(updateBookingRoom);
            st.setInt(1, booking.getRoomID());
            st.setInt(2, booking.getBooking_id());
            st.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void cancelBookedRoomNor(int bookingId) {

        String queryIdBookingInfor = "SELECT BI.id "
                + "FROM BookingInfor BI "
                + "JOIN Booking B ON BI.id = B.booking_infor "
                + "WHERE B.booking_id = ?";

        String queryDeleteBooking = "DELETE FROM Booking WHERE booking_id = ?";

        String updateBookingInfor = "UPDATE BookingInfor "
                + "SET quantity = CASE "
                + "                WHEN quantity > 0 THEN quantity - 1 "
                + "                ELSE quantity "
                + "            END "
                + "WHERE id = ?";

        String deleteBookingInfor = "DELETE FROM BookingInfor "
                + "WHERE id = ? AND quantity = 0";

        try (PreparedStatement st = connection.prepareStatement(queryIdBookingInfor); PreparedStatement statement1 = connection.prepareStatement(queryDeleteBooking); PreparedStatement statement2 = connection.prepareStatement(updateBookingInfor); PreparedStatement statement3 = connection.prepareStatement(deleteBookingInfor)) {

            connection.setAutoCommit(false);

            // Step 1: Get the ID of BookingInfor
            st.setInt(1, bookingId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int idBookingInfor = rs.getInt(1);

                    // Step 2: Delete Booking by booking_id
                    statement1.setInt(1, bookingId);
                    int rowsAffected = statement1.executeUpdate();
                    if (rowsAffected <= 0) {
                        System.out.println("No booking found for the given booking ID");
                        connection.rollback();
                        return;
                    }

                    // Step 3: Update BookingInfor by ID
                    statement2.setInt(1, idBookingInfor);
                    statement2.executeUpdate();
                    
                    // Step 4: Delete BookingInfor by ID if quantity = 0
                    statement3.setInt(1, idBookingInfor);
                    statement3.executeUpdate();

                    connection.commit(); 
                } else {
                    System.out.println("Cannot get ID from BookingInfor");
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                connection.rollback(); // Rollback transaction in case of error
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void CancleBookedRoom(int bookingId) throws ClassNotFoundException, Exception {

        String queryAmount = "SELECT quantity FROM BookingInfor WHERE id IN (SELECT booking_infor FROM Booking WHERE booking_id = ?);";

        String updateQuantity = "UPDATE BookingInfor "
                + "SET quantity = quantity - 1 "
                + "WHERE id = ? ;";

        String deleteBookingInfor = "DELETE BI\n"
                + "FROM BookingInfor BI\n"
                + "JOIN Booking B ON BI.id = B.booking_infor\n"
                + "WHERE B.booking_id = ?; ";

        String queryDeleteBooking = "DELETE FROM Booking WHERE booking_id = ? ;";
        try {
            connection.setAutoCommit(false);

            System.out.println("booking id: " + bookingId);

            // Retrieve quantity
            int quantity = 0;
            try (PreparedStatement statement2 = connection.prepareStatement(queryAmount)) {

                statement2.setInt(1, bookingId);
                ResultSet rs = statement2.executeQuery();

                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                    System.out.println("quantity: " + quantity);
                } else {
                    connection.rollback();
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log the error
                return;
            }

            // Update or delete BookingInfor based on quantity
            try (PreparedStatement statement3 = connection.prepareStatement(quantity > 1 ? updateQuantity : deleteBookingInfor)) {
                statement3.setInt(1, bookingId);
                statement3.executeUpdate();
            }

            // Finally, delete booking
            try (PreparedStatement statement1 = connection.prepareStatement(queryDeleteBooking)) {
                statement1.setInt(1, bookingId);
                statement1.executeUpdate();
            }
            connection.commit(); // Commit transaction
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback(); // Rollback transaction in case of error
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Handle rollback error
            }
            //e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true); // Ensure auto-commit is restored
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Handle closing error
            }
        }
    }
}
