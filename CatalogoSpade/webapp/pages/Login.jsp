<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accedi</title>
<script type="text/javascript" src="./scripts/utils.js"></script>
<link href="./style/style.css" rel="stylesheet" type="text/css">
</head>
<body class="sfondo2">
	<h1 align="center">Accedi per continuare</h1>
	<br><br>
	<form action="loginServlet" method="post">
		<label for="Username">Username:</label>
		<br>
		<input type="text" id="Username" name="username" required>
		<br>
		<label for="Password">Password:</label>
		<br>
		<input type="password" id="Password" name="password" required>
		<input type="checkbox" onclick="mostraPassword('Password')">Mostra password
		<br>
		<input type="submit" name="login" value="accedi">
	</form>
</body>
</html>