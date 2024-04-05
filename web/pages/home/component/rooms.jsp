
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.RoomType" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="room">
            <div class="room-header">Room Categories </div>
            <div class="room-list">
                <%
                    List<RoomType> listRoom = (List<RoomType>) request.getAttribute("listRoom");
                    if (listRoom != null) {
                        for (RoomType room : listRoom) {
                %>
                <a href="room?id=<%= room.getId() %>">
                    <div class="room-item">
                        <div class="room-img">
                            <img src="<%= room.getThumbnail() %>" alt="<%= room.getRoomName() %>">
                        </div>
                        <div class="desc">
                            <h3><%= room.getRoomName() %></h3>
                            <p> <%= room.getPrice() %> vnd / night</p>
                        </div>
                    </div>
                </a>
                <%
                        }
                    } else {
                %>
                <p>No rooms available.</p>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
