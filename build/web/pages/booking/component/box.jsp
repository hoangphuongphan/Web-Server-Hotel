
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            }

            .box-modal_content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }

            .box-close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                
            }

            .box-close,
            .box-close {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            /* Button styles */
            #deleteButton {
                background-color: #f44336;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            #deleteButton:hover {
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
            }
        </style>
    </head>
    <body>
        <div id="boxModalComfirm" class="box_modal">
            <div class="box-modal_content">
                <span class="box-close">&times;</span>
                <p>Are you sure you want to cancel this order?</p>
                <button id="confirmDelete">Yes</button>
                <button class="box-close">No</button>
            </div>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById("boxModalComfirm");

            // Get the button that opens the modal
            var btn = document.getElementById("deleteButton");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("box-close")[0];

            // Function to set booking ID
            function setBookingId(bookingId) {
                document.getElementById("confirmDelete").setAttribute("data-booking-id", bookingId);
            }

            // When the user clicks the button, open the modal
            btn.onclick = function () {
                modal.style.display = "block";
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
            document.getElementById("confirmDelete").onclick = function () {
                // Retrieve booking ID from the button
                var bookingId = document.getElementById("confirmDelete").getAttribute("data-booking-id");
                // Redirect or perform deletion here with bookingId
                window.location.href = "deleteRoom.jsp?bookingId=" + bookingId; // Change this to your delete endpoint
            }
        </script>
    </body>
</html>
