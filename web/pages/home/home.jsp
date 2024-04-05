

<%@ page import="java.util.List" %>
<%@ page import="model.RoomType" %>

<!DOCTYPE html>
<html lang="en">

    <head>
     
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto+Serif:wght@300;400;500;700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">


    </head>

    <body>

        <%@include file="./component/style.jsp" %>

        <%@include file="../.././layout/UI/header.jsp" %>

        <!-- start banner :   -->
        <div class="banner">
            <div class="banner-img">
                <img src="https://luxehotel.webhotel.vn/files/images/bn/slide-02.jpg" alt="banner">
            </div>
        </div>
        <!-- start welcome ;  -->

        <div  id="#introduce" class="welcome">
            <div class="welcome-img">
                <img src="/hotel/assets/images/welcome-img.png" alt="">
            </div>
            <div class="welcome-desc">
                <h2>Welcome to Luxe Hotel</h2>
                <div>
                    <p>Luxe Hotel with fully equipped villas and bungalows, the interior space is decorated in a luxurious style blending traditional Vietnamese features and modern Western features. We have a team of well-trained, professional and dedicated staff with dedicated service.
                        Luxe Hotel is confident to bring you emotional sublimation, the best and most wonderful experiences during your vacation. Come to us, we guarantee that you will not regret it.
                    </p>
                </div>
            </div>
        </div>

        <!--  list room :  -->
        <%@include file="./component/rooms.jsp" %>

        <!-- service :  -->
        <%@include file="./component/services.jsp" %>
        <!-- response :  -->
        <%@include file="./component/response.jsp" %>
        <!-- review :  -->
        <%@include file="./component/review.jsp" %>
        <!-- footer :  -->
        <%@include file="../.././layout/UI/footer.jsp" %>


    </body>

</html>
