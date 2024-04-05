/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Room {

    private int roomID;
    private int roomTypeID;
    private String name;
    private int isAvailable;
    public Room() {
    }
    
    public Room(int roomID, int roomTypeID, String name) {
        this.roomID = roomID;
        this.roomTypeID = roomTypeID;
        this.name = name;
    }

    public Room(int roomID, int roomTypeID, String name, int isAvailable) {
        this.roomID = roomID;
        this.roomTypeID = roomTypeID;
        this.name = name;
        this.isAvailable = isAvailable;
    }

    public int getIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(int isAvailable) {
        this.isAvailable = isAvailable;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
