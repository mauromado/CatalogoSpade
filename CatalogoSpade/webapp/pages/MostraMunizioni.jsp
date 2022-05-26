<%@ page errorPage="../errors/failure.jsp" %>

<%@ page import="beans.ListaMunizioni"%>
<%@ page import="beans.Munizioni"%>
<%@ page import="java.util.*"%>

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