<%-- 
    Document   : list
    Created on : Feb 13, 2024, 11:32:49 AM
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.Service" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/listService.css">
    </head>
    <body>

        <div class="container">
            <% 
                List<Service> listServices = (List<Service>) request.getAttribute("listServices");
            
                if (listServices != null && !listServices.isEmpty()) {
                int index =0;
                    for (Service service : listServices) {
                     String itemClass = (index % 2 != 0) ? "reverse" : "";
                     index++;
            %>
            <div class="item <%= itemClass %> ">
                <div class="img_wrapper">
                    <img class="image" src="<%= service.getImageURL() %>" alt="Service Image">
                </div>

                <div class="content">
                    <a class="title" href="/hotel/services/detail?id=<%=service.getId() %>&title=<%=service.getTitle() %>"><%= service.getTitle() %></a><br>
                    <div><%= service.getDescription() %></div>
                </div>

            </div>
            <% 
                    }
                } else {
            %>
            <div>No services available.</div>
            <% } %>
        </div>

    </body>
</html>

