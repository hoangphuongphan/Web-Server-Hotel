

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <title>HOTEL</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/hotel/assets/css/booking/stylemenu.css">
        <link rel="stylesheet" href="/hotel/assets/css/booking/styleindex.css">

    </head>


    <%@include file="../.././layout/UI/header.jsp" %>

    <sql:setDataSource 
        var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
        url="jdbc:sqlserver://localhost:1433;databaseName=HotelBeta;encrypt=false"
        user="sa" password="123456789"/>
    <%                                          
                                          String checkInDate = (String) request.getAttribute("checkInDate");
                                          String checkOutDate = (String) request.getAttribute("checkOutDate");                                
    %>
    <body>
        <!-- Book Room Section -->

        <div class="row book-room">
            <!-- Room Section -->
            <div class="col-lg-8">
                <div class="row">
                    <sql:query dataSource="${dataSource}" var="roomTypes">
                        SELECT * FROM RoomsType
                    </sql:query>
                    <!-- Loop through the room types -->
                    <c:forEach var="roomType" items="${roomTypes.rows}">
                        <c:set var="allRoomsAvailable" value="false" />
                        <!-- Display room information -->
                        <div class="room-detail col-lg-12">
                            <div class="row">
                                <div class="col-lg-4">
                                    <img src="${roomType.thumbnail}" alt="${roomType.name}">
                                </div>
                                <div class="room-text col-lg-6">
                                    <h4>${roomType.name}</h4>
                                    <div class="room-icon">
                                        <span>Capacity: ${roomType.capacity}</span>
                                    </div>

                                    <!-- Select room number dropdown -->
                                    <select id="roomNumber_${roomType.roomTypeID}" class="roomNumber form-select" aria-label="Default select example">
                                        <option disabled selected>Select room number</option>

                                        <sql:query dataSource="${dataSource}" var="rooms">

                                            SELECT
                                            R.roomID,
                                            R.name
                                            FROM Room R
                                            INNER JOIN RoomsType RT ON R.roomTypeID = RT.roomTypeID
                                            WHERE R.isAvailable = 1
                                            AND RT.roomTypeID = ${roomType.roomTypeID}
                                            AND NOT EXISTS (
                                            SELECT 1
                                            FROM Booking B
                                            INNER JOIN BookingInfor BI ON B.booking_infor = BI.id
                                            WHERE B.room_id = R.roomID
                                            AND NOT (CAST(? AS DATE) < BI.check_in_date OR CAST(? AS DATE) > BI.check_out_date)
                                            );

                                            <sql:param  value="${checkOutDate}" />
                                            <sql:param value="${checkInDate}"    />

                                        </sql:query>

                                        <!-- Loop through the rooms for the current room type -->
                                        <c:forEach var="room" items="${rooms.rows}">
                                            <option value="${room.roomID}">
                                                ${room.name}
                                            </option>
                                            <c:set var="allRoomsAvailable" value="true" />
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="room-price col-lg-2">
                                    <h5>Price</h5>
                                    <h4 class="price" id="formattedPrice_${roomType.roomTypeID}">${roomType.price}</h4>
                                    <!-- Pass room type name, dropdown ID, and price to addToCart function -->
                                    <c:choose>
                                        <c:when test="${allRoomsAvailable}">
                                            <a href="#" onclick="addToCart('${roomType.name}', 'roomNumber_${roomType.roomTypeID}', '${roomType.price}')">Select Room</a>
                                        </c:when>
                                        <c:otherwise>
                                            <span>Room booked out</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Booking Form and Cart Section -->          
            <%@include file="./form.jsp" %>

        </div>

        <script>

            function addToCart(roomTypeName, roomTypeId, roomPrice) {


                var selectElement = document.getElementById(roomTypeId);
                var roomName = selectElement.options[selectElement.selectedIndex].text;
                var roomID = selectElement.value;
                console.log(roomID);
                var formattedRoomPrice = formatCurrency(roomPrice);
                var cartDiv = document.getElementById("cart-info");
                var selectedRoomHTML =
                        "<div class='box cart_item-selected'>" +
                        "<div class='room-info'>" +
                        "<h5>" + roomTypeName + "</h5>" +
                        "<p>" + "&emsp;Number: " + roomName + "<br>&emsp;Price: " + formattedRoomPrice + "<br>&emsp;" + "</p>" +
                        "</div>" +
                        "<ion-icon name='close-circle-outline' onclick='removeFromCart(this)'></ion-icon>" +
                        "</div>";

                cartDiv.innerHTML += selectedRoomHTML;


                // Thiết lập giá trị cho input ẩn
                var selectedRoomNumbersInput = document.getElementById("selectedRoomNumbers");
                var selectedRoomNumbers = selectedRoomNumbersInput.value;

                console.log(selectedRoomNumbers);

                if (selectedRoomNumbers === "") {
                    selectedRoomNumbers = roomID;
                } else {
                    selectedRoomNumbers += "," + roomID;
                }

                // Set the updated value back to the input element
                selectedRoomNumbersInput.value = selectedRoomNumbers;

            }

            function removeFromCart(element) {
                element.parentNode.remove();
            }

            function formatCurrency(amount) {
                return parseFloat(amount).toLocaleString('en-US', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 0
                });
            }

            <c:forEach var="roomType" items="${roomTypes.rows}">
            var roomPrice_${roomType.roomTypeID} = ${roomType.price};
            var formattedRoomPrice_${roomType.roomTypeID} = formatCurrency(roomPrice_${roomType.roomTypeID});
            document.getElementById("formattedPrice_${roomType.roomTypeID}").textContent = "" + formattedRoomPrice_${roomType.roomTypeID};
            </c:forEach>
        </script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    </body>

</html>
