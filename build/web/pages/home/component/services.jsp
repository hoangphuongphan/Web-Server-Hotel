<%-- 
    Document   : services
    Created on : Mar 4, 2024, 6:23:11?PM
    Author     : Admin
--%>

<%@ page import="model.Service" %>

<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="service">
            <div class="service-heading">Services</div>
            <div class="service-list">
                <%
              List<Service> listService = (List<Service>) request.getAttribute("listService");
              if (listService != null) {
                  for (Service service : listService) {
                %>
                <a href="services/detail?id=<%= service.getId() %>">
                    <div class="service-item">
                        <div class="service-img">
                            <img src="<%= service.getImageURL() %>" alt="<%= service.getTitle() %>">
                        </div>
                        <div class="service-desc"><%= service.getTitle() %></div>
                    </div>
                </a>
                <%
                        }
                    } else {
                %>
                <p>No services available.</p>
                <%
                    }
                %>


            </div>
    </body>
</html>
