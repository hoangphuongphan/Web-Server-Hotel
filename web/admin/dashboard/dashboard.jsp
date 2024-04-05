<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard</title>
        <link rel="stylesheet" href="/hotel/assets/css/admin/dashboard/adminStyle.css"/>
        <link rel="stylesheet" href="/hotel/assets/themify-icons/themify-icons.css"/>
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
                <li><a href="/hotel/services/manage">SERVICES</a></li>
                <li><a href="/hotel/manage/room">ROOM</a></li>
            </ul>

            <a href="<%= isLogin ? "/hotel/logout" : "/hotel/login" %>">
                <button><%= isLogin ? "Logout" : "Login" %></button>
            </a>

        </div>
        <div class="containner">

            <div class="left">
             

                <div class="dashoarda">
                    <i class="ti-bar-chart-alt i_left"></i>
                    DASHBOARD
                    <i class="ti-angle-down i_right"></i>
                    <div class="links">


                        <div class="link">
                            <a href="/hotel/services/manage"> Manage Services</a>
                        </div>
                        <div class="link">
                            <a href="/hotel/manage/room"> Manage Room</a>
                        </div>

                    </div>
                </div>

                <div class="dashoard">
                    <i class="ti-game i_left"></i>
                    APP
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-pie-chart i_left"></i>
                    CHARTS
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-plug i_left"></i>
                    PLUGINS
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-tablet i_left"></i>
                    TABLE
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-align-center i_left"></i>
                    PAGE
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-menu i_left"></i>
                    FORMS
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-harddrive i_left"></i>
                    WIDGET
                    <i class="ti-angle-down i_right"></i>
                </div>


                <div class="dashoard">
                    <i class="ti-map i_left"></i>
                    Map
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-bell i_left"></i>
                    Notification
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-help-alt i_left"></i>
                    Help
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-facebook i_left"></i>
                    Facebook
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-twitter-alt i_left"></i>
                    Twitter
                    <i class="ti-angle-down i_right"></i>
                </div>
                <div class="dashoard">
                    <i class="ti-instagram i_left"></i>
                    Instalgram
                    <i class="ti-angle-down i_right"></i>
                </div>
            </div>
            <div class="right">
                <div class="nav">
                    <img src="/hotel/assets/images/admin/nav.png" alt="">
                </div>

                <div class="info">
                    <div>
                        <i class="ti-user"></i>
                        ${requestScope.numCus}  CUSTOMERS
                    </div>
                    <div>
                        <i class="ti-layout"></i>
                        ${requestScope.numRooms}   ROOM LEFT
                    </div>
                    <div>
                        <i class="ti-bookmark"></i>
                        ${requestScope.numBookings}   BOOKINGS
                    </div>
                </div>
                <div class="popularRoom">
                    <img src="/hotel/assets/images/admin/populaRoom.png" alt="">
                </div>

                <div class="activity">
                    <img src="/hotel/assets/images/admin/activity.png" alt="">
                </div>



            </div>
    </body>
</html>
