<%@ page import="beans.ListaArmi"%>
<%@ page import="beans.Arma"%>
<%@ page import="java.util.*"%>
<html>
<head>
<style>
th, td {
	border: 2px solid black;
	padding: 10px;
	background-color: white;
	text-align: center;
}

#tabellaArmi {
	border-width: 2px;
	border-colore: #fa720a;
	padding: 10px;
	background-color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>Catalogo Armi</title>
</head>
<body>
	<p>Qua mostreremo la lista delle armi</p>
	<table id="tabellaArmi">
		<caption>Elenco armi attualmente inserite</caption>
		<thead>
			<tr>
				<th colspan="9">Catalogo Armi</th>
			</tr>
			<tr>
				<td>Nome</td>
				<td>Potenza</td>
				<td>Peso</td>
				<td>Livello</td>
				<td>TipoDanno</td>
				<td>Stabilità</td>
				<td>Riduzione Danno</td>
				<td>Scaling</td>
				<td>Nome categoria</td>
			</tr>
		</thead>
		<tbody>

			<%
			ListaArmi listaArmi = (ListaArmi) request.getAttribute("listaArmi");
			for (int x = 0; x < listaArmi.getListaArmi().size(); x++) {
				Arma tempArma = listaArmi.getListaArmi().get(x);
			%>
			<tr>
				<td><%=tempArma.getNome()%></td>
				<td><%=tempArma.getPotenza()%></td>
				<td><%=tempArma.getPeso()%></td>
				<td><%=tempArma.getLivello()%></td>
				<td><%=tempArma.getTipoDanno()%></td>
				<td><%=tempArma.getStabilita()%></td>
				<td><%=tempArma.getRiduzioneDanno()%></td>
				<td><%=tempArma.getScaling()%></td>
				<td><%=tempArma.getNomeCategoria()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>