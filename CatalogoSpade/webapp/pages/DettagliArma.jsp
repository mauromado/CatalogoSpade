<%@ page errorPage="../errors/failure.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="beans.Arma"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli arma</title>
</head>
<body align="center">
	<%Arma arma = (Arma)request.getAttribute("detailsArma");%>
	<h1><%=arma.getNome().toUpperCase() %></h1>
	<table border="1" align="center">
		<caption>Dettagli arma</caption>
		
		<tr>
				<th colspan="2"><%=arma.getNome().toUpperCase() %></th>
		</tr>
		<tr>
				<td>Nome</td>
				<td><%=arma.getNome()%></td>
		</tr>
		<tr>
				<td>Potenza</td>
				<td><%=arma.getPotenza()%></td>
		</tr>
		<tr>
				<td>Peso</td>
				<td><%=arma.getPeso()%></td>
		</tr>
		<tr>
				<td>Livello</td>
				<td><%=arma.getLivello()%></td>
		</tr>
		<tr>
				<td>Tipo Di Danno</td>
				<td><%=arma.getTipoDanno()%></td>
		</tr>
		<tr>
				<td>Stabilita'</td>
				<td><%=arma.getStabilita()%></td>
		</tr>
		<tr>
				<td>Riduzione Danno</td>
				<td><%=arma.getRiduzioneDanno()%></td>
		</tr>
		<tr>
				<td>Scaling</td>
				<td><%=arma.getScaling()%></td>
		</tr>
		<tr>
				<td>Categoria</td>
				<td><%=arma.getNomeCategoria()%></td>
		</tr>
		<tr>
			<td>Abilita'</td>
			<td><%=arma.getNomeAbilita()%></td>
		</tr>
	</table>
	<a href = "./armaServlet?updateArma=<%=arma.getNome()%>">Aggiorna</a>
	&nbsp;&nbsp;
	<a href = "./armaServlet?deleteArma=<%=arma.getNome()%>">Elimina</a>
	
</body>
</html>