<%@ page import="beans.ListaArmi"%>
<%@ page import="beans.Arma"%>
<%@ page import="java.util.*"%>
<html>
	<head>
	<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>		
		<p>Qua mostreremo la lista delle armi</p>
		<ul>
		<% ListaArmi listaArmi = (ListaArmi) request.getAttribute("listaArmi");
		for(int x=0;x < listaArmi.getListaArmi().size() ;x++ ) { %>
		<li><%=listaArmi.getListaArmi().get(x).toString() %></li>
		<%} %>
		</ul>
	</body>
</html>