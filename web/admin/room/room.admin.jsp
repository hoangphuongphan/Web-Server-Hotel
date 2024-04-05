<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>AdminRoom</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .room_type-title {
                text-align: center;
                margin: 34px 0;
                color: #333;
            }
            .room_type-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                padding: 20px;
            }
            .room_type-item {
                background-color: #ffffff;
                margin: 0 10px;
                text-align: center;
                border-radius: 6px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                width: 300px; /* Adjusted width */
                margin-bottom: 20px;
            }
            .room_type-item img {
                width: 100%;
                height: auto;
            }
            .room_type-item h3, .room_type-item p, .room_type-item .description {
                padding: 10px;
            }
            .room_type-item .description {
                color: #666;
                font-size: 14px;
            }
            .action-links {
                padding: 20px;
                display: flex;
                justify-content: center;
                gap: 10px; /* Spacing between buttons */
            }
            .action-links a {
                text-decoration: none;
                color: white;
                padding: 8px 12px;
                border-radius: 5px;
            }
            .action-links a.update-link {
                background-color: #007bff;
            }
            .action-links a.delete-link {
                background-color: #dc3545;
            }
            .create-link {
                display: inline-block;
                text-decoration: none;
                color: white;
                background-color: #28a745;
                padding: 12px 18px;
                border-radius: 5px;
                margin-top: 20px;
            }
            /* Hiệu ứng hover cho room_type-item */
            .room_type-item:hover {
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
                transform: translateY(-5px); /* Nhẹ nhàng nâng item lên khi hover */
                transition: all 0.3s ease;
            }

            /* Hiệu ứng hover cho các nút */
            .action-links a:hover, .create-link:hover {
                opacity: 0.8; /* Nhẹ nhàng làm mờ nút khi hover */
                transition: opacity 0.3s ease;
            }

            /* Đảm bảo mọi chuyển đổi là mượt mà */
            .room_type-item, .action-links a, .create-link {
                transition: all 0.3s ease;
            }

        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete this room with id: " + id + "?")) {
                    window.location = "deleteRoom?id=" + id;
                }
            }

        </script>
    </head>
    <body>
    <center>

        <h2 class="room_type-title">Manager RoomType</h2>
        <div class="room_type-list">
            <c:forEach var="room" items="${roomServlet}">
                <c:set var="id" value="${room.id}"/>

                <div class="room_type-item">
                    <h3>${room.roomName}</h3>
                    <img src="${room.thumbnail}" alt="Ảnh Phòng">
                    <p class="description">${room.description}</p>
                    <p>${room.price} VNĐ</p>
                    <div class="action-links">
                        <a href="updateRoom?id=${id}" class="update-link">Update</a> 
                        <a href="#" onclick="doDelete('${id}')" class="delete-link">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <a href="/hotel/manage/room/create" class="create-link">Create New Room</a>
    </center>
</body>
</html>
