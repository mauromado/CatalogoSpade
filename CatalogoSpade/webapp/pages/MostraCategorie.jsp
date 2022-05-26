<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Categoria"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/utils.js"></script>
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
				<form action="armaServlet" method="get" id="cancellaCategoria">
					<input type="hidden" name="nomeCategoria" value="<%=tempCat.getNome()%>">
					<input type="submit" name="deleteCategoria" value="Cancella <%=tempCat.getNome()%>";>
				</form>
				<input type="submit" name="modificaCategoria" value="Modifica <%=tempCat.getNome()%>" 
				onClick="populateForm(
				Array(
				'<%=tempCat.getNome()%>',
				'<%=tempCat.getDescrizione()%>',
				'Modifica categoria',
				) )">
				</td>
			</tr>
				<%
				}
				%>
		</tbody>
	</table>
	
	<input type="submit" name="aggiugiCategoria" value="Aggiungi categoria" onClick="hideDisplayForm('formInserisci');">
		<div class="leftForm">
		<form action="armaServlet" method="post" id="formInserisci"  hidden>
			<label for="Name">Nome:</label>
			<br>
			<input type="text" id="name" name="nome" value="" placeholder="Nome categoria" onChange="checkNome(this.form)">
			<br><br>
			<label for="descrizione">Descrizione:</label>
			<br>
			<textarea rows="5" cols="60" id="desc" name="descrizione" placeholder="Inserisci descrizione"></textarea>
			<br><br>
			<input id="insertButton" type="submit" name="tipoOperazione" value="Inserisci categoria">
		</form>
		</div>
		
		<div class="rightForm">
		<form action="armaServlet" method="post" id="formModifica" hidden>
			<br>
			<label for="Name">Nome:</label>
			<br>
			<input type="text" id="name" name="nome" value="" placeholder="Nome categoria" readonly>
			<br><br>
			<label for="descrizione">Descrizione:</label>
			<br>
			<textarea rows="5" cols="60" id="desc" name="descrizione" placeholder="Inserisci descrizione"></textarea>
			<br><br>
			<input id="insertButton" type="submit" name="tipoOperazione" value="Modifica categoria">
		</form>
		</div>
