<%@ page import="beans.ListaCategoria"%>
<%@ page import="java.util.*"%>
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
		  <input type="text" id="name" name="nome" value="" placeholder="nome arma" onChange="return checkNome(this.form)" >
		  <br><br>
		  <label for="Pot">Potenza:</label>
		  <br>
		  <input type="number" id="pot" name="potenza" value="0" onChange="checkNumber(this)">
		  <br><br>
		  <label for="Peso">Peso:</label>
		  <br>
		  <input type="number" id="peso" name="peso" value="0" onChange="checkNumber(this,0,500)" >
		  <br><br>
		  <label for="Liv">Livello:</label>
		  <br>
		  <input type="number" id="livello" name="livello" value="0" onChange="checkNumber(this,0,10)" >
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
		  <input type="number" id="stabilita" name="stabilita" value="0" onChange="checkNumber(this,0,500)">
		  <br><br>
		  <label for="RiduzioneDanno">Riduzione del danno:</label>
		  <br>
		  <input type="number" id="riduzioneDanno" name="riduzioneDanno" value="0" onChange="checkNumber(this,0,500)">
		  <br><br>
		  <label for="Scaling">Scaling:</label>
		  <br>
		  <input type="text" id="scaling" name="scaling" value="" placeholder="scaling arma" onChange="isCorrectScaling(this.form)">
		   (nota:formato scaling:[S,A,B,C,D,E][str,dex,int,fth] divisi da virgole)
		  <br><br>
		  <label for="nomeCategoria">Categoria arma:</label>
		  <br>
		  <select name="nomeCategoria" id="nomeCategoria" value="armaBianca" required>
          	  <%ListaCategoria listaNomiCategoria = (ListaCategoria) request.getAttribute("listaNomiCategorie");
              	for(int x=0; x<listaNomiCategoria.getListaNomiCategorie().size(); x++){ %>
              	<option value ="<%= listaNomiCategoria.getListaNomiCategorie().get(x) %>"><%= listaNomiCategoria.getListaNomiCategorie().get(x) %>
           	   <%} %>
		  </select> 
		  <br><br>
		  <input id="insertButton" type="submit" value="inserisci" disabled>
	  </form>
	</div>
</body>
</html>