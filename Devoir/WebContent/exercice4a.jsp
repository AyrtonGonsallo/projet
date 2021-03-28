<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!private static double nombreAleatoireClasse = Math.random(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exercice4a</title>
</head>
<body>
	<h1>exercice 4a  --- statique!</h1>
	Voici le nombre aléatoire: <%= nombreAleatoireClasse %><br>
	<a href="exercice6.jsp">retour à l'exercice6</a>
	<p style="font-size: 18px">la valeur est pareille jusqu'a ce qu'on modifie la page ou qu'on redemarre le serveur<p>
</body>
</html>