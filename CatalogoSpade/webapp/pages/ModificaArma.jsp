<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Arma"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Creazione arma</title>
	<script type="text/javascript" src="./scripts/utils.js"></script>
	
</head>
<body>
<%Arma arma = (Arma)request.getAttribute("armaToUpdate"); %>
	<div>
	  <form action="armiServlet" method="post">
		  <label for="Name">Nome:</label>
		  <br>
		  <input type="text" id="name" name="nome" value=<%arma.getNome();%> placeholder="nome arma" onChange="return checkNome(this.form)" >
		  <br><br>
	  </form>
	</div>
</body>
</html>