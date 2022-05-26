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
<script>
function hideDisplayForm(){
	form=document.getElementById("formInserisciMunizioni");
	if(form.style.display==="block"){
		form.style.display="none";}
	else{
		form.style.display="block";}
}


</script>

</head>
<body>);
	
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
								<input type="submit" name="deleteMunizioni" value="elimina <%=tempMunizioni.getNome()%>">
							</form>
							<input type="submit" name="updateMunizioni" value="aggiorna <%=tempMunizioni.getNome()%>">
						</td>
						</tr>
						<%
						}
						%>
					</tbody>
	</table>
	<br>
	<input id="addtButton" type="submit" value="aggiungi" onClick="hideDisplayForm()">
	<br><br><br>
	<form hidden action="armaServlet" method="post" id="formInserisciMunizioni">
		<label for="Name">Nome:</label>
		<br>
		<input type="text" id="name" name="nome" value="" placeholder="nome munizioni">
		<br><br>
		<label for="Desc">Descrizione:</label>
		<br>
		<textarea rows="5" cols="60" id="desc" name="descrizione" placeholder="Inserisci descrizione"></textarea>
		<br><br>
		<label for="Damage">Danno:</label>
		<br>
		<input type="number" id="damage" name="danno" value="0">
		<br><br>
		<select name="tipoDanno" id="tipoDanno">
			<option value="fisico">fisico</option>
			<option value="elementare">elementare</option>
		</select>
		<br><br>
		<input id="insertButton" type="submit" name="tipoOperazione" value="inserisciMunizioni">
	</form>
</body>
</html>