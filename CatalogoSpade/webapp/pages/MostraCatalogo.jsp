<%@ page import="beans.ListaArmi"%>
<%@ page import="beans.Arma"%>
<%@ page import="java.util.*"%>
<html>
<head>
<style>
a:link, a:visited {
  color: #F2E37C;
  text-decoration: none;
}
a:hover {
  color: #F2E37C;
  text-decoration: underline;
}
a:active {
  color: #F55850;
  text-decoration: none;
}
th, td {
	border: 2px solid #5B594C;
	padding: 10px;
	background-color: #5B594C;
	text-align: center;
}
.coloriDispari {
	color: #F353E3;
	}
.coloriPari {
	color: white;
}

#tabellaArmi {
	border-width: 2px;
	border-colore: #5B594C;
	padding: 10px;
	color: #F6F6F2;
	background-color: #F2E37C;
}
</style>
<meta charset="ISO-8859-1">
<title>Catalogo Armi</title>
</head>
<body>
	<table id="tabellaArmi">
		<caption>Elenco armi attualmente inserite</caption>
		<thead>
			<tr>
				<th colspan="10">Catalogo Armi</th>
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
				<td></td>
			</tr>
		</thead>
		<tbody>

			<%
			ListaArmi listaArmi = (ListaArmi) request.getAttribute("listaArmi");
			for (int x = 0; x < listaArmi.getListaArmi().size(); x++) {
				Arma tempArma = listaArmi.getListaArmi().get(x);
				String coloreRiga = x%2 == 0? "coloriDispari": "coloriPari"; 
			%>
			<tr class = <%= coloreRiga %>>
				<td><%=tempArma.getNome()%></td>
				<td><%=tempArma.getPotenza()%></td>
				<td><%=tempArma.getPeso()%></td>
				<td><%=tempArma.getLivello()%></td>
				<td><%=tempArma.getTipoDanno()%></td>
				<td><%=tempArma.getStabilita()%></td>
				<td><%=tempArma.getRiduzioneDanno()%></td>
				<td><%=tempArma.getScaling()%></td>
				<td><%=tempArma.getNomeCategoria()%></td>
				<td>
					<a href = "./armiServlet?updateArma=<%=tempArma.getNome()%>">Aggiorna</a>
					&nbsp;&nbsp;
					<a href = "./armiServlet?deleteArma=<%=tempArma.getNome()%>">Elimina</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan = "10">
					<a href = "./inserimentoServlet?insertArma">Inserisci nuova arma</a>
				</td>
			</tr>		
		</tfoot>
	</table>
</body>
</html>