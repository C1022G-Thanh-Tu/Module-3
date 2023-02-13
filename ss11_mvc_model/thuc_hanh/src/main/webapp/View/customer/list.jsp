<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13/02/2023
  Time: 11:08 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
</head>

<body>
<a href="/customers?actionUser=create">Create new customer</a>
<table class="table">
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${customerList}" varStatus="stt">
            <tr>
                <td>${stt.count}</td>
                <td><a href="/customers?actionUser=view&id=${customer.id}">${customer.getName()}</a></td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td><a href="/customers?actionUser=edit&id=${customer.id}">edit</a></td>
                <td><a href="/customers?actionUser=delete&id=${customer.id}">delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
