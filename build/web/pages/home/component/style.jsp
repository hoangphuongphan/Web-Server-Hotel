<%-- 
    Document   : style
    Created on : Mar 5, 2024, 5:51:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>

            * {
                box-sizing: inherit;
                padding: 0;
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;

            }

            /* start banner :  */
            .banner-img img {
                width: 100%;

            }

            /* start welcome :  */
            .welcome {
                height: 438px;
                display: flex;
                justify-content: space-around;
                border-bottom: 1px solid #9B5;

            }

            .welcome-img {
                flex: 1;
                width: 565px;
                height: 307px;
            }

            .welcome-desc {
                flex: 1;
                margin-top: 96px;
            }

            .welcome-img img {
                width: 70%;
                margin-left: 120px;
                margin-top: 60px;
            }

            .welcome-desc div {
                width: 625px;
                text-align: justify;
                margin-top: 10px;
                line-height: 25px;

            }

            /* start list room :  */
            .room {
                height: 600px;
                border-bottom: 1px solid #9B5;
            }

            .room-header {
                height: 150px;
                text-align: center;
                line-height: 150px;
                font-size: 30px;

            }

            .room-list {
                display: flex;
                overflow-x: scroll;
            }

            .room-list a {
                text-decoration: none;
                color: black;

            }

            .room-item {
                width: 380px;
                text-align: center;
                margin:0 10px;
            }

            .room-list .room-img img {
                width: 100%;
                border-radius: 18px;
            }

            /* start service :  */
            .service {
                height: 450px;
                border-bottom: 1px solid #9B5;

            }

            .service-heading {
                height: 150px;
                text-align: center;
                line-height: 150px;
                font-size: 30px;
            }

            /* start service :  */
            .service-list {
                display: flex;
                justify-content: space-around;
                width: 80%;
                margin: auto;
            }

            .service-list a {
                text-decoration: none;
                color: black;

            }

            .service-item {
                width: 300px;
                text-align: center;
                padding: 0 18px;
            }

            .service-item img {
                width: 100%;
                border-radius: 6px;
            }

            /* start response */
            .response {
                height: 519px;
            }

            .response-heading {
                height: 150px;
                text-align: center;
                line-height: 150px;
                font-size: 30px;

            }

            .response-list {
                width: 80%;
                margin: auto;
                display: flex;
                justify-content: space-around;
            }

            .response-item {
                margin: 0 10px;
                width: 400px;
                display: flex;
                flex-direction: column;
                align-items: center;
                border: 3px solid #eaeaea;
                border-radius: 10px;
            }
            .response-item:hover {
                opacity: .75;
            }

            .response-avt img {
                width: 75px;
                border-radius: 50%;
                margin: 24px;
            }

            .response-desc {
                text-align: center;
            }

            .response-desc p {
                margin: 20px;
            }

            .resopnse-logo img {
                width: 150px;
                margin: 14px;

            }

            /* start recommend :  */
            .recommend {
                height: 1146px;
            }

            .recommend-heading {
                height: 150px;
                text-align: center;
                line-height: 150px;
                font-size: 30px;

            }

            .recommend-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .recommend-list a:hover {
                opacity: 0.7;

            }

            .recommend-list a {
                text-decoration: none;
                color: black;

            }

            .recommend-item {
                margin: 15px;
                width: 400px;
                height: 425px;
                border: 3px solid #eaeaea;
                border-radius: 10px;
            }

            .recommend-item h4 {
                margin: 10px 0;

            }

            .recommend-item img {
                width: 100%;
                height: 248px;

            }

            .recommend-item-img {
                height: 248px;
            }

            .recommend-desc {
                padding: 0 13px;
                text-align: justify;
            }




        </style>
    </head>
    <body>

    </body>
</html>
