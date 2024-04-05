package DAO;

import DB.SQLServerConnect;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Room;
import model.RoomList;
import model.RoomType;
import java.sql.Statement;
import java.sql.ResultSet;
import model.RoomsType;

/**
 *
 *
 */
public class RoomDAO extends SQLServerConnect {

    public RoomDAO() throws Exception {
        connect();
    }

    public boolean addRoomType(RoomType roomType) {
        String sql = "INSERT INTO RoomsType (Name, Description, Overview, Featured, Quantity, Capacity, Price, Thumbnail) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, roomType.getRoomName());
            st.setString(2, roomType.getDescription());
            st.setString(3, roomType.getOverview());
            st.setString(4, roomType.getFeatured());
            st.setInt(5, roomType.getQuantity());
            st.setInt(6, roomType.getCapacity());
            st.setDouble(7, roomType.getPrice()); // Assume price is a double
            st.setString(8, roomType.getThumbnail());
            int affectedRows = st.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRoomType(RoomType roomType) {
        String sql = "UPDATE [dbo].[RoomsType]"
                + " SET [name] = ?"
                + " ,[description] = ?"
                + " ,[quantity] = ?"
                + " ,[overview] = ?"
                + " ,[featured] = ?"
                + " ,[price] = ?"
                + " ,[capacity] = ?"
                + " ,[thumbnail] = ?"
                + " WHERE roomTypeID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, roomType.getRoomName());
            st.setString(2, roomType.getDescription());
            st.setInt(3, roomType.getQuantity());
            st.setString(4, roomType.getOverview());
            st.setString(5, roomType.getFeatured());
            st.setInt(6, roomType.getPrice());
            st.setInt(7, roomType.getCapacity());
            st.setString(8, roomType.getThumbnail());
            st.setInt(9, roomType.getId());

            int affectedRows = st.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public List<RoomsType> getRoomsTypeList() {
        ArrayList list = new ArrayList<>();
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM RoomsType");

            while (rs.next()) {
                RoomsType rt = new RoomsType();
                rt.setName(rs.getString("name"));
                rt.setRoomTypeID(rs.getInt("roomTypeID"));
                list.add(rt);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    ///

    public boolean deleteRoomTypee(int roomTypeId) {
        // First, delete the dependent entries from the ImagesRoom table
        String sqlDeleteImages = "DELETE FROM [dbo].[ImagesRoom] WHERE roomTypeID = ?";
        // Then, delete the entry from the RoomsType table
        String sqlDeleteRoomType = "DELETE FROM [dbo].[RoomsType] WHERE RoomTypeID = ?";

        try {
            // Start a transaction
            connection.setAutoCommit(false);

            // Delete ImagesRoom entries
            try (PreparedStatement st1 = connection.prepareStatement(sqlDeleteImages)) {
                st1.setInt(1, roomTypeId);
                st1.executeUpdate();
            } catch (SQLException e) {
                connection.rollback(); // Rollback transaction if there's an error
                e.printStackTrace();
                return false;
            }

            // Delete RoomsType entry
            try (PreparedStatement st2 = connection.prepareStatement(sqlDeleteRoomType)) {
                st2.setInt(1, roomTypeId);
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

    public List<RoomList> getAllNameMenuRoomType() {
        List<RoomList> list = new ArrayList<>();

        String sql = "select*from dbo.RoomsType";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                RoomList c = new RoomList(rs.getInt("RoomTypeID"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<String> getImagesByID(int id) {

        List<String> images = new ArrayList<>();
        String sql = "select * from ImagesRoom where roomTypeID =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String url = rs.getString("url");
                if (url != null) {
                    images.add(url);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (ArrayList<String>) images;
    }

    public List<RoomType> getAllRoomType() {

        List<RoomType> list = new ArrayList<>();

        String sql = "select * from RoomsType";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                RoomType c = new RoomType();

                c.setId(rs.getInt("roomTypeID"));
                c.setRoomName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setCapacity(rs.getInt("capacity"));
                c.setThumbnail(rs.getString("thumbnail"));

                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public RoomType getRoomTypeByID(int id) {

        String sql = "SELECT * FROM RoomsType WHERE RoomTypeID = ?";

        try {
            RoomType c = new RoomType();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                c.setId(rs.getInt("RoomTypeID"));
                c.setRoomName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setOverview(rs.getString("overview"));
                c.setFeatured(rs.getString("featured"));
                c.setQuantity(rs.getInt("quantity"));
                c.setCapacity(rs.getInt("capacity"));
                c.setPrice(rs.getInt("price"));
                c.setThumbnail(rs.getString("thumbnail"));
            }
            return c;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Room> getRooms(int roomTypeID, String checkInDate, String checkOutDate) throws SQLException {
        List<Room> rooms = new ArrayList<>();

        // Prepare the SQL query
        String sql = "SELECT R.roomID, R.name "
                + "FROM Room R "
                + "INNER JOIN RoomsType RT ON R.roomTypeID = RT.roomTypeID "
                + "WHERE R.isAvailable = 1 "
                + "AND RT.roomTypeID = ? "
                + "AND NOT EXISTS ("
                + "    SELECT 1 "
                + "    FROM Booking B "
                + "    INNER JOIN BookingInfor BI ON B.booking_infor = BI.id "
                + "    WHERE B.room_id = R.roomID "
                + "    AND NOT (CAST(? AS DATE) <= BI.check_in_date OR CAST(? AS DATE) >= BI.check_out_date)"
                + ")";

        // Create a PreparedStatement
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            // Set parameters
            statement.setInt(1, roomTypeID);
            statement.setString(2, checkOutDate);
            statement.setString(3, checkInDate);

            // Execute the query
            try (ResultSet resultSet = statement.executeQuery()) {
                // Process the result set
                while (resultSet.next()) {
                    int roomId = resultSet.getInt("roomID");
                    String roomName = resultSet.getString("name");
                    Room room = new Room(roomId, roomTypeID, roomName);

                    // Create Room object and add to the list
                    rooms.add(room);
                }
            }
        }

        return rooms;
    }

}
