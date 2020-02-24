<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mattg
  Date: 20-02-2020
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Huskeliste</title>
</head>
<body>

${sessionScope.besked}
<h2>Du kan nu tilføje emner til din indkøbskurv.</h2>

<form action="AddItemServlet" method="post">
    <label for="fname">Indtast vare:</label><br>
    <input type="text" id="fname" name="vareNavn"><br><br>
    <input type="submit" value="Tilføj">
</form>

<br>
${requestScope.besked}
<br>

<c:forEach var="element" items="${sessionScope.basket}">
    ${element}<br>
</c:forEach>

<br><br>
<form action="LogoutServlet" method="post">
<%--    <label for="fname">Indtast vare:</label><br>--%>
<%--    <input type="text" id="fname" name="vareNavn"><br><br>--%>
    <input type="submit" value="Logout">
</form>

</body>
</html>
