<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="./scripts/utils.js">
</script>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body class="sfondo2">
<form action="loginServlet" method="post" onsubmit="return checkPassword('Password','PasswordConfirm') && checkEmail('Mail')">
	<label for="mail">Mail:</label>
	<br>
	<input type="text" id="Mail" name="mail">
	<br>
	<label for="Username">Username:</label>
	<br>
	<input type="text" id="Username" name="username">
	<br>
	<label for="Password">Password:</label>
	<br>
	<input type="password" id="Password" name="password" minlength="8" required>
	<input type="checkbox" onclick="mostraPassword('Password')">Mostra password
	<br>
	<label for="PasswordConfirm">Conferma password:</label>
	<br>
	<input type="password" id="PasswordConfirm" name="passwordConfirm" minlength="8" required>
	<input type="checkbox" onclick="mostraPassword('PasswordConfirm')">Mostra password
	<br><br>
	<input type="submit" name="registrazione" value="Registrati">
</form>

</body>
</html>