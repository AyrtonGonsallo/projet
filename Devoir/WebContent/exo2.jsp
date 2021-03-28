<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>selection</title>
</head>
<body>
	<form action="exo2.jsp" method="post">
	Nom: <input name="nom"><br>
	Langages de programmation connus:<br>
	<input type="radio" name="python" value="python">python<br>
	<input type="radio" name="java" value="java">java<br>
	<input type="radio" name="php" value="php">php<br>
	<input type="radio" name="c++" value="c++">c++<br>
	<input type="radio" name="perl" value="perl">perl<br>
	<input type="radio" name="cobol" value="cobol">cobol<br>
	<input type="radio" name="ruby" value="ruby">ruby<br>
	<input type="submit" name="soumis" value="soumission">
	</form>
	<%String[]lang={"python","java","php","c++","perl","cobol","ruby"};String langages=" "; %>
	<%
	for(String s:lang){
		if (request.getParameter(s)!=null){
			langages+=request.getParameter(s)+" ";
		}
	}
	%>
	<% if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("soumis") != null) { %>
		<% if (request.getParameter("nom") != null) { %>
			<p> <%=request.getParameter("nom")%> Vous avez choisit les langages <%=langages%></p>
    	<% } else { %>
         <p> Vous avez choisit les langages <%=langages%></p>
   		 <% } %>
    <%} 
	else { %>
         <p> Vous n'avez pas choisit de langage</p>
    <% } %>
    <a href="index.html">retour à l'index</a><br>
</body>
</html>