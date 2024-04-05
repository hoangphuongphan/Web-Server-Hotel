
<%--<%@ page contentType="text/html; charset=UTF-8" language="java" %>--%>
<%@ page import="model.DetailService" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">

    </head>

    <body>
        <div>
            <div>
                <% 
                    DetailService detail = (DetailService) request.getAttribute("detail");
                    if (detail != null) {
                        out.println(detail.getMarkdown());
                    } 
                %>
            </div>
        </div>
    </body>

</html>
