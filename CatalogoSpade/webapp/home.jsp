<%@ page errorPage="./errors/failure.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html;">
		<title>Catalogo Spade</title>
	</head>
	<body>
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
		<form action="homeServlet" method="get">
			<input type="submit" name="catalogo" value="Mostra Catalogo">
			<input type="submit" name="categorie" value="Mostra Categorie">
			<input type="submit" name="abilita" value="Mostra Abilita">
			<input type="submit" name="munizioni" value="Mostra Munizioni">
		</form>
	</body>
</html>