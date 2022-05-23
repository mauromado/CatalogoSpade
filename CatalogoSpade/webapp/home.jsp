<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html;">
		<title>Catalogo Spade</title>
		<script type="text/javascript" src="./scripts/utils.js"></script>
	</head>
	<body>
		<%if((boolean)request.getAttribute("esitoOperazione")){
			successAlert();
		} %>
		<h2>Benvenuto</h2>
		<br>
		<p>
		Hai appena aperto il nostro catalogo delle spade di Dark Souls.<br>
		All'interno di questro catalogo potrai:
		<ul>
			<li>aggiungere armi</li>
			<li>modificare le caratteristiche delle armi</li>
			<li>eliminare le armi</li>
		</ul>
		clicca il bottone sottostante per visionare il catalogo delle armi
		</p>
		<form action="mostraCatalogoServlet" method="get">
			<input type="submit" name="catalogo" value="mostraCatalogo">
		</form>
	</body>
</html>