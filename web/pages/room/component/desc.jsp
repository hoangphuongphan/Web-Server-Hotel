<%-- 
    Document   : desc
    Created on : Mar 5, 2024, 1:45:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.RoomType" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/room/desc.css">
        <style>
            .form-container, .form-description, .form-view {
                border: 2px solid #f5f5f5;
                margin: 20px;
                padding: 10px;
                background-color:  #FFFAFA;
            }
            .tab {
                cursor: pointer;
                padding: 10px;
                margin-right: 5px;
                background: #f0f0f0;
                display: inline-block;
            }
            .active-tab {
                background: #ddd;
            }
            .content {
                display: none;
                margin-top: 10px;
            }
            .show {
                display: block;
            }
            .form-title {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <form class="form-description">
            <div class="form-title">Chi tiết phòng</div>
            <p>${room.description}</p>
        </form>

        <form class="form-view">
            <div class="tab active-tab" onclick="changeTab(event, 'overview')">Tổng Quan</div>
            <div class="tab" onclick="changeTab(event, 'featured')">Đặc Trưng</div>

            <div id="overview" class="content show">
                ${room.overview}
            </div>

            <div id="featured" class="content">
                ${room.featured}
            </div>
        </form>

        <script>
            function changeTab(evt, tabName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("content");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tab");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active-tab", "");
                }
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active-tab";
            }

            window.onload = function () {
                // Xác định các container
                var containers = ['overview', 'featured'];

                containers.forEach(function (containerId) {
                    var container = document.getElementById(containerId);
                    if (container) {
                        // Lấy tất cả các phần tử <p> và <li> trong container
                        var elements = container.querySelectorAll('p, li');
                        elements.forEach(function (element) {
                            // Đối với mỗi phần tử, thực hiện thay thế để in đậm chữ trước dấu hai chấm
                            var html = element.innerHTML;
                            var boldedHtml = html.replace(/([^:]+):/, '<b>$1:</b>');
                            element.innerHTML = boldedHtml;
                        });
                    }
                });
            };
        </script>
    </body>
</html>

