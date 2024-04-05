
<%--<%@ page contentType="text/html; charset=UTF-8" language="java" %>--%>
<%@ page import="model.Service" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">

    </head>

    <body>
        <div>
            <div>
                <% 
                    Service detail = (Service) request.getAttribute("detail");
                    if (detail != null) {
                        out.println(detail.getMarkdown());
                    } 
                %>
            </div>
        </div>
    </body>

</html>
