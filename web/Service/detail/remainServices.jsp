<%@ page import="java.util.List" %>
<%@ page import="model.Service" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <style>
        .remain-service_list {
            display: flex;
            list-style: none;
            padding: 0;
            overflow-x: scroll;
        }

        .remain-item {
            margin: 10px;
        }

        .image-item img {
            max-width: 100%;
            height: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
    </style>
</head>

<body>
    <div>
        <h1>Remaining Services:</h1>
        <div class="remain-service_list">
            
            <% 
                List<Service> services = (List<Service>) request.getAttribute("remainSerivces");
                if (services != null && !services.isEmpty()) {
                    for (Service service : services) {
            %>
            
            <div class="remain-item">
                
                <img src="<%= service.getImageURL() %>" alt="Image"><br>
                <a href="/hotel/services/detail?id=<%=service.getId() %>&title=<%=service.getTitle() %>"><%= service.getTitle() %></a>
                
            </div>
            <% 
                    }
                } else {
            %>
            <div>no</div>
            <% } %>
        </div>
    </div>
</body>

</html>
