<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Categoria"%>
<%@ page import="java.util.*"%>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>

<script>
function toggleTabella(){
	var tabella = document.getElementById('inserisciCategoria');
	var status = tabella.style.display;
	if(status == 'block'){
		tabella.style.display = 'none';
	}else{
		tabella.style.display = 'block';
	}
}
</script>

<meta charset="ISO-8859-1">
<title>Categorie Disponibili</title>
</head>
<body onload="getTabella()">
	<table id="tabellaArmi" align="center">
		<thead>
			<tr>
				<th colspan="3">Catalogo Categorie</th>
			</tr>
			<tr>
				<td>Nome</td>
				<td>Descrizione</td>
				<td>Aggiorna/Elimina</td>
			</tr>
		</thead>
		<tbody>
	
				<%ListaCategoria listaNomiCategorie = (ListaCategoria) request.getAttribute("listaCategorie");
				for (int x = 0; x < listaNomiCategorie.getListaNomiCategorie().size(); x++) {
				Categoria tempCat = listaNomiCategorie.getListaNomiCategorie().get(x);
				String coloreRiga = x%2 == 0? "coloriDispari": "coloriPari"; %>
			<tr class = <%= coloreRiga %>>
				<td><%=tempCat.getNome()%></td>
				<td><%=tempCat.getDescrizione()%></td>
				<td>
				<form action="armaServlet" method="post" id="cancellaCategoria">
					<input type="submit" name="cancellaCategoria" value="Cancella <%=tempCat.getNome()%>";>
				</form>
				<input type="submit" name="modificaCategoria" value="Modifica <%=tempCat.getNome()%>";>
				</td>
			</tr>
				<%
				}
				%>
		</tbody>
	</table>
	
	<input type="submit" name="aggiugiCategoria" value="Aggiungi categoria" onClick="toggleTabella();">
	<form action="armaServlet" method="post" id="inserisciCategoria" hidden>
	<label for="Name">Nome:</label>
	<br>
	<input type="text" id="name" name="nome" value="" placeholder="Nome categoria">
	<br><br>
	<label for="descrizione">Descrizione:</label>
	<br>
	<input type="text" id="descrizione" name="descrizione" value="" placeholder="Descrizione">
	<br>
	<input id="insertButton" type="submit" name="tipoOperazione" value="InserisciCategoria">
	</form>
	

	