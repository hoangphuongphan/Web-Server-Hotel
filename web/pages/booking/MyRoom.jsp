
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" import="DAO.UserDAO"%>
<%@page session="true" import="model.Booking"%>
<%@page session="true" import="DAO.AuthDAO"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Rooms</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/hotel/assets/css/home/header.css">
        <style>

            .box_modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.4);
                border-radius: 10px;
            }

            .box-modal_content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }

            .box_modal  .box_close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;

            }

            .box_modal,
            box_close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            /* Button styles */
            #deleteButtonBoxConfirm {
                background-color: #f44336;
                color: white;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            #deleteButtonBoxConfirm:hover {
                background-color: #d32f2f;
            }

            #confirmDelete, .close {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-right: 10px;

            }

            #confirmDelete:hover, .close:hover {
                background-color: #45a049;
                cursor: pointer;
            }
            .container_button{
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 100px;
            }

            .booking-button {

                padding: 10px 20px;
                font-size: 16px;
                text-align: center;
                text-decoration: none;
                color: #fff;
                background-color: #007bff;
                border: 1px solid #007bff;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .booking-button:hover {
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

                                            String userID = new AuthDAO().getValueCookie(request, response, "user_id");
                           
                                              if (userID == null) {
                                                     response.sendRedirect("/hotel/login");
                                                   return;
                                               }
                            
                                           UserDAO dao = new UserDAO();
                                           ArrayList<Booking> bookings =( ArrayList<Booking>) dao.getMyRooms(userID);
                                        
        %>
        <div class="home_header-container">
            <div class="header-nav_img">
                <a href="/hotel"> <img src="https://luxehotel.webhotel.vn/files/images/logo-dark.png" alt="logo"></a>
            </div>
            <ul>      

                <li><a href="/hotel">HOME</a></li>
                <li><a href="/hotel/services">SERVICES</a></li>
                <li><a href="/hotel/booking/update">ROOMS</a></li>
            </ul>
            <a href="<%= isLogin ? "/hotel/logout" : "/hotel/login" %>">
                <button><%= isLogin ? "Logout" : "Login" %></button>
            </a>
        </div>
        <div class="container mt-3">
            <h1 style="font-family: Times New Roman; text-align: center">YOUR BOOKED ROOMS</h1>
            <div>
                <% if (bookings.isEmpty()) { %>
                <div class="container_button">
                    <p>No rooms booked yet. <a  id="bookingButton" class="booking-button btn btn-primary btn-sm" href="#">Book a room</a>.</p>
                    <%@include file="../.././layout/UI/dateBooking.jsp" %>
                </div>

                <% } else { %>
                <table class="table table-bordered table-hover text-center">
                    <thead class="thead-light">
                        <tr>
                            <th>Room Type</th>
                            <th>Room Name</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>In Date</th>
                            <th>Out Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Booking booking : bookings) { %>
                        <tr>
                            <td><%= booking.getTypeRoom() %></td>
                            <td><%= booking.getRoomName() %></td>
                            <td><%= booking.getCustomer_name() %></td>
                            <td><%= booking.getCustomer_address() %></td>
                            <td><%= booking.getCustomer_phone() %></td>
                            <td><%= booking.getCustomer_email() %></td>
                            <td><%= booking.getCheckInDate() %></td>
                            <td><%= booking.getCheckOutDate() %></td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="update?action=update&roomName=<%= booking.getRoomName() %>&roomTypeID=<%= booking.getRoomTypeID() %>&id=<%= booking.getBooking_id() %>&name=<%= booking.getCustomer_name() %>&address=<%= booking.getCustomer_address() %>&phone=<%= booking.getCustomer_phone() %>&email=<%= booking.getCustomer_email() %>&inDate=<%= booking.getCheckInDate() %>&outDate=<%= booking.getCheckOutDate() %>&roomId=<%= booking.getRoomIds().toString().replace("[", "").replace("]", "").replace(" ", "") %>">Modify</a>
                                <div id="deleteButtonBoxConfirm" class="btn btn-primary btn-sm" onclick="setBookingId(<%= booking.getBooking_id() %>)">Cancel </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <div id="boxModal" class="box_modal">
                    <div class="box-modal_content">
                        <span class="box_close">&times;</span>
                        <p>Are you sure you want to cancel this order?</p>
                        <button id="confirmDelete">Yes</button>
                        <button class="close"></button>
                    </div>
                </div>
                <% } %>
            </div>

        </div>
    </body>
    <script>


        // Get the modal
        var modal = document.getElementById("boxModal");

        // Get the button that opens the modal
        var btn = document.getElementById("deleteButtonBoxConfirm");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("box_close")[0];
        var confirmDeleteBtn = document.getElementById("confirmDelete");

        function setBookingId(bookingId) {
            confirmDeleteBtn.setAttribute("data-booking-id", bookingId);
            modal.style.display = modal.style.display === "block" ? "none" : "block";
        }


        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // Function to handle the confirmation
        confirmDeleteBtn.onclick = function () {
            // Retrieve booking ID from the button
            var bookingId = confirmDeleteBtn.getAttribute("data-booking-id");

            // Redirect or perform deletion here with bookingId
            window.location.href = "delete?bookingId=" + bookingId;
        }

    </script>
</html>
