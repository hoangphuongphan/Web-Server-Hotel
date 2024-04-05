/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import java.sql.*;
import java.util.ArrayList;
import model.BookedRoom;

/**
 *
 * @author phoan
 */
public class BookedRoomList extends SQLServerConnect {

    private ArrayList<BookedRoom> list;

    private ResultSet rs;
    private PreparedStatement st;

    public BookedRoomList() throws Exception {
        
        this.connect();
        list = new ArrayList<>();
        String query = "Select * from Booking as A join BookingInfor as B ON A.booking_infor = B.id order by room_id";
        
        try {

            st = connection.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new BookedRoom(rs.getInt("booking_infor"), rs.getInt("user_id"), rs.getInt("room_id"), rs.getDate("check_in_date"), rs.getDate("check_out_date"), rs.getString("customer_name")));
            }

            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<BookedRoom> getList() {
        return list;
    }
}
