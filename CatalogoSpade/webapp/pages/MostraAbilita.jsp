<%@ page import="beans.ListaAbilita"%>
<%@ page import="beans.Abilita"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Abilita' Disponibili</title>
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
</body>
</html>