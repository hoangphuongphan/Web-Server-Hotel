<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    
     <style>
   

        .image-list {
            display: flex;
            list-style: none;
            padding: 0;
        }

        .image-item {
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
        <h1>IMAGES:</h1>
        <div class="image-list">
            <% 
                List<String> imageUrls = (List<String>) request.getAttribute("images");
                if (imageUrls != null && !imageUrls.isEmpty()) {
                    for (String imageUrl : imageUrls) {
            %>
            <div class="image-item">
                <img src="<%= imageUrl %>" alt="Image"><br>
            </div>
            <% 
                    }
                } else {
            %>
            <div>No images available.</div>
            <% } %>
        </div>
    </div>
</body>

</html>
