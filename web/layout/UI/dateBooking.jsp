<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            
            .date-booking_modal {
            
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; 
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

            }

            .modal-content_date {
                position: relative;
                background-color: #fefefe;
                margin: 5% auto; /* 5% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 50%; /* Could be more or less, depending on screen size */
                border-radius: 10px;
            }
           
            .date-booking_modal form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .date-booking_modal   label {
                margin-bottom: 10px;
                font-weight: bold;
            }

            .date-input_booking[type="date"] {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            .date-input_booking[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .date-input_booking[type="submit"]:hover {
                background-color: #45a049;
            }
            .date-booking_modal  .closeBooking{
                font-size: 28px;
                position: absolute;
                top: 10px;
                right: 25px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>


        <div id="bookingModal" class="date-booking_modal">
            <div class="modal-content_date">
                <span class="closeBooking">&times;</span>
                <h3>Select Dates</h3>
                <form action="/hotel/booking" method="GET">
                    Check-in Date: <input  class="date-input_booking" type="date" name="InDate" id="inDate" required><br><br>
                    Check-out Date: <input  class="date-input_booking" type="date" name="OutDate"  id="outDate" required><br><br>
                    <input class="date-input_booking"  type="submit" value="Booking Room" >
                </form>
            </div>
        </div>

        <script>
            // Get the modal
            var modalBooking = document.getElementById('bookingModal');

            // Get the button that opens the modal
            var btnBooking = document.getElementById("bookingButton");

            // Get the <span> element that closes the modal
            var closeBooking = document.getElementsByClassName("closeBooking")[0];

            // When the user clicks the button, open the modal 
            btnBooking.onclick = function () {
                modalBooking.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            closeBooking.onclick = function () {
                modalBooking.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modalBooking) {
                    modalBooking.style.display = "none";
                }
            }
        </script>
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
    </body>
</html>
