<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Creazione arma</title>
	<script type="text/javascript" src="../scripts/utils.js"></script>
</head>
<body>
	<div>
	  <form action="#" method="post">
		  <label for="Name">Nome:</label>
		  <br>
		  <input type="text" id="Name" name="Nome" onChange="return checkNome(this)"  >
		  <br><br>
		  <label for="desc">Descrizione:</label>
		  <br>
		  <input type="text" id="desc" name="Descrizione" >
		  <br><br>
		  <label for="Pot">Potenza:</label>
		  <br>
		  <input type="number" id="Pot" name="Potenza" >
		  <br><br>
		  <label for="Peso">Peso:</label>
		  <br>
		  <input type="number" id="Peso" name="Peso" >
		  <br><br>
		  <label for="Liv">Livello:</label>
		  <br>
		  <input type="number" id="Livello" min="0" max="10" value="0">
		  <br><br>
		  <label for="TipoDanno">Tipo di Danno:</label>
		  <br>
		  <select name="TipoDanno" id="TipoDanno">
		    <option value="Contundente">Contundente</option>
		    <option value="Taglio">Taglio</option>
		    <option value="Fisico">Fisico</option>
		    <option value="Elementare">Elementare</option>
		    <option value="Contundente_Elementare">Contundente_Elementare</option>
		    <option value="Taglio_Elementare">Taglio_Elementare</option>
		  </select> 
		  <br><br>
		  <label for="Stabilita">Stabilita':</label>
		  <br>
		  <input type="number" id="Stabilita" name="Stabilita" >
		  <br><br>
		  <label for="RiduzioneDanno">Riduzione del danno:</label>
		  <br>
		  <input type="number" id="RiduzioneDanno" name="RiduzioneDanno" >
		  <br><br>
		  <label for="Scaling">Scaling:</label>
		  <br>
		  <input type="text" id="Scaling" name="Scaling" >
		  <br><br>
		  <input type="submit" value="Inserisci">
	  </form>
	</div>
</body>
</html>