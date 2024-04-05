/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Room;

/**
 *
 * @author phoan
 */
public class RoomList extends SQLServerConnect {

    private ArrayList<Room> list;

    private ResultSet rs;
    private Statement st;
    
    public RoomList() throws Exception {
        list = new ArrayList<>();
        this.connect();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("Select * from Rooms order by room_id");
            while (rs.next()) {
                list.add(new Room(rs.getInt("roomID"), rs.getInt("roomTypeID"), rs.getString("name"), rs.getInt("isAvailable")));
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Room> getTypeList(int RoomTypeID) {
        list = new ArrayList<>();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("Select * from Room where roomTypeID = " + RoomTypeID + " order by roomID ");
            while (rs.next()) {
                list.add(new Room(rs.getInt("roomID"), rs.getInt("roomTypeID"), rs.getString("name"), rs.getInt("isAvailable")));
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Room> getList() {
        return list;
    }
}
