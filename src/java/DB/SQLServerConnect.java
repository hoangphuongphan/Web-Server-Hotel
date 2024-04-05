/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class SQLServerConnect {
    // JDBC URL, username, and password of MySQL server

//    private static final String JDBC_URL = "jdbc:sqlserver://your_sql_server_hostname:1433;databaseName=your_database_name";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "123456789";

    // JDBC variables for opening, closing, and managing the connection
    protected Connection connection;

    public void closeConnection() {
        try {
            if (this.connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Connection connect() throws Exception {

        try {
            String serverName = "localhost:1433";
            String databaseName = "HotelBeta";

            String URLConnect = "jdbc:sqlserver://" + serverName + ";databaseName=" + databaseName + ";user=" + USERNAME + ";password=" + PASSWORD + ";encrypt=false";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(URLConnect);

            if (connection == null) {
                throw new Exception("Error When Connecting");
            }

            System.out.println("Connected");
            DatabaseMetaData dm = (DatabaseMetaData) connection.getMetaData();

            return connection;

        } catch (SQLException e) {
            System.err.println("Cannot connect database, " + e);
        }
        return null;
    }

}
