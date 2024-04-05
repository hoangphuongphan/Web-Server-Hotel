/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Booking;

/**
 *
 * @author Admin
 */
public class BookingDAO extends SQLServerConnect {

//    private ArrayList<Booking> bookings = new ArrayList<>();
    public BookingDAO() throws Exception {
        this.connect();
    }

    public void AddBookings(Booking booking) throws Exception {
        String bookingInforQuery = "INSERT INTO BookingInfor(customer_name, customer_address, customer_phone, customer_email, check_in_date, check_out_date, user_id, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String bookingRoomsQuery = "INSERT INTO Booking(room_id, booking_infor) VALUES (?, ?)";

        try {
            this.connection.setAutoCommit(false); // Start transaction
            // Insert into BookingInfor table
            try (PreparedStatement bookingInforStatement = this.connection.prepareStatement(bookingInforQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                bookingInforStatement.setString(1, booking.getCustomer_name());
                bookingInforStatement.setString(2, booking.getCustomer_address());
                bookingInforStatement.setString(3, booking.getCustomer_phone());
                bookingInforStatement.setString(4, booking.getCustomer_email());
                bookingInforStatement.setDate(5, new java.sql.Date(booking.getCheckInDate().getTime()));
                bookingInforStatement.setDate(6, new java.sql.Date(booking.getCheckOutDate().getTime()));
                bookingInforStatement.setInt(7, booking.getUserId());
                bookingInforStatement.setInt(8, booking.getRoomIds().size());

                int rs = bookingInforStatement.executeUpdate();

                if (rs < 0) {
                    throw new Exception("Error When Inserting into BookingInfor");
                }

                ResultSet generatedKeys = bookingInforStatement.getGeneratedKeys();

                int bookingInforID = -1;

                if (generatedKeys.next()) {
                    bookingInforID = generatedKeys.getInt(1);
                } else {
                    throw new Exception("Error Getting Generated Key for BookingInfor");
                }

                // Insert into BookingRooms table And Update Availability Room
                try (PreparedStatement bookingRoomsStatement = this.connection.prepareStatement(bookingRoomsQuery);) {

                    for (int roomId : booking.getRoomIds()) {

                        bookingRoomsStatement.setInt(1, roomId);
                        bookingRoomsStatement.setInt(2, bookingInforID);
                        bookingRoomsStatement.addBatch();

                    }

                    int[] batchResult = bookingRoomsStatement.executeBatch();

                    for (int result : batchResult) {
                        if (result < 0) {
                            throw new Exception("Error When Inserting into BookingRooms");
                        }
                    }
                }
            }
            this.connection.commit(); // Commit the transaction

        } catch (SQLException e) {
            try {
                this.connection.rollback(); // Rollback the transaction if an exception occurs
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                this.connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
