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

        <style>
            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #f8eeee;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }
            .sidenav a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 22px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }
            .sidenav a:hover {
                color: #f1f1f1;
            }
            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }
            .menu-toggle {
                font-size:30px;
                cursor:pointer;
                color:  #696969;
            }
        </style>

        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script>

    </head>

    <body>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <c:forEach items="${requestScope.data}" var="c">
                <a href="room?id=${c.id}">${c.roomName}</a>
            </c:forEach>
        </div>
        <span class="menu-toggle" onclick="openNav()">&#9776; Tất cả các phòng</span>
    </body>

</html>
