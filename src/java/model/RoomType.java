package model;

import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author VINHNQ
 */
public class RoomType {

    private int id;
    private String roomName;
    private ArrayList<String> images;
    private String description;
    private String overview;
    private String featured;
    private int price;
    private int quantity;
    private int capacity;
    private String thumbnail;

    public RoomType() {
    }

    public RoomType(int id, String roomName, ArrayList<String> images, String description, String overview, String featured, int price, int quantity, int capacity, String thumbnail) {
        this.id = id;
        this.roomName = roomName;
        this.images = images;
        this.description = description;
        this.overview = overview;
        this.featured = featured;
        this.price = price;
        this.quantity = quantity;
        this.capacity = capacity;
        this.thumbnail = thumbnail;
    }

    public RoomType(int id, String roomName,String description, String overview, String featured, int price, int quantity, int capacity, String thumbnail) {
        this.id = id;
        this.roomName = roomName;
        this.description = description;
        this.overview = overview;
        this.featured = featured;
        this.price = price;
        this.quantity = quantity;
        this.capacity = capacity;
        this.thumbnail = thumbnail;
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

    public ArrayList<String> getImages() {
        return images;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Override
    public String toString() {
        return "RoomType{" + "id=" + id + ", roomName=" + roomName + ", images=" + images + ", description=" + description + ", overview=" + overview + ", featured=" + featured + ", price=" + price + ", quantity=" + quantity + ", capacity=" + capacity + ", thumbnail=" + thumbnail + '}';
    }

}
