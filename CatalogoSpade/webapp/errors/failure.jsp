<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<%  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Errore Jsp</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/style.css" type="text/css"/>
</head>
<body>
	<div id="err" class="clear">
		<p>
			<b>E' stata lanciata un eccezione!</b><br/>
			<%= exception.toString() %>
		</p>
		<p>
			<b>Il messaggio dell'errore e':</b><br/>
			<%= exception.getMessage() %>
		</p>
		<p>
			<b>Stacktrace:</b><br/>
			<% exception.printStackTrace(new java.io.PrintWriter(out));
			   exception.printStackTrace();%>
		</p>
	</div>
</body>
</html>