

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.RoomType" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <style>
            amenities-form table {
                width: 100%;
                border-collapse: collapse;
            }

            .amenities-form th, .amenities-form td {
                border: 1px solid #f5f5f5; /* Tạo viền cho hàng */
                padding: 10px;
                text-align: left;
                background-color:  #FFFAFA;

            }

            .amenities-form td {
                display: flex;
                flex-wrap: wrap; /* Cho phép các mục bọc sang dòng mới */
                padding-left: 20px; /* Tạo khoảng cách với viền bên trái */
            }

            .amenities-form i {
                margin-right: 15px; /* Khoảng cách giữa các biểu tượng */
                flex-basis: 20%; /* Giả sử mỗi mục chiếm khoảng 20% chiều rộng, điều chỉnh con số này tùy ý */
                margin-bottom: 15px; /* Khoảng cách dưới cùng của mỗi mục */
                padding: 5px; /* Tạo không gian xung quanh nội dung trong mỗi mục */
            }
        </style>
    </head>
    <body>

        <div class="amenities-form">
            <form>
                <table>
                    <tr>
                        <th>Tiện Ích</th>
                    </tr>
                    <tr>
                        <td>
                            <i class="fas fa-wifi"> Wifi</i> <!-- Wifi -->
                            <i class="fas fa-utensils"> Ăn sáng</i> <!-- Ăn sáng -->
                            <i class="fas fa-swimmer"> Hồ bơi</i> <!-- Hồ bơi -->
                            <i class="fas fa-parking"> Bãi đỗ xe</i> <!-- Bãi đỗ xe -->
                            <i class="fas fa-dumbbell"> Gym</i> <!-- Gym -->
                            <i class="fas fa-lock"> Két an toàn</i> <!-- Két an toàn -->
                            <i class="fas fa-desktop"> Bàn làm việc</i> <!-- Bàn làm việc -->
                            <i class="fas fa-spa"> Spa</i> <!-- Spa -->
                            <i class="fas fa-tv"> Tivi</i> <!-- Tivi -->
                            <i class="fas fa-coffee"> Máy pha cà phê</i> <!-- Máy pha cà phê -->
                            <i class="fas fa-shower"> Phòng tắm</i> <!-- Phòng tắm -->
                            <i class="fas fa-fan"> Quạt máy</i> <!-- Quạt máy -->
                            <i class="fas fa-bed"> Giường ngủ</i> <!-- Giường ngủ -->
                            <i class="fas fa-concierge-bell"> Dịch vụ phòng</i> <!-- Dịch vụ phòng -->
                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
