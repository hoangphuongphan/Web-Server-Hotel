/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phoan
 */
public class User {

    private int ID;
    private String username;
    private String password;
    private String role;
    private String fullname;
    private String mail;
    private String phone;
    private String address;
    private String avatar;

    public User() {

    }

    public User(String username, String password, String role, String fullname, String mail, String phone, String address) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.fullname = fullname;
        this.mail = mail;
        this.phone = phone;
        this.address = address;
    }

    public User(int ID, String username, String password, String role, String fullname, String mail, String phone, String address) {
        this.ID = ID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.fullname = fullname;
        this.mail = mail;
        this.phone = phone;
        this.address = address;
    }

    @Override
    public String toString() {
        return "ID=" + ID + ", username=" + username + "role=" + role + ", fullname=" + fullname + ", mail=" + mail + ", phone=" + phone + ", address=" + address + ", avatar=" + avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMail() {
        return mail;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
