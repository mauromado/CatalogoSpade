<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaArmi"%>
<%@ page import="beans.Arma"%>
<%@ page import="java.util.*"%>
<%@page import="beans.ListaAbilita" %>

<link href="./style/style.css" rel="stylesheet" type="text/css">
<html>
<head>

<meta charset="ISO-8859-1">
<title>Catalogo Armi</title>
<script type="text/javascript" src="./scripts/filtraCatalogo.js"></script>

</head>
<body onload="getTabella()">
<table id="tabellaArmi" align="center">
		<tr>
			<td>
				<table id="tabellaArmi">
				<caption>Elenco armi attualmente inserite</caption>
				<thead>
					<tr>
						<th colspan="10">Catalogo Armi</th>
					</tr>
					<tr>
						<td>Nome</td>
						<td>					
							Categoria
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
			</td>
			<td style="background-color:rgba(0, 0, 0, 0);">
				<p>
				Filtra per categoria
				</p>			
				<select name="filtroArmi" id="filtroCategoria" onChange="setStatoSelectCategoria(this.value)">
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
				<br>
				<p>
				Filtra per abilita'
				</p>			
				<select name="filtroArmi" id="filtroAbilita" onChange="setStatoSelectAbilita(this.value)">
					<option value="tutto" >
						Tutto
					</option>
					<%ListaAbilita listaAbilita = (ListaAbilita)request.getAttribute("listaAbilita");
					for(int i=0;i<listaAbilita.getListaAbilita().size();i++){%>
					<option value="<%=listaAbilita.getListaAbilita().get(i).getNome()%>">
						<%=listaAbilita.getListaAbilita().get(i).getNome()%>
					</option>
					<%}%>
				</select>
				<br><br>
				<input type="submit" name="" value="Resetta filtri" onClick="resetFiltri()">
			</td>
		</tr>
	</table>
	
</body>
</html>