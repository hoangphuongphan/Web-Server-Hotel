<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Service"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Services Manage</title>
        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete this room with id: " + id + "?")) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .service-list-header {
                color: #333;
                text-align: center;
            }
            .service-list-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            .service-list-th, .service-list-td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            .service-list-th {
                background-color: #f2f2f2;
            }
            .service-list-tr:hover {
                background-color: #f5f5f5;
            }
            .service-list-td a {
                text-decoration: none;
                padding: 5px 10px;
                margin-right: 5px;
                color: #333;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            .service-list-td a:hover {
                background-color: #f2f2f2;
            }
            .create-service-btn {
                display: block;
                width: 150px;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                text-align: center;
                text-decoration: none;
                margin-top: 20px;
            }
            .create-service-btn:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <h2 class="service-list-header">Service List</h2>
        <table class="service-list-table">
            <tr>
                <th class="service-list-th">Service Name</th>
                <th class="service-list-th">Action</th>
            </tr>
            <c:forEach var="service" items="${listServices}">
                <tr class="service-list-tr">
                    <td class="service-list-td">${service.title}</td>
                    <td class="service-list-td">
                        <a href="update?id=${service.id}&title=${service.title}">Update</a>
                        <a onclick="doDelete(${service.id})" >Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="create" class="create-service-btn">Create Service</a>
    </body>
</html>
