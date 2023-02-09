<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 09/02/2023
  Time: 2:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <style>
        label {
            width: 150px;
        }
    </style>
</head>
<body>
<form action="/display-discount" method="post">
    <div class="mb-2">
        <label for="pd">Product Description</label>
        <input type="text" name="product-description" id="pd">
    </div>
    <div class="mb-2">
        <label for="lp">List Price</label>
        <input type="text" name="list-price" id="lp">
    </div>
    <div class="mb-2">
        <label for="dp">Discount Percent</label>
        <input type="text" name="discount-percent" id="dp">
    </div>
    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>
