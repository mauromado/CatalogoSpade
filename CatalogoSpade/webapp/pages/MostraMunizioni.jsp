<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaMunizioni"%>
<%@ page import="beans.Munizioni"%>
<%@ page import="java.util.*"%>

<link href="./style/style.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Munizioni Disponibili</title>
<script type="text/javascript" src="./scripts/utils.js"></script>

</head>
<body style="color:white">
	
	<table id="tabellaArmi" align="center">
			
				<thead>
					<tr>
						<th colspan="5">Munizioni</th>
					</tr>
					<tr>
						<td>Nome</td>
						<td>Descrizione</td>
						<td>Danno</td>
						<td>Tipo di danno</td>
						<td>Aggiorna/elimina</td>
					</tr>
					</thead>
					<tbody>
						<%
						ListaMunizioni listaMunizioni = (ListaMunizioni)request.getAttribute("listaMunizioni");
						List<Munizioni> lista = listaMunizioni.getListaNomiMunizioni();
						for (int x = 0; x < listaMunizioni.getListaNomiMunizioni().size(); x++) {
						Munizioni tempMunizioni = listaMunizioni.getListaNomiMunizioni().get(x);
						String coloreRiga = x%2 == 0? "coloriDispari": "coloriPari";
						%>
						<tr class = <%= coloreRiga %>>
						<td><%=tempMunizioni.getNome()%></td>
						<td><%=tempMunizioni.getDescrizione()%></td>
						<td><%=tempMunizioni.getDanno()%></td>
						<td><%=tempMunizioni.getTipoDanno()%></td>
						<td>
							<form action="armaServlet" method="get">
								<input type="hidden" name="nomeMunizioni" value="<%=tempMunizioni.getNome()%>">
								<input type="submit" name="deleteMunizioni" value="elimina <%=tempMunizioni.getNome()%>">
							</form>
							<input type="submit" name="updateMunizioni" value="aggiorna <%=tempMunizioni.getNome()%>"
							onClick="populateForm(
									Array(
									'<%=tempMunizioni.getNome()%>',
									'<%=tempMunizioni.getDescrizione()%>',
									'<%=tempMunizioni.getDanno()%>',
									'<%=tempMunizioni.getTipoDanno()%>',
									'Modifica munizione',
									) )">
						</td>
						</tr>
						<%
						}
						%>
					</tbody>
	</table>
	<br>
	<input type="submit" value="aggiungi" onClick="hideDisplayForm('formInserisci')">
	<br><br><br>
	<div class="leftForm">
	<form action="armaServlet" method="post" id="formInserisci" hidden>
		<label for="Name">Nome:</label>
		<br>
		<input type="text" id="name" name="nome" value="" placeholder="nome munizioni" onChange="checkNome(this.form); controlName(this)">
		<br><br>
		<label for="Desc">Descrizione:</label>
		<br>
		<textarea rows="5" cols="60" id="desc" name="descrizione" placeholder="Inserisci descrizione"></textarea>
		<br><br>
		<label for="Damage">Danno:</label>
		<br>
		<input type="number" id="damage" name="danno" value="0" onChange="checkNumber(this)">
		<br><br>
		<select name="tipoDanno" id="tipoDanno">
			<option value="fisico">fisico</option>
			<option value="elementare">elementare</option>
		</select>
		<br><br>
		<input id="insertButton" type="submit" name="tipoOperazione" value="Inserisci munizioni">
	</form>
	</div>
	
	<div class="rightForm">
	<form action="armaServlet" method="post" id="formModifica" hidden>
		<label for="Name">Nome:</label>
		<br>
		<input type="text" id="name" name="nome" value="" placeholder="nome munizioni" onChange="checkNome(this.form)" readonly>
		<br><br>
		<label for="Desc">Descrizione:</label>
		<br>
		<textarea rows="5" cols="60" id="desc" name="descrizione" placeholder="Inserisci munizione"></textarea>
		<br><br>
		<label for="Damage">Danno:</label>
		<br>
		<input type="number" id="damage" name="danno" value="0" onChange="checkNumber(this)">
		<br><br>
		<select name="tipoDanno" id="tipoDanno">
			<option value="fisico">fisico</option>
			<option value="elementare">elementare</option>
		</select>
		<br><br>
		<input id="insertButton" type="submit" name="tipoOperazione" value="Modifica munizione">
	</form>
	</div>
	<form action="homeServlet" method="get">
			<input type="submit" name="torna" value="Torna">
	</form>
</body>
</html>