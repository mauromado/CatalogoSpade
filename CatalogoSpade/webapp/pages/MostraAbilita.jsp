<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaAbilita"%>
<%@ page import="beans.Abilita"%>
<%@ page import="beans.ListaCategoria"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Abilita' Disponibili</title>
<script>
function hideDisplayForm(){
	 form=document.getElementById("formInserisciAbilita");
	 if(form.style.display==="block")
		 form.style.display="none";
	 else
		 form.style.display="block";
}
</script>

</head>
<body>
	<%ListaAbilita listaAbilita = (ListaAbilita)request.getAttribute("listaAbilita");
	  List<Abilita> lista = listaAbilita.getListaAbilita();%>
	<ul>
		<%for (int i = 0; i<lista.size(); i++){%>
		<li>nome:<%=lista.get(i).getNome() %>,
		 descrizione: <%=lista.get(i).getDescrizione() %>,
		 tipologiaArma: <%=lista.get(i).getTipologiaArma() %></li>
		<%} %>		
	</ul>
	<br><br>
	
	<input type="button" id="insertButton" value="Inserisci nuova abilità" onClick="hideDisplayForm()">
	<br><br>
	<form action="armaServlet" method="post" id="formInserisciAbilita" hidden>
 		<label for="Name">Nome:</label>
		<br>
		<input type="text" id="name" name="nome" placeholder="Nome abilita'" onChange="" >
		<br><br>
		<label for="Name">Descrizione:</label>
		<br>
		<textarea rows = "5" cols = "60" id="descrizione" name = "descrizione" placeholder="Descrizione abilita'"></textarea>
        <br><br>
		<select name="nomeCategoria" id="nomeCategoria" value="armaBianca" required>
			<option value="" disabled selected>Scegli la categoria delle armi</option>
          	<%ListaCategoria listaNomiCategoria = (ListaCategoria) request.getAttribute("listaCategorie");
              for(int x=0; x<listaNomiCategoria.getListaNomiCategorie().size(); x++){ %>
            <option value ="<%= listaNomiCategoria.getListaNomiCategorie().get(x).getNome() %>"><%= listaNomiCategoria.getListaNomiCategorie().get(x).getNome() %>
           	<%}%>
		  </select>
		<br><br>
		<input id="insertButton" type="submit" name="tipoOperazione" value="Inserisci abilita">
	</form>
</body>
</html>