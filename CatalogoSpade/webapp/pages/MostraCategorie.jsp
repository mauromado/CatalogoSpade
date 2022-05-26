<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Categoria"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="./scripts/utils.js"></script>

<meta charset="ISO-8859-1">
<title>Categorie Disponibili</title>
</head>
<body>

	<%ListaCategoria listaNomiCategorie = (ListaCategoria)request.getAttribute("listaCategorie");
	  List<Categoria> lista = listaNomiCategorie.getListaNomiCategorie();%>
	<ul>
		<%for (int i = 0; i<lista.size(); i++){%>
		<li>
		nome:<%=lista.get(i).getNome()%>, 
		descrizione:<%=lista.get(i).getDescrizione()%>,  
		</li>
		<%} %>		
	</ul>
	

		<input type="submit" name="aggiugiCategoria" value="Aggiungi categoria" onClick="hideDisplayForm();">

		<form action="armaServlet" method="post" id="formInserisci" hidden>
			<label for="Name">Nome:</label>
			<br>
			<input type="text" id="name" name="nome" value="" placeholder="Nome categoria" onChange="checkNome(this.form)">
			<br><br>
			<label for="descrizione">Descrizione:</label>
			<br>
			<textarea rows="5" cols="60" id="desc" name="descrizione" placeholder="Inserisci descrizione"></textarea>
			<br><br>
			<input id="insertButton" type="submit" name="tipoOperazione" value="InserisciCategoria">
		</form>

	