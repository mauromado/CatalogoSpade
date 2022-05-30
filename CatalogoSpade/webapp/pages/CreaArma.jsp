<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.ListaAbilita"%>
<%@ page import="java.util.*"%>

<link href="./style/style.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Creazione arma</title>
	
	<script>
	let dictAbilita = {};
	<%ListaAbilita listaAbilita = (ListaAbilita) request.getAttribute("listaNomiAbilita");
	for(int x=0;x<listaAbilita.getListaAbilita().size();x++){%>
		dictAbilita['<%=listaAbilita.getListaAbilita().get(x).getNome()%>']='<%=listaAbilita.getListaAbilita().get(x).getNomeCategoria()%>';
	<%}%>
	</script>
	<script type="text/javascript" src="./scripts/utils.js"></script>
	
</head>
<body onload="bootStrapPageCreaArmi()" style="color:white">
	<div>
	  <form action="armaServlet" method="post">
		  <label for="Name">Nome:</label>
		  <br>
		  <input type="text" id="name" name="nome" value="" placeholder="nome arma" onChange="checkNome(this.form); controlName(this)">
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
		  <select name="nomeCategoria" id="nomeCategoria" value="armaBianca" required onChange="changeAbilitaDisponibili(this.value)">
		  	  <option value="" disabled selected>Scegli una categoria</option>
          	  <%ListaCategoria listaNomiCategoria = (ListaCategoria) request.getAttribute("listaNomiCategorie");
              	for(int x=0; x<listaNomiCategoria.getListaNomiCategorie().size(); x++){ %>
              	<option value ="<%= listaNomiCategoria.getListaNomiCategorie().get(x).getNome() %>"><%= listaNomiCategoria.getListaNomiCategorie().get(x).getNome() %>
           	   <%} %>
		  </select> 
		  <br><br>
		  <label for="nomeAbilita">Abilita' arma:</label>
		  <br>
		  <select name="nomeAbilita" id="nomeAbilita" disabled>
		      <option value="" disabled selected>Scegli un'abilita'</option>
          	  <%listaAbilita = (ListaAbilita) request.getAttribute("listaNomiAbilita");
          	  for(int x=0; x<listaAbilita.getListaAbilita().size(); x++){ %>
              	<option value ="<%= listaAbilita.getListaAbilita().get(x).getNome() %>"><%= listaAbilita.getListaAbilita().get(x).getNome() %>
           	   <%}%>
		  </select> 
		  <br><br>
		  <input id="insertButton" type="submit" name="tipoOperazione" value="inserisci" disabled>
	  </form>
	</div>
</body>
</html>