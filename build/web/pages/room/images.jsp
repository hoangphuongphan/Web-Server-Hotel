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
            <script>
            // Hàm JavaScript để thay đổi ảnh chính khi click vào ảnh nhỏ
            function changeImage(src) {
                document.getElementById('mainImage').src = src;
            }
            function toggleRoomList(event) {
                event.preventDefault(); // Ngăn không cho liên kết thực hiện hành động mặc định của nó
                const roomItems = document.querySelectorAll('#roomList li:not(:first-child)');
                roomItems.forEach(item => {
                    if (item.style.display === "none") {
                        item.style.display = "list-item";
                    } else {
                        item.style.display = "none";
                    }
                });
            }
        </script>
    </head>
    <body>
       <div class="container">
        <div class="room-info" style="float:left; width:60%;">
            <form>
                <%
                    String roomName = (String) request.getAttribute("roomName");
                    List<String> images = (List<String>) request.getAttribute("images");

                    // Set defaultImage to the first image in the list
                    String defaultImage = (images != null && !images.isEmpty()) ? images.get(0) : "";
                %>
            
                <h3>Ảnh phòng</h3>
                <img id="mainImage" src="<%= defaultImage %>" alt="Main Room Image" style="width:100%;height:auto;">

                <div class="thumbnails">
                    <% 
                        if (images != null) {
                            for (String image : images) {
                    %>
                                <img src="<%= image %>" alt="Room Image" onclick="changeImage(this.src)" style="width:20%;height:auto;">
                    <%
                            }
                        }
                    %>
                </div>
            </form>
        </div>
    </div>
    </body>
</html>

