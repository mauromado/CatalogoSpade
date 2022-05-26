<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Categoria"%>
<%@ page import="java.util.*"%>

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
	

		<input type="submit" name="aggiugiCategoria" value="Aggiungi categoria" onClick="toggleTabella(this.parentNode);">

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

	