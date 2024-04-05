<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Confirmation</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .alert-success{
                width: 30%;
                text-align: center;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>
    <body>
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Booking Confirmation</h4><hr>
            <p>Thank you for your booking, <strong>${name}</strong>!</p>
<!--            <p>Your selected room numbers are:     
                <%  
                    String[] roomNumbers = (String[]) request.getAttribute("roomNumbers");
                    int roomCount = roomNumbers.length;
                    for (int i = 0; i < roomCount; i++) { 
                        out.print("<strong>" + roomNumbers[i] + "</strong>");
                        if (i < roomCount - 1) {
                            out.print(", ");
                        }
                    } 
                %>
            </p>-->
            <!-- Custom button to go back home -->
            <a href="/hotel" class="btn btn-primary">Back to Home</a>
            <!-- You can replace "home.html" with the actual URL of your home page -->

            <!-- Custom button to see information about booked rooms -->
            <a href="/hotel/booking/update" class="btn btn-info">See Room Information</a>
            <!-- You can replace "room_information.html" with the actual URL of your room information page -->
        </div>
    </body>
</html>
