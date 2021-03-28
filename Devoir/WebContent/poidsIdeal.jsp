<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Poids</title>
</head>
<body>

	<h1>Calcul de votre poids ideal</h1><br>
	
	
	<form action="poidsIdeal.jsp" method="get">
	nom:<input name="nom"><br>
	prenom:<input name="prenom"><br>
	sexe:<br>
	<input type="radio" name="sexe" value="h">masculin<br>
	<input type="radio" name="sexe" value="f">féminin<br>
	Taille:<input name="taille"><br>
	Age:<input name="age"><br>
	<input type="submit" value="envoyer">
	</form>
	<%String nom=request.getParameter("nom");%>
	<%String prenom=request.getParameter("prenom"); %>
	<%String sexe=request.getParameter("sexe"); %>
	<%String taille=request.getParameter("taille"); %>
	<%String age=request.getParameter("age"); %>
	<jsp:useBean id="pers" class="com.Personne" scope="request">
	<jsp:setProperty name="pers" property="*"/>
	</jsp:useBean>
	
	Request ---- :<br>
	nom: <jsp:getProperty property="nom" name="pers"/><br>
	prenom:<jsp:getProperty property="prenom" name="pers"/><br>
	age:<jsp:getProperty property="age" name="pers"/><br>
	sexe:<jsp:getProperty property="sexe" name="pers"/><br>
	taille:<jsp:getProperty property="taille" name="pers"/><br>
	poids ideal:<jsp:getProperty property="poidsIdeal" name="pers"/><br><br><br>
	<a href="index.html">retour à l'index</a>
	
</body>
</html>