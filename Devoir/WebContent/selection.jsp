<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="/WEB-INF/erreur.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>selection</title>
</head>
<body>
	<form action="selection.jsp" method="get">
	<input type="radio" name="couleur" value="bleu">bleu<br>
	<input type="radio" name="couleur" value="rouge">rouge<br>
	<input type="radio" name="couleur" value="orange">orange<br>
	<input type="radio" name="couleur" value="vert">vert<br>
	<input type="submit" value="envoyer">
	</form>
	<%String col=request.getParameter("couleur"); %>
	<% if ("GET".equalsIgnoreCase(request.getMethod()) && request.getParameter("couleur") != null) { %>
         <p> Vous avez choisit la couleur <%=col%></p>
         <% if ("orange".equalsIgnoreCase(request.getParameter("couleur"))) { %>
         	<jsp:forward page="/WEB-INF/erreur.jsp"></jsp:forward>
    	 <% } else { %>
         	<p> belle couleur (pas orange)</p>
    	 <% } %>
    <% } else { %>
         <p> Vous n'avez pas choisit de couleur</p>
    <% } %>
    <a href="index.html">retour à l'index</a><br>
</body>
</html>