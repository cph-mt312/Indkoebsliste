<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mattg
  Date: 20-02-2020
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>

<h2>Her kan du se listen af brugere og evt. slette.</h2>

${requestScope.besked}<br>

<h3>Slet bruger</h3>

<form action="AdminServlet" method="post">
    <label for="fname">Brugernavn:</label><br>
    <input type="text" id="fname" name="navn"><br><br>
    <input type="submit" value="Slet">
</form>
<br><br>

<c:forEach var="element" items="${applicationScope.brugerMap}">
    ${element}
    <br>

</c:forEach>

</body>
</html>
