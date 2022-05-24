<%@ page import="beans.ListaArmi"%>
<%@ page import="beans.Arma"%>
<%@ page import="java.util.*"%>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<html>
<head>

<meta charset="ISO-8859-1">
<title>Catalogo Armi</title>
<script type="text/javascript" src="./scripts/filtraCatalogo.js"></script>

</head>
<body onload="getTabella()">
	<table id="tabellaArmi">
		<caption>Elenco armi attualmente inserite</caption>
		<thead>
			<tr>
				<th colspan="10">Catalogo Armi</th>
			</tr>
			<tr>
				<td>Nome</td>
				<td>					
					<p>
						filtra per categoria
					</p>			
					<select name="filtroArmi" id="filtroArmi" onChange="aggiornamentoTabella(this.value)">
						<option value="tutto">
							Tutto
						</option>
						<option value="arma bianca">
							Arma bianca
						</option>
						<option value="distanza">
							Arma a distanza
						</option>
						<option value="scudi">
							Scudo
						</option>
					</select>
				</td>
				<td>Abilita'</td>
				<td>Dettagli</td>
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
				<td><%=tempArma.getNomeCategoria()%></td>
				<td><%=tempArma.getNomeAbilita()%></td>
				<td> <a href = "./dettaglioArmaServlet?dettaglioArma=<%=tempArma.getNome()%>">Dettagli</a> </td>
			</tr>
			<%
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan = "10">
					<a href = "./armaServlet?insertArma">Inserisci nuova arma</a>
				</td>
			</tr>		
		</tfoot>
	</table>
</body>
</html>