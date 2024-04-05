/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author VINHNQ
 */
public class RoomList {

    private int id;
    private String roomName;

    public RoomList() {
    }

    public RoomList(int id, String roomName) {
        this.id = id;
        this.roomName = roomName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    @Override
    public String toString() {
        return "RoomList{" + "id=" + id + ", roomName=" + roomName + '}';
    }

}
