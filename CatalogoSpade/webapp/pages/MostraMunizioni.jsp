<%@ page import="beans.ListaMunizioni"%>
<%@ page import="beans.Munizioni"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Munizioni Disponibili</title>
</head>
<body>
	<%ListaMunizioni listaMunizioni = (ListaMunizioni)request.getAttribute("listaMunizioni");
	  List<Munizioni> lista = listaMunizioni.getListaNomiMunizioni();%>
	<ul>
		<%for (int i = 0; i<lista.size(); i++){%>
		<li>nome:<%=lista.get(i).getNome()%>, 
		descrizione: <%=lista.get(i).getDescrizione()%>, 
		danno: <%=lista.get(i).getDanno()%>, 
		tipo di danno: <%=lista.get(i).getTipoDanno()%> 
		</li>
		<%} %>		
	</ul>
</body>
</html>