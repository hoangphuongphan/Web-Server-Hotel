<%-- 
    Document   : listRoom
    Created on : Mar 15, 2024, 3:53:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
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
    </body>
</html>
