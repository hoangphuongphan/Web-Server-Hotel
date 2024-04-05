

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Booked Room</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>

    <sql:setDataSource 
        var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
        url="jdbc:sqlserver://localhost:1433;databaseName=HotelBeta;encrypt=false"
        user="sa" password="123456789"/>
    <%                                          
      String checkInDate = (String) request.getParameter("inDate");
      String checkOutDate = (String) request.getParameter("outDate");     
      int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID")); 
      String roomName   = (String) request.getParameter("roomName");
    %>
    <body>
        <div class="container mt-3">
            <h2 style="font-family: Times New Roman; text-align: center">Update Booked Room</h2>
            <form action="update" method="POST">
                <input type="hidden" name="booking_id" value="<%= request.getParameter("id") %>"> <!--Change-->
                <table class="table">
                    <tr>
                        <td>Name:</td>
                        <td><input class="form-control" name="customer_name" type="text" value="<%= request.getParameter("name") %>"></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input class="form-control" name="customer_address" type="text" value="<%= request.getParameter("address") %>"></td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td><input class="form-control" name="customer_phone" type="text" value="<%= request.getParameter("phone") %>"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input class="form-control" name="customer_email" type="text" value="<%= request.getParameter("email") %>"></td>
                    </tr>

                    <tr>
                        <td>In Date:</td>
                        <td><input class="form-control" name="checkInDate" type="date" value="<%= request.getParameter("inDate") %>" readonly></td>
                    </tr>
                    <tr>
                        <td>Out Date:</td>
                        <td><input class="form-control" name="checkOutDate" type="date" value="<%= request.getParameter("outDate") %>" readonly></td>
                    </tr>
                    <tr>
                        <td>Room</td>
                        <td>
                            <select class="form-control" name="roomNumber" id="roomNumber" class="roomNumber form-select" aria-label="Default select example">
                                <option  selected><%= request.getParameter("roomName") %></option>
                                <!-- Loop through the rooms for the current room type -->
                                <c:forEach var="room" items="${rooms}">
                                    <option value="${room.roomID}">
                                        ${room.name}
                                    </option>
                                    <c:set var="allRoomsAvailable" value="true" />
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="btn btn-primary" name="Update" type="submit" value="Update"></td>
                    </tr>

                </table>
            </form>
        </div>
    </body>
</html>
