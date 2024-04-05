/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author phoan
 */
public class BookedRoom {
    private int BookingID;
    private int CustomerId;
    private int RoomId;
    private Date inDate;
    private Date outDate;
    private String CustomerName;

    public BookedRoom(int BookingID, int CustomerId, int RoomId, Date inDate, Date outDate, String CustomerName) {
        this.BookingID = BookingID;
        this.CustomerId = CustomerId;
        this.RoomId = RoomId;
        this.inDate = inDate;
        this.outDate = outDate;
        this.CustomerName = CustomerName;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public int getRoomId() {
        return RoomId;
    }

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }

    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }
    
    
}
