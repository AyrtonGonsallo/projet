<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.F2C"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Convertion</title>
</head>
<body>
	<h1>Convertion de degrés Fahrenheit en degrés Celsius.</h1>
	<form>
	<table>
		<tr>
			<td>degrés Fahrenheit</td>
			<td>degrés Celsius</td>
		</tr>
		<tr>
			<td><input type="text" name="entree"></td>
			<% if (request.getParameter("envoyé") == null) { %>
				<td><input type="text" name="sortie" readonly="readonly" value="resultat"></td>	
   			<% } else { %>
   				<%int d=F2C.parse(request.getParameter("entree")); %>
         		<td><input type="text" name="sortie" readonly="readonly" value="<%=F2C.f2c(d)%>"></td>
   			<% } %>
		</tr>
	</table>
	<input type="submit" value="calculer" name="envoyé">
	</form>
	<a href="index.html">retour à l'index</a><br>
</body>
</html>