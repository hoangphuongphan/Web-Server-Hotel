<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.RoomType" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    RoomType roomType = (RoomType) request.getAttribute("roomType");
%>
<html>
    <head>
        <title>Update Room Type</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
                color: #333;
            }
            .container {
                max-width: 600px;
                margin: 20px auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #444;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            input[type="text"],
            input[type="number"],
            textarea {
                padding: 10px;
                margin: 5px 0 20px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            label {
                margin-bottom: 10px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Update Room Type</h2>
            <form action="updateRoom" method="POST">
                <input type="hidden" name="id" value="${roomType.id}"/>
                <label>Room Name:</label> <input type="text" name="roomName" value="${roomType.roomName}" required><br><br>
                <label>Description:</label> <textarea name="description" required>${roomType.description}</textarea><br><br>
                <label>Overview:</label> <textarea name="overview" required>${roomType.overview}</textarea><br><br>
                <label>Featured:</label> <input type="text" name="featured" value="${roomType.featured}" required><br><br>
                <label>Quantity:</label> <input type="number" name="quantity" value="${roomType.quantity}" required><br><br>
                <label>Capacity:</label> <input type="number" name="capacity" value="${roomType.capacity}" required><br><br>
                <label>Price:</label> <input type="number" name="price" value="${roomType.price}" required><br><br>
                <label>Thumbnail:</label> <input type="text" name="thumbnail" value="${roomType.thumbnail}" required><br><br>
                <input type="submit" value="Update">
            </form>                
        </div>
    </body>
</html>
