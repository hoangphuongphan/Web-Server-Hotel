<%-- 
    Document   : images
    Created on : Mar 5, 2024, 12:53:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.RoomType" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/css/room/images.css">


        <script>
            function changeImage(src) {
                document.getElementById('mainImage').src = src;
            }
        </script>
        <style>
            .banner img {
                width: 100%;
                height: 550px; /* Giảm chiều cao */
                object-fit: cover; /* Đảm bảo ảnh không bị méo */
                display: block;
            }

            .room-details {
                border: 4px solid #f5f5f5;
                padding: 0px;
                margin-left: 10%; /* Margin 1 phần */
                margin-right: 10%; /* Margin 1 phần */
                background-color:  #FFFAFA;
            }

            .room-details-row {
                border-bottom: 3px solid #f5f5f5;
                padding: 0px;
            }
            .centered-title {
                margin-top: 50px; /* Khoảng cách với banner */
                margin-left: 10%; /* Margin 1 phần */

            }

            .room-details-row:last-child {
                border-bottom: none;
            }

            #mainImage {
                display: block;
                max-width: 70%; /* Giảm kích thước */
                height: auto;
                margin: 20px auto; /* Căn giữa và tạo khoảng cách */
                border-radius: 10px;
            }

            .thumbnails {
                text-align: center; /* Căn giữa thumbnails */
            }

            .thumbnails img {
                cursor: pointer;
                max-width: 200px;
                height: auto;
                margin: 10px 5px;
                border: 2px solid #f5f5f5;
                border-radius: 20px;
                display: inline-block;
                transition: all 0.4s ease-in-out;

            }

            .thumbnails img:hover {
                border-color: #333;
                transform: scale(1.1); /* Phóng to khi hover */

            }
        </style>
    </head>
    <body>


        <div class="room-details">
            <div class="room-details-row">
                <h3>Ảnh phòng</h3>
            </div>
            <div class="room-details-row">
                <%
                    String roomName = (String) request.getAttribute("roomName");
                    List<String> images = (List<String>) request.getAttribute("images");
                    String defaultImage = (images != null && !images.isEmpty()) ? images.get(0) : "";
                %>
                <img id="mainImage" src="<%= defaultImage %>" alt="Main Room Image" style="width:100%;height:auto;">
            </div>
            <div class="room-details-row">
                <div class="thumbnails">
                    <% 
                        if (images != null) {
                            for (String image : images) {
                    %>
                    <img src="<%= image %>" alt="Room Image" onclick="changeImage(this.src)">
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
