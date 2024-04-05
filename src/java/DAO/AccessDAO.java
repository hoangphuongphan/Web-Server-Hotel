/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.SQLServerConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AccessDAO extends SQLServerConnect {

    private ResultSet rs;
    private Statement st;

    public AccessDAO() throws Exception {
        this.connect();
    }

    public User authenticate(String username, String password, HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        String sqlAuthUserName = " SELECT username  FROM [User] WHERE username = ? ";
        String sqlAuthPass = " SELECT * FROM [User] WHERE username=? AND  password = ? ";

        try {

            PreparedStatement prepAuthUserName = this.connection.prepareStatement(sqlAuthUserName);

            prepAuthUserName.setString(1, username);

            ResultSet resultSetUserName = prepAuthUserName.executeQuery();

            if (!resultSetUserName.next()) {
                request.setAttribute("errorMessage", "User Name Not Available");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/access/login.jsp");
                dispatcher.forward(request, response);
            }
            PreparedStatement prepAuthPassword = this.connection.prepareStatement(sqlAuthPass);

            prepAuthPassword.setString(1, username);
            prepAuthPassword.setString(2, password);

            ResultSet resultSetPass = prepAuthPassword.executeQuery();

            if (!resultSetPass.next()) {
                request.setAttribute("usernameBeta", username);
                request.setAttribute("errorMessage", "Wrong Password!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/access/login.jsp");
                dispatcher.forward(request, response);

            }

            User user = new User();

            user.setID(resultSetPass.getInt("id"));
            user.setUsername(resultSetPass.getString("username"));
            user.setFullname(resultSetPass.getString("fullname"));
            user.setMail(resultSetPass.getString("mail"));
            user.setPhone(resultSetPass.getString("phone"));
            user.setAddress(resultSetPass.getString("address"));
            user.setRole(resultSetPass.getString("role"));
            user.setAvatar(resultSetPass.getString("avatar"));

            return user;

        } catch (Exception e) {

            e.printStackTrace();
            return null;
        } finally {
            connection.close();
        }
    }

    public boolean create(User user) {

        String inst = "Insert into [User](username,password,role,fullname,mail,phone,address) values (?,?,?,?,?,?,?)";

        try {

            PreparedStatement prep = this.connection.prepareStatement(inst);

            prep.setString(1, user.getUsername());
            prep.setString(2, user.getPassword());
            prep.setString(3, user.getRole());
            prep.setString(4, user.getFullname());
            prep.setString(5, user.getMail());
            prep.setString(6, user.getPhone());
            prep.setString(7, user.getAddress());

            int re = prep.executeUpdate();

            return re > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    private boolean createEntity(Entity entity) {
//        String inst = "Insert into dbo.UserInformation (user_id,fullname,mail,phone,address) values (?,?,?,?)";
//        try {
//
//            PreparedStatement prep = this.connection.prepareStatement(inst);
//
//            prep.setString(2, entity.getName());
//            prep.setString(3, entity.getMail());
//            prep.setString(4, entity.getPhone());
//            prep.setString(5, entity.getAddress());
//
//            int rowEffect = prep.executeUpdate();
//
//            return rowEffect > 0;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    public List<User> getList() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "Select * from [User]";

        try {

            st = connection.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {

                User user = new User();
                user.setID(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setMail(rs.getString("mail"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));

                list.add(user);
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;
    }

}
