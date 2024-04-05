/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.Service;

/**
 *
 * @author Admin
 */
public class ServiceDAO extends SQLServerConnect {

    ArrayList<Service> list;

    public ServiceDAO() {

        try {
            this.connect();
        } catch (Exception ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        list = new ArrayList<>();
        getAllServices();
    }

    public ArrayList<Service> getList() {
        return list;
    }

    public List<Service> getAllServices() {

        String sql = "select * from Service";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Service service = new Service();

                String id = rs.getString("id");
                String title = rs.getString("name");
                String description = rs.getString("description");
                String imageURL = rs.getString("thumbnail");

                service.setId(id);
                service.setTitle(title);
                service.setImageURL(imageURL);
                service.setDescription(description);

                this.list.add(service);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Service getDetailService(int id) {

        String sql = "SELECT * FROM Service where id = ?";

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                String serviceID = rs.getString("id");

                String title = rs.getString("name");
                String description = rs.getString("description");
                String markdown = rs.getString("markdown");
                String imageURL = rs.getString("thumbnail");
                int price = rs.getInt("price");

                return new Service(serviceID, title, imageURL, description, markdown, price);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<String> getListImagesSerivce(int id) {

        List<String> images = new ArrayList<>();
        String sql = "SELECT * FROM ImagesService where serviceID = ?";

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                images.add(rs.getString("url"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return images;
    }

    public List<Service> getListRemainServices(int id) {
        return this.list.stream()
                .filter(service -> !service.getId().equals(id))
                .collect(Collectors.toList());
    }

    public boolean updateServiceById(Service service) {
        String sql = "UPDATE Service SET name=?, thumbnail=?, description=?, price=? WHERE id=?";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, service.getTitle());
            preparedStatement.setString(2, service.getImageURL());
            preparedStatement.setString(3, service.getDescription());
            preparedStatement.setDouble(4, service.getPrice());
            preparedStatement.setInt(5, Integer.parseInt(service.getId()));

            // Execute the update statement
            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println(e);
            e.printStackTrace();
            return false;
        }

    }

    public boolean createService(Service service) {
        String sql = "INSERT INTO Service (name, thumbnail, description, markdown, price) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, service.getTitle());
            preparedStatement.setString(2, service.getImageURL());
            preparedStatement.setString(3, service.getDescription());
            preparedStatement.setString(4, service.getMarkdown());
            preparedStatement.setDouble(5, service.getPrice());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteById(int serviceId) {

        // First, delete the dependent entries from the ImagesRoom table
        String sqlDeleteImages = "DELETE FROM ImagesService WHERE serviceID = ?";
        // Then, delete the entry from the RoomsType table
        String sqlDeleteRoomType = "DELETE FROM Service WHERE id = ?";

        try {
            // Start a transaction
            connection.setAutoCommit(false);

            // Delete All Images Of Service entries
            try (PreparedStatement st1 = connection.prepareStatement(sqlDeleteImages)) {
                st1.setInt(1, serviceId);
                st1.executeUpdate();
            } catch (SQLException e) {
                connection.rollback(); // Rollback transaction if there's an error
                e.printStackTrace();
                return false;
            }

            // Delete Service entry
            try (PreparedStatement st2 = connection.prepareStatement(sqlDeleteRoomType)) {
                st2.setInt(1, serviceId);
                int affectedRows = st2.executeUpdate();
                if (affectedRows > 0) {
                    connection.commit(); // Commit transaction if everything is fine
                    return true;
                } else {
                    connection.rollback(); // Rollback if no rows affected
                    return false;
                }
            } catch (SQLException e) {
                connection.rollback(); // Rollback transaction if there's an error
                e.printStackTrace();
                return false;
            } finally {
                // It's important to set auto commit back to true
                connection.setAutoCommit(true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        ServiceDAO d = new ServiceDAO();
        System.out.println("list all service" + d.getList().size());
    }
}
