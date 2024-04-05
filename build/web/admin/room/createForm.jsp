<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Room Type</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 20px;
        }
        h2 {
            color: #444;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Makes sure the padding doesn't affect the overall width */
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>Create New Room Type</h2>
<form action="createRoom" method="post">
    <div>
        <label for="roomName">Room Name:</label>
        <input type="text" id="roomName" name="roomName" required>
    </div>
    <div>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
    </div>
    <div>
        <label for="overview">Overview:</label>
        <textarea id="overview" name="overview" required></textarea>
    </div>
    <div>
        <label for="featured">featured</label>
        <textarea id="featured" name="featured" required></textarea>
    </div>
    <div>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" required>
    </div>
    <div>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>
    </div>
    <div>
        <label for="capacity">Capacity:</label>
        <input type="number" id="capacity" name="capacity" required>
    </div>
    <div>
        <label for="thumbnail">Thumbnail URL:</label>
        <input type="text" id="thumbnail" name="thumbnail" required>
    </div>
    <button type="submit">Create Room Type</button>
</form>
</body>
</html>
