

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Service"%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Service</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            h2 {
                color: #333;
            }

            .form-container {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                background-color: #f4f4f4;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-label {
                display: block;
                margin-bottom: 8px;
            }

            .form-input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-hidden,
            .form-submit {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .form-submit:hover {
                background-color: #45a049;
            }

        </style>
    </head>

    <body>

        <form action="create" method="post" class="form-container">

            <label for="title" class="form-label">Name Service:</label>
            <input type="text" id="title" name="title" required class="form-input">

            <label for="price" class="form-label">Price:</label>
            <input type="number" id="price" name="price"  required class="form-input"/>

            <label for="description" class="form-label">Description:</label>
            <textarea id="description" name="description" rows="4" required class="form-input"></textarea>

            <label for="markdown" class="form-label">Markdown:</label>
            <textarea id="markdown" name="markdown"  rows="4" required class="form-input"></textarea>

            <label for="thumbnail" class="form-label">thumbnail URL:</label>
            <input type="text" id="thumbnail" name="thumbnail"  required class="form-input">
            <div class="form-group container_image">

            </div>

            <div class="form-group">
                <button type="button" onclick="addImageInput()">Add Image</button>
            </div>

            <input type="submit" value="Create" class="form-submit">

        </form>

    </body>

</html>
<script>
    function addImageInput() {
        // Create a new input element for the image URL
        var imageInput = document.createElement("input");
        imageInput.type = "text";
        imageInput.className = "form-control form-input";
        imageInput.placeholder = "Image URL";
        imageInput.name = "imageUrl"; // Set the name attribute as needed

        // Create a new delete button
        var deleteButton = document.createElement("button");
        deleteButton.type = "button";
        deleteButton.textContent = "Delete";
        deleteButton.className = "btn btn-danger";
        deleteButton.onclick = function () {
            // Remove the parent container when the delete button is clicked
            this.parentNode.remove();
        };

        // Create a div container to hold the input and delete button
        var inputContainer = document.createElement("div");
        inputContainer.className = "input-container";
        inputContainer.appendChild(imageInput);
        inputContainer.appendChild(deleteButton);

        // Get the container div and append the input container to it
        var containerDiv = document.querySelector('.container_image');
        containerDiv.appendChild(inputContainer);
    }
</script>