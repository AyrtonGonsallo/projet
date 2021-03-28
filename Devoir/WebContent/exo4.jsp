<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Compteur"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>exercice 4</title>
</head>
<body>

	<jsp:useBean id="cpt" class="com.Compteur" scope="application">
	<jsp:setProperty name="cpt" property="nombre" value="0"/>
	</jsp:useBean>
	<%cpt.inc();%>
	<jsp:useBean id="cpt1" class="com.Compteur" scope="request">
	<jsp:setProperty name="cpt1" property="nombre" value="0"/>
	</jsp:useBean>
	<%cpt1.inc();%>
	<jsp:useBean id="cpt2" class="com.Compteur" scope="session">
	<jsp:setProperty name="cpt2" property="nombre" value="0"/>
	</jsp:useBean>
	<%cpt2.inc();%>
	<h3>application</h3>
	<jsp:getProperty property="nombre" name="cpt"/><br>
	<h3>request</h3>
	<jsp:getProperty property="nombre" name="cpt1"/><br>
	<h3>session</h3>
	<jsp:getProperty property="nombre" name="cpt2"/><br>
	<a href="index.html">retour à l'index</a>
</body>
</html>