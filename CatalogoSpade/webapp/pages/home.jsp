<%@ page errorPage="./errors/failure.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link href="./style/style.css" rel="stylesheet" type="text/css">    
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="./scripts/utils.js"></script>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html;">
		<title>Catalogo Spade</title>
	</head>
	<body style="color:white">
		<h2>Benvenuto</h2>
		<p>
		Hai appena aperto il nostro catalogo delle armi di Dark Souls.<br>
		<br>
		All'interno di questo catalogo potrai:
		<ul>
			<li>visualizzare il catalogo</li>
			<li>aggiungere armi</li>
			<li>modificare le caratteristiche delle armi</li>
			<li>eliminare le armi</li>
			<li>ricercare per categoria</li>
			<li>ricercare per abilita'</li>
			<li>visualizzare le categorie</li>
			<li>visualizzare le abilita'</li>
			<li>visualizzare le munizioni</li>
		</ul>
		<br>
		Naviga nel nostro catalogo!
		</p>
		<br>
		<form action="homeServlet" method="get">
		  <input type="text" id="name" name="nomeArma" value="" placeholder="Ricerca arma" onChange="controlName(this)">
		  <input type="submit" name="cerca" value="Cerca">
		</form>
		  <br>
		<form action="homeServlet" method="get">
			<input type="submit" name="catalogo" value="Mostra Catalogo">
			<input type="submit" name="categorie" value="Mostra Categorie">
			<input type="submit" name="abilita" value="Mostra Abilita">
			<input type="submit" name="munizioni" value="Mostra Munizioni">
		</form>
		<form action="logInServlet" method="get">
			<input type="submit" name="login" value="accedi">
		</form>
	</body>
</html>