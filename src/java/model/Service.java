/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Service {

    public String id;
    public String title;
    public String thumbnail;
    public String description;
    public String markdown;
    public int price;

    public Service() {
    }

    public Service(String id, String title, String thumbnail, String description, String markdown, int price) {
        this.id = id;
        this.title = title;
        this.thumbnail = thumbnail;
        this.description = description;
        this.markdown = markdown;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Service{" + "id=" + id + ", title=" + title + ", imageURL=" + thumbnail + ", description=" + description + ", markdown=" + markdown + ", price=" + price + '}';
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getImageURL() {
        return thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setImageURL(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMarkdown() {
        return markdown;
    }

    public void setMarkdown(String markdown) {
        this.markdown = markdown;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

}
