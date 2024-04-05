/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAO.BookedRoomList;
import DB.SQLServerConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookedRoom;

/**
 *
 * @author phoan
 */
public class Bill extends SQLServerConnect {

    public String business = "Loxe Hotel";
    public int CID;
    private BookedRoomList bookedList;
    private ArrayList<BookedRoom> list;
    private double total;

    public Bill(int CID) throws Exception {
        this.connect();
        this.CID = CID;
        bookedList = new BookedRoomList();
        list = new ArrayList<>();
        total = 0;

        for (BookedRoom room : bookedList.getList()) {
            if (room.getCustomerId() == CID) {
                list.add(room);
            }
        }

    }

    @Override
    public String toString() {
        return "<h1>" + business + "</h1><br>\n"
                + "<h2>" + "Phieu Thanh Toan" + "</h2><br>\n"
                + "<h2>" + this.getCustomerName(CID) + "</h2><br>\n"
                + "<p>Room Type            amount  Price    Total</p><br>\n"
                + "___________________________________________<br>\n"
                + getProduct()
                + "___________________________________________<br>\n"
                + "Total             " + total;

    }

    private String getProduct() {
        String proList = "";
        for (BookedRoom room : list) {
            proList += "<p>" + getRoomType(room.getRoomId()) + "  Date Booking: " + getDateOfStay(room.getBookingID()) + " Price:" + getPrice(room.getRoomId()) + " "
                    + getPrice(room.getRoomId()) * getDateOfStay(room.getBookingID()) + "</p><br>\n";
            total += getPrice(room.getRoomId()) * getDateOfStay(room.getBookingID());
        }
        System.out.println("product list: " + proList);
        return proList;
    }

    private double getPrice(int RoomID) {
        double price = 0;
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select price from RoomsType join Room on Room.roomTypeID = RoomsType.roomTypeID where roomID = " + RoomID);
            if (rs.next()) {
                price = rs.getInt("price");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bill.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            return 0;
        }
        return price;
    }

    private String getRoomType(int RoomID) {
        String roomType = "";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select Roomstype.name as name, Room.name as code from Room join RoomsType on Room.roomTypeID = RoomsType.roomTypeID where roomID = " + RoomID);
            if (rs.next()) {
                roomType = rs.getString("name") + " " + rs.getString("code");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bill.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            return null;
        }
        return roomType;

    }

    private String getCustomerName(int CID) {

        String Cname = "";
        String query = "select customer_name from BookingInfor where user_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, CID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Cname = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bill.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("name: " + Cname);
        return Cname;

    }

    private int getDateOfStay(int bookedInforID) {

        int amount = 0;
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("select Datediff(day, check_in_date, check_out_date) as Amount from BookingInfor where id =" + bookedInforID);
            if (rs.next()) {
                amount = rs.getInt("Amount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bill.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
            return 0;
        }
        return amount;
    }
}
