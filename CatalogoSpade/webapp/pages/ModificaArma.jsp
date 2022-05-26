<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Arma"%>
<%@ page import="beans.ListaAbilita"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="ISO-8859-1">
	<title>Modifica arma</title>
	
	<script>
	let dictAbilita = {};
	<%ListaAbilita listaAbilita = (ListaAbilita) request.getAttribute("listaNomiAbilita");
	for(int x=0;x<listaAbilita.getListaAbilita().size();x++){%>
		dictAbilita['<%=listaAbilita.getListaAbilita().get(x).getNome()%>']='<%=listaAbilita.getListaAbilita().get(x).getTipologiaArma()%>';
	<%}%>
	</script>
	<script type="text/javascript" src="./scripts/utils.js"></script>
	
	<%
	Arma arma = (Arma)request.getAttribute("armaToUpdate"); 
	String tempNome= arma.getNome();
	request.setAttribute("nome",tempNome);
	%>
</head>
	    
<body onload="changeAbilitaDisponibili( '<%=arma.getNomeCategoria()%>' )">
	  <form action="armaServlet?arma=<%= tempNome%>" method="post">
		  <label for="Name">Nome:</label>
		  <br>
		  <input type="text" id="name" name="nome" value="<%= arma.getNome() %>" onChange="return checkNome(this.form)" readonly>
		  <br><br>
		  <label for="Pot">Potenza:</label>
		  <br>
		  <input type="number" id="pot" name="potenza" value="<%= arma.getPotenza() %>" onChange="checkNumber(this)">
		  <br><br>
		  <label for="Peso">Peso:</label>
		  <br>
		  <input type="number" id="peso" name="peso" value="<%= arma.getPeso() %>" onChange="checkNumber(this,0,500)" >
		  <br><br>
		  <label for="Liv">Livello:</label>
		  <br>
		  <input type="number" id="livello" name="livello" value="<%= arma.getLivello() %>" onChange="checkNumber(this,0,10)" >
		  <br><br>
		  <label for="TipoDanno">Tipo di Danno:</label>
		  <br>
		  <select name="tipoDanno" id="tipoDanno" value="<%= arma.getTipoDanno() %>">
		    <option 
		    <%=("contundente".equals( arma.getTipoDanno().toLowerCase() ) )? "selected" : ""%>
		    value="contundente">Contundente
		    </option>
		    
		    <option 
		    <%=("taglio".equals( arma.getTipoDanno().toLowerCase() ) )? "selected" : ""%>
		    value="taglio">Taglio
		    </option>
		    
		    <option 
		    <%=("fisico".equals( arma.getTipoDanno().toLowerCase() ) )? "selected" : ""%>
		    value="fisico">Fisico
		    </option>
		    
		    <option 
		    <%=("elementare".equals( arma.getTipoDanno().toLowerCase() ) )? "selected" : ""%>
		    value="elementare">Elementare
		    </option>
		    
		    <option 
		    <%=("contundenteelementare".equals( arma.getTipoDanno().toLowerCase() ) )? "selected" : ""%>
		    value="contundenteElementare">Contundente Elementare
		    </option>
		    
		    <option 
		    <%=("taglioelementare".equals( arma.getTipoDanno().toLowerCase() ) )? "selected" : ""%>
		    value="taglioElementare">Taglio Elementare
		    </option>
		    
		  </select> 
		  <br><br>
		  <label for="Stabilita">Stabilita':</label>
		  <br>
		  <input type="number" id="stabilita" name="stabilita" value="<%= arma.getStabilita() %>" onChange="checkNumber(this,0,500)">
		  <br><br>
		  <label for="RiduzioneDanno">Riduzione del danno:</label>
		  <br>
		  <input type="number" id="riduzioneDanno" name="riduzioneDanno" value="<%= arma.getRiduzioneDanno() %>" onChange="checkNumber(this,0,500)">
		  <br><br>
		  <label for="Scaling">Scaling:</label>
		  <br>
		  <input type="text" id="scaling" name="scaling" value="<%= arma.getScaling() %>" placeholder="scaling arma" onChange="isCorrectScaling(this.form)">
		   (nota:formato scaling:[S,A,B,C,D,E][str,dex,int,fth] divisi da virgole)
		  <br><br>
		  <label for="nomeCategoria">Categoria arma:</label>
		  <br>
		  <select name="nomeCategoria" id="nomeCategoria" value="<%= arma.getNomeCategoria() %>" required onChange="changeAbilitaDisponibili(this.value)">
          	  <%ListaCategoria listaNomiCategoria = (ListaCategoria) request.getAttribute("listaNomiCategorie");
              	for(int x=0; x<listaNomiCategoria.getListaNomiCategorie().size(); x++){ %>
              	<option 
              	<%=( listaNomiCategoria.getListaNomiCategorie().get(x).getNome().toLowerCase().equals( arma.getNomeCategoria().toLowerCase() ) )? "selected" : ""%> 
              	value ="<%= listaNomiCategoria.getListaNomiCategorie().get(x).getNome() %>"
              	>
              	<%= listaNomiCategoria.getListaNomiCategorie().get(x).getNome() %>
           	   <%} %>
		  </select>
		  <br><br> 
		  <label for="nomeAbilita">Abilita' arma:</label>
		  <br>
		  <select name="nomeAbilita" id="nomeAbilita">
          	  <%listaAbilita = (ListaAbilita) request.getAttribute("listaNomiAbilita");
          	  for(int x=0; x<listaAbilita.getListaAbilita().size(); x++){ %>
          	  
              	<option
              	<%=( listaAbilita.getListaAbilita().get(x).getNome().toLowerCase().equals( arma.getNomeAbilita().toLowerCase() ) )? "selected" : ""%> 
              	value ="<%= listaAbilita.getListaAbilita().get(x).getNome() %>"
              	>
              	<%= listaAbilita.getListaAbilita().get(x).getNome() %>
              	
           	   <%}%>
		  </select> 
		  <br><br>
		  <input id="insertButton" type="submit" name="tipoOperazione" value="modifica">
	  </form>
	</div>
</body>
</html>