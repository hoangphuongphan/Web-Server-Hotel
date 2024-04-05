

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Service"%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Service</title>
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

        <h2>Update Service</h2>

        <form action="update" method="post" class="form-container">

            <label for="title" class="form-label">Title:</label>
            <input type="text" id="title" name="title" value="${service.title}" required class="form-input">

            <label for="thumbnail" class="form-label">thumbnail URL:</label>
            <input type="text" id="thumbnail" name="thumbnail" value="${service.getImageURL()}" required class="form-input">

            <label for="description" class="form-label">Description:</label>
            <textarea id="description" name="description" rows="4" required class="form-input">${service.description}</textarea>

            <label for="markdown" class="form-label">Markdown:</label>
            <textarea id="markdown" name="markdown"  rows="4" required class="form-input">${service.markdown}</textarea>

            <label for="price" class="form-label">Price:</label>
            <input type="text" id="price" name="price" value="${service.price}"  required class="form-input"/>


            <input type="hidden" name="id" value="${service.id}" class="form-hidden">

            <input type="submit" value="Update" class="form-submit">

        </form>

    </body>
</html>
