/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 *
 * @author Admin
 */
public class AdminDAO extends SQLServerConnect {

    public AdminDAO() throws Exception {
        this.connect();

    }

//    public int countTotalUsers() {
//        int totalUsers = 0;
//        String query = "SELECT COUNT(*) AS total FROM User";
//
//        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {
//
//            if (resultSet.next()) {
//                totalUsers = resultSet.getInt("total");
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace(); // Handle exception properly in your application
//        }
//
//        return totalUsers;
//    }

}
