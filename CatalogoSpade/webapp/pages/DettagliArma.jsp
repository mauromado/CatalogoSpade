<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="beans.Arma"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli arma</title>
</head>
<body>
	<%Arma arma = (Arma)request.getAttribute("detailsArma");%>
	<%System.out.println(arma.toString()); %>
	<form action="armaServlet" method="get">
			<input type="submit" name="updateArma" value="Aggiorna">
			<input type="submit" name="deleteArma" value="Elimina">
	</form>
</body>
</html>