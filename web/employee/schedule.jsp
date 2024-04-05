<%-- 
    Document   : index
    Created on : Mar 14, 2024, 6:38:04 PM
    Author     : phoan
--%>

<%@page import="model.BookedRoom"%>
<%@page import="model.Room"%>
<%@page import="model.RoomsType"%>
<%@page import="DAO.BookedRoomList"%>
<%@page import="DAO.RoomList"%>
<%@page import="DAO.RoomDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/hotel/assets/css/schedule/Schedule.css"/>
        <link rel="stylesheet" href="/hotel/assets/css/home/header.css">
        <style>
        
            .form-container {
                width: 300px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f2f2f2;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Style for select dropdown */
            .select-list {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            /* Style for select dropdown options */
            .option-item {
                /* Add specific styles if needed */
            }

            /* Style for submit button */
            .submit-button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            /* Hover effect for submit button */
            .submit-button:hover {
                background-color: #0056b3;
            }
            .form-container {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }

            /* Style for form button */
            .form-button {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            /* Hover effect for form button */
            .form-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body>
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
        <%
           
        RoomDAO typeList = new RoomDAO();
        
        RoomList list = new RoomList();
        
        BookedRoomList bookedList = new BookedRoomList();
        
        int roomType;
        
        if(request.getParameter("RoomType") == null)
            roomType = typeList.getRoomsTypeList().get(0).getRoomTypeID();
        else
            roomType = Integer.parseInt(request.getParameter("RoomType"));
        %>
        <div class="home_header-container">
            <div class="header-nav_img">
                <a href="/hotel"> <img src="https://luxehotel.webhotel.vn/files/images/logo-dark.png" alt="logo"></a>
            </div>

            <ul>             
                <li><a href="/hotel">HOME</a></li>
                <li><a href="/hotel/schedule">SCHEDULE</a></li>
            </ul>

            <a href="<%= isLogin ? "/hotel/logout" : "/hotel/login" %>">
                <button><%= isLogin ? "Logout" : "Login" %></button>
            </a>

        </div>
        <div class="container">

            <div class="form-container">
                <form action="schedule">
                    <select id="SelectList" name="RoomType" class="select-list">
                        <% for (RoomsType type : typeList.getRoomsTypeList()) { %>
                        <option value="<%= type.getRoomTypeID() %>" class="option-item"><%= type.getName() %></option>
                        <% } %>
                    </select><br>
                    <input type="submit" value="Find" class="submit-button">
                </form>
            </div>  
            <div class="row">
                <div class="col-md-12">
                    <div class="schedule-table">
                        <table class="table bg-white">
                            <thead>

                                <tr>
                                    <th>Room</th>
                                    <th>Booked</th>
                                    <th>Booked</th>
                                    <th>Booked</th>
                                    <th>Booked</th>
                                    <th>Booked</th>
                                    <th>Booked</th>
                                    <th class="last">Booked</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%for(Room room : list.getTypeList(roomType)){
                                    int count = 0;%>
                                <tr>
                                    <td class="day"><%=room.getName()%></td>
                                    <%
                                        for(BookedRoom booked : bookedList.getList()){
                                            if(booked.getRoomId()==room.getRoomID()){
                                    %>
                                    <td class="active">
                                        <h4><%=booked.getCustomerName()%></h4>
                                        <p><%=booked.getInDate()%> - <%=booked.getOutDate()%></p>
                                        <div class="hover">
                                            <h4><%=booked.getCustomerId()%></h4>
                                            <p><%=booked.getInDate()%> - <%=booked.getOutDate()%></p>
                                            <div class="form-container">
                                                <form action="SetServlet" method="get">
                                                    <input type="submit" value="Delete" class="form-button">
                                                    <input value="<%=booked.getBookingID()%>" name="id" type="hidden">
                                                </form>
                                                <form action="/hotel/employee/bill.jsp">
                                                    <input type="submit" value="Get Bill" class="form-button">
                                                    <input value="<%=booked.getCustomerId()%>" name="CID" type="hidden">
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                    <%}%>
                                    <%}%>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
