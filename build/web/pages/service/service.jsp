

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Services</title>
        <style>
            container{
                background-color: #f2f2f2;
                margin-top:50px;
            }

            .item{
                display: flex
            }
            .title{
                font-size: 36px;
                font-weight: 600;
                color: #333;
                font-family: 'Inter', sans-serif;
                text-transform: uppercase;
                text-decoration: none;
                transition: all 0.1s linear
            }
            .title:hover{
                text-decoration: underline;
                opacity: 0.75;
            }
            .title:hover+ .img_wrapper .image {
                transform: scale(1.1);
            }
            .reverse{
                flex-direction: row-reverse;
            }
            .content{
                margin: auto;
                text-align: center
            }
            .image{
                border-radius: 12px;
                width: 100%;
                height: 100%;
                border: 1px solid #cccccc82;

                transition: all 0.5s linear;
            }

            .image:hover{
                scale:1.1
            }

            .img_wrapper{
                overflow: hidden;
                max-width: 50%;
                max-height: 50%;
                border-radius: 12px
            }
        </style>
    </head>

    <body>
        <%@include file="../.././layout/UI/header.jsp" %>
        <img src="https://luxehotel.webhotel.vn/files/images/bn/slide-01.jpg" style="width: 100%; border-radius: 25px"/>
        <%@include file="./component/list.jsp" %>
    </body>

</html>
