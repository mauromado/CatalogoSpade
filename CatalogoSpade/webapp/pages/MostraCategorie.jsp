<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaCategoria"%>
<%@ page import="beans.Categoria"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categorie Disponibili</title>
</head>
<body>
	<%ListaCategoria listaCategoria = (ListaCategoria)request.getAttribute("listaCategorie");
	  List<Categoria> lista = listaCategoria.getListaNomiCategorie();%>
	<ul>
		<%for (int i = 0; i<lista.size(); i++){%>
		<li>nome:<%=lista.get(i).getNome() %>, descrizione: <%=lista.get(i).getDescrizione() %></li>
		<%} %>		
	</ul>
</body>
</html>