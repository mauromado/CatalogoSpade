<%@ page errorPage="../errors/failure.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="beans.Arma"%>

<link href="./style/style.css" rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli arma</title>
</head>
<body align="center" style="color:white">
	<%Arma arma = (Arma)request.getAttribute("detailsArma");%>
	<h1><%=arma.getNome().toUpperCase() %></h1>
	<table border="1" align="center" id="tabellaArmi">
		<caption>Dettagli arma</caption>
		
		<tr>
				<th colspan="2"><%=arma.getNome().toUpperCase() %></th>
		</tr>
		<tr class="coloriPari">
				<td>Nome</td>
				<td><%=arma.getNome()%></td>
		</tr>
		<tr class="coloriDispari">
				<td>Potenza</td>
				<td><%=arma.getPotenza()%></td>
		</tr>
		<tr class="coloriPari">
				<td>Peso</td>
				<td><%=arma.getPeso()%></td>
		</tr>
		<tr class="coloriDispari">
				<td>Livello</td>
				<td><%=arma.getLivello()%></td>
		</tr>
		<tr class="coloriPari">
				<td>Tipo Di Danno</td>
				<td><%=arma.getTipoDanno()%></td>
		</tr>
		<tr class="coloriDispari">
				<td>Stabilita'</td>
				<td><%=arma.getStabilita()%></td>
		</tr>
		<tr class="coloriPari">
				<td>Riduzione Danno</td>
				<td><%=arma.getRiduzioneDanno()%></td>
		</tr>
		<tr class="coloriDispari">
				<td>Scaling</td>
				<td><%=arma.getScaling()%></td>
		</tr>
		<tr class="coloriPari">
				<td>Categoria</td>
				<td><%=arma.getNomeCategoria()%></td>
		</tr>
		<tr class="coloriDispari">
			<td>Abilita'</td>
			<td><%=arma.getNomeAbilita()%></td>
		</tr>
	</table>
	<a href = "./armaServlet?updateArma=<%=arma.getNome()%>">Aggiorna</a>
	&nbsp;&nbsp;
	<a href = "./armaServlet?deleteArma=<%=arma.getNome()%>">Elimina</a>
	&nbsp;&nbsp;
	<button onClick="document.location='pages/home.jsp'">Torna alla home</button>
	
</body>
</html>