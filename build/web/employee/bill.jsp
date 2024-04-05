<%-- 
    Document   : Bill
    Created on : Mar 18, 2024, 11:48:30 AM
    Author     : phoan
--%>

<%@page import="DAO.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill</title>
        <style>
        body {
            background-image: url('https://img.freepik.com/free-vector/gradient-money-texture-detail_23-2149394645.jpg?size=626&ext=jpg&ga=GA1.1.735520172.1710288000&semt=ais'); /* Replace 'background.jpg' with the path to your image file */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    </head>
    <body> 
        <%
        Bill bill = new Bill(Integer.parseInt(request.getParameter("CID")));
        %>
        <div style="margin: 20% 20%">
            <%=bill.toString()%>
        </div>
    </body>
</html>
