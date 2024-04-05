

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

        <%@include file="/Service/detail/markdown.jsp" %>
        <%@include file="/Service/detail/images.jsp" %>
        <%@include file="/Service/detail/remainServices.jsp" %>
    </body>
</html>
