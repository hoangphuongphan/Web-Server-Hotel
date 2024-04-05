/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phoan
 */
public class RoomsType {
    private int RoomTypeID;
    private String name;
    private String description;
    private int quantity;
    private String overview;
    private String featured;
    private double price;
    private int capacity;
    private String imageLink;

    public RoomsType() {
    }

    public RoomsType(int RoomTypeID, String name, String description, int quantity, String overview, String featured, double price, int capacity, String imageLink) {
        this.RoomTypeID = RoomTypeID;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
        this.overview = overview;
        this.featured = featured;
        this.price = price;
        this.capacity = capacity;
        this.imageLink = imageLink;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getFeatured() {
        return featured;
    }

    public void setFeatured(String featured) {
        this.featured = featured;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public int getRoomTypeID() {
        return RoomTypeID;
    }

    public void setRoomTypeID(int RoomTypeID) {
        this.RoomTypeID = RoomTypeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
