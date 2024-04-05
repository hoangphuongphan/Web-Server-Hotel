<%-- 
    Document   : desc
    Created on : Mar 5, 2024, 1:45:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.RoomType" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    </head>
    <body>
        <div class="description">
            <h3>Chi tiết phòng</h3>
            
            <p>${requestScope.room.description}</p>

            <div class="details-wrapper">
                <div class="overview">${requestScope.room.overview}</div>
                <div class="features">${requestScope.room.featured}</div>
            </div>
        </div>

    </body>
</html>
