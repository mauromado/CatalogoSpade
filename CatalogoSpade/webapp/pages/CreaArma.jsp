<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Creazione arma</title>
	<script type="text/javascript" src="./scripts/utils.js"></script>
	
</head>
<body>
	<div>
	  <form action="inserimentoServlet" method="post">
		  <label for="Name">Nome:</label>
		  <br>
		  <input type="text" id="name" name="nome" onChange="return checkNome(this.form)"  >
		  <br><br>
		  <label for="Pot">Potenza:</label>
		  <br>
		  <input type="number" id="pot" name="potenza" min="0">
		  <br><br>
		  <label for="Peso">Peso:</label>
		  <br>
		  <input type="number" id="peso" name="peso" min="0">
		  <br><br>
		  <label for="Liv">Livello:</label>
		  <br>
		  <input type="number" id="livello" name="livello" min="0" max="10" value="0">
		  <br><br>
		  <label for="TipoDanno">Tipo di Danno:</label>
		  <br>
		  <select name="tipoDanno" id="tipoDanno">
		    <option value="contundente">Contundente</option>
		    <option value="taglio">Taglio</option>
		    <option value="fisico">Fisico</option>
		    <option value="elementare">Elementare</option>
		    <option value="contundenteElementare">Contundente Elementare</option>
		    <option value="taglioElementare">Taglio Elementare</option>
		  </select> 
		  <br><br>
		  <label for="Stabilita">Stabilita':</label>
		  <br>
		  <input type="number" id="stabilita" name="stabilita" min="0">
		  <br><br>
		  <label for="RiduzioneDanno">Riduzione del danno:</label>
		  <br>
		  <input type="number" id="riduzioneDanno" name="riduzioneDanno" min="0">
		  <br><br>
		  <label for="Scaling">Scaling:</label>
		  <br>
		  <input type="text" id="scaling" name="scaling" onChange="isCorrectScaling(this.form)">
		   (nota:formato scaling:[S,A,B,C,D,E][str,dex,int,fth],...)
		  <br><br>
		  <input type="submit" value="inserisci">
	  </form>
	</div>
</body>
</html>