<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 10/02/2023
  Time: 10:27 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link rel="stylesheet" href="./css/bootstrap.css">
</head>
<body>
<a class="mb-2" href="/customer">Hiển thị danh sách</a>
<table class="table">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Hình ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="stt">
        <tr>
            <td>${stt.count}</td>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.img}" alt=""></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
