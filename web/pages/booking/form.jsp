

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div class="col-lg-4">
            <form action="booking" method="post">
                <div class="row">
                    <!-- Booking Form -->
                    <div class="booking-form col-lg-12">
                        <h4>BOOK HOTEL ROOM</h4>
                        <hr>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" type="text" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input class="form-control" type="text" name="address" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input class="form-control" type="number" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input class="form-control" type="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="inDate">Check-in date</label>
                            <input class="form-control" type="date" name="inDate" id="inDate" value="${checkInDate}" required readonly>
                        </div>
                        <div class="form-group">
                            <label for="outDate">Check out date</label>
                            <input class="form-control" type="date" name="outDate" id="outDate" value="${checkOutDate}" required readonly>
                        </div>

                    </div>

                    <!-- Cart Section -->
                    <div class="cart-section col-lg-12">
                        <div><h5>Cart</h5><hr></div>
                        <div id="cart-info">
                            <!-- Cart items will be displayed here -->
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="buttonBooking col-lg-12">
                        <input type="hidden" id="selectedRoomNumbers" name="selectedRoomNumbers" value="" />
                        <input class="btn btn-success" type="submit" value="Book room">
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        // Get today's date in the format YYYY-MM-DD
        var today = new Date().toISOString().split('T')[0];

        var inDate = document.getElementById('inDate');
        var outDate = document.getElementById('outDate');
// Set the default value of the check-in date input field to today
        inDate.min = today;
        inDate.value = today;

// Set the default value of the check-out date input field to today or later
        outDate.min = today;


// Add an event listener to the check-in date input field
        document.getElementById('inDate').addEventListener('input', function () {
            // Parse the selected check-in date
            var checkInDate = new Date(this.value);

            // Disable days before the selected check-in date for the check-out date
            outDate.setAttribute('min', this.value);

            // Reset the check-out date if it's before the new minimum date
            if (outDate && new Date(outDate.value) < checkInDate) {
                outDate.value = new Date(checkInDate.getTime() + 86400000).toISOString().split('T')[0];
            }

        });</script>

</html>
