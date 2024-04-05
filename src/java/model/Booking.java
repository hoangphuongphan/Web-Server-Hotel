/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Booking {

    private int booking_id;
    private String customer_name;
    private String customer_address;
    private String customer_phone;
    private String customer_email;
    private Date checkInDate;
    private Date checkOutDate;
    private ArrayList<Integer> roomIds;
    private int userId;
    private String roomName;
    private String typeRoom;
    private int roomTypeID;
    private int roomID;

    public Booking() {
        roomIds = new ArrayList<>();
    }

    public Booking(int booking_id, String customer_name, String customer_address, String customer_phone, String customer_email, Date checkInDate, Date checkOutDate, ArrayList<Integer> roomIds, int userId) {
        this.booking_id = booking_id;
        this.customer_name = customer_name;
        this.customer_address = customer_address;
        this.customer_phone = customer_phone;
        this.customer_email = customer_email;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomIds = roomIds;
        this.userId = userId;
        this.roomIds = roomIds;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getTypeRoom() {
        return typeRoom;
    }

    public void setRoomIds(ArrayList<Integer> roomIds) {
        this.roomIds = roomIds;
    }

    public void setTypeRoom(String typeRoom) {
        this.typeRoom = typeRoom;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void addRoomId(int roomId) {
        roomIds.add(roomId);
    }

    public ArrayList<Integer> getRoomIds() {
        return roomIds;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
}
