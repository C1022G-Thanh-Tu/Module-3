<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/02/2023
  Time: 3:22 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>demo servlet</title>
</head>
<body>
<h1>Test demo</h1>
<form action="/tu" method="post">
    <input type="text" name="n1">
    <input type="text" name="n2">
    <button>Cộng</button>
</form>
<p>Kết quả là ${tong}</p>
</body>
</html>
