

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>    <% 
            String title = (String) request.getAttribute("title");
            if (title != null) {
                out.print(title);
            } else {
                out.print("Service");
            }
            %></title>
    </head>
    <body>
        <%@include file="../../.././layout/UI/header.jsp" %>
        <%@include file="./markdown.jsp" %>
        <%@include file="./images.jsp" %>
        <%@include file="./remainServices.jsp" %>
    </body>
</html>
