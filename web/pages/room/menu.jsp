<%-- 
    Document   : menu
    Created on : Mar 5, 2024, 12:54:47 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.RoomList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="menu_tab">
            <ul class="menu" id="roomList">

                <li><a href="#" onclick="toggleRoomList(event);">Tất cả phòng</a></li>
                    <c:forEach items="${requestScope.data}" var="c">
                    <li style=""><a href="room?id=${c.id}">${c.roomName}</a></li>
                    </c:forEach>
            </ul>

        </div>
    </body>
</html>
