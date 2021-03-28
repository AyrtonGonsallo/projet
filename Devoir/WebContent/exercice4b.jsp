<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%double nombreAleatoireClasse = Math.random(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exercice4b</title>
</head>
<body>
	<h1>exercice 4b --- dynamique !</h1>
	Voici le nombre aléatoire: <%= nombreAleatoireClasse %><br>
	<a href="exercice6.jsp">retour à l'exercice6</a><br>
	<p style="font-size: 18px">la valeur change chaque fois qu'on recharge la page<p>
</body>
</html>