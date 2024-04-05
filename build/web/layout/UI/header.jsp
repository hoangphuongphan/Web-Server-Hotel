<%-- 
    Document   : header
    Created on : Mar 4, 2024, 4:52:43?PM
    Author     : Admin
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/hotel/assets/css/home/header.css">

    </head>
    <%
        Cookie[] cookies = request.getCookies();
        boolean isLogin = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("isLogin".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                    isLogin = true;
                    break;
                }
            }
        }
    %>
    <body>
        <div class="home_header-container">
            <div class="header-nav_img">
                <a href="/hotel"> <img src="https://luxehotel.webhotel.vn/files/images/logo-dark.png" alt="logo"></a>
            </div>
            <ul>             
                <li><a href="/hotel">HOME</a></li>
                <li><a href="#introduce">INTRODUCE</a></li>
                
                <li><a href="/hotel/services">SERVICES</a></li>
                <li><a href="/hotel/booking/update">ROOMS</a></li>
            </ul>

            <a href="#" id="bookingButton"> <button>BOOKING</button></a>
            <%@include file="./dateBooking.jsp" %>
            <a href="<%= isLogin ? "/hotel/logout" : "/hotel/login" %>">
                <button><%= isLogin ? "Logout" : "Login" %></button>
            </a>

        </div>
    </body>
</html>
