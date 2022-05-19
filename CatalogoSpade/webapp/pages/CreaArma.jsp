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
		  <label for="Name">Nome: *</label>
		  <br>
<!-- 		  <input type="text" id="name" name="nome" onChange="return checkNome(this.form)"> -->
		  <input type="text" id="name" name="nome" pattern="[a-zA-Z][a-zA-Z'\s]*[a-zA-Z']?" required>
		  <br><br>
		  <label for="Pot">Potenza: *</label>
		  <br>
<!-- 		  <input type="number" id="pot" name="potenza" min="0"> -->
		  <input type="number" id="pot" name="potenza" min="0" value="0" required>
		  <br><br>
		  <label for="Peso">Peso: *</label>
		  <br>
<!-- 		  <input type="number" id="peso" name="peso" min="0"> -->
		  <input type="number" id="peso" name="peso" min="0" required>
		  <br><br>
		  <label for="Liv">Livello: *</label>
		  <br>
<!-- 		  <input type="number" id="livello" name="livello" min="0" max="10" value="0"> -->
		  <input type="number" id="livello" name="livello" min="0" max="10" value="0" required>
		  <br><br>
		  <label for="TipoDanno">Tipo di Danno: *</label>
		  <br>
<!-- 		  <select name="tipoDanno" id="tipoDanno"> -->
		  <select name="tipoDanno" id="tipoDanno" required>
		    <option value="contundente">Contundente</option>
		    <option value="taglio">Taglio</option>
		    <option value="fisico">Fisico</option>
		    <option value="elementare">Elementare</option>
		    <option value="contundenteElementare">Contundente Elementare</option>
		    <option value="taglioElementare">Taglio Elementare</option>
		  </select> 
		  <br><br>
		  <label for="Stabilita">Stabilita': *</label>
		  <br>
<!-- 		  <input type="number" id="stabilita" name="stabilita" min="0"> -->
		  <input type="number" id="stabilita" name="stabilita" min="0" required>
		  <br><br>
		  <label for="RiduzioneDanno">Riduzione del danno:</label>
		  <br>
		  <input type="number" id="riduzioneDanno" name="riduzioneDanno" min="0" value="0">
		  <br><br>
		  <label for="Scaling">Scaling:</label>
		  <br>
		  <input type="text" id="scaling" name="scaling" pattern="([SA-E](str|dex|int|fth)),?([SA-E](str|dex|int|fth),?)*$">
		   (nota:formato scaling:[S,A,B,C,D,E][str,dex,int,fth],...)
		  <br><br>
		  <label for="nomeCategoria">Categoria arma:</label>
          <br>
          <select name="nomeCategoria" id="nomeCategoria" value="armaBianca" required>
          <%ListaCategoria listaNomiCategoria = (ListaCategoria) request.getAttribute("listaNomiCategorie");
          	for(int x=0; x<listaNomiCategoria.getListaNomiCategorie().size(); x++){ %>
          	<option value ="<%= listaNomiCategoria.getListaNomiCategorie().get(x) %>"><%= listaNomiCategoria.getListaNomiCategorie().get(x) %></option>
          <%} %>
           <!-- <option value="armaBianca">Arma bianca</option>
            <option value="armaDistanza">Arma a distanza</option>
            <option value="scudo">Scudo</option> -->
          </select>
          <br><br>
		  <input type="submit" value="inserisci">
	  </form>
	</div>
</body>
</html>