<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.RoomType" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room</title>
        <link rel="stylesheet" type="text/css" href="../.././assets/css/room/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <style>
            .banner img{
                border-radius: 20px;
            }
        </style>
    </head>

    <body>
        <%@include file="../.././layout/UI/header.jsp" %>
        <%@include file="./component/menu.jsp" %>

        <c:set var="room" value="${requestScope.room}"/>

        <c:if test="${(room==null )}">
            <h3>Room Out</h3>
        </c:if>

        <div class="banner">
            <img src="https://luxehotel.webhotel.vn/files/images/bn/slide-01.jpg" alt="banner">
        </div>

        <div class="centered-title">
            <h2>${room.roomName}</h2>
        </div>

        <%@include file="./component/images.jsp" %>
        <%@include file="./component/desc.jsp" %>
        <%@include file="./component/util.jsp" %>
        <%@include file="../.././layout/UI/footer.jsp" %>


    </body>
</html>
