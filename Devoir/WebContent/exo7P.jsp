<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Connexion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>patients</title>
</head>
<body>
	<form action="exo7P.jsp" method="get">
	Types de problemes:<br>
	<input type="radio" name="probleme" value="Radiologie">Radiologie<br>
	<input type="radio" name="probleme" value="Oncologie">Oncologie<br>
	<input type="radio" name="probleme" value="Pediatrie">Pediatrie<br>
	<input type="radio" name="probleme" value="gynecologie">gynecologie<br>
	<input type="radio" name="probleme" value="neurologie">neurologie<br>
	<input type="radio" name="probleme" value="Psychiatrie">Psychiatrie<br>
	<input type="submit" value="envoyer">
	</form>
	---------------------------------<br><br>
	<h1>Patients de la base de données</h1>
	<table>
	<tr>
       	<td>nom</td>
        <td>probleme</td>
        <td>description</td>
	</tr>
	<%!String []resultats=null; %>
	<%!Connexion c=null; %>
	<%!PreparedStatement ps=null; %>
	<%
	try{
		c=new Connexion("jdbc:mysql://localhost:3306/cliniquemedicale");
		//--taille pour le tableau
		PreparedStatement pstaille=c.getConn().prepareStatement("Select count(*) as taille from patient where probleme=?");
		pstaille.setString(1,request.getParameter("probleme"));
		//---requette
		ps=c.getConn().prepareStatement("Select nom,probleme,description from patient where probleme=?");
		String[]champs={"nom","probleme","description"};
		ps.setString(1,request.getParameter("probleme"));
		resultats=c.getInfos(ps,pstaille,champs);
		}
	catch(SQLException e){
		e.printStackTrace();
		}
	
	%>
	<% for(int i=0;i<resultats.length;i+=3){%>
	<tr>
    	<td><%=resultats[i]%></td>
        <td><%=resultats[i+1]%></td>
        <td><%=resultats[i+2]%></td>
    </tr>
	<%}%>
	    </table>
	    <br><br><a href="exercice7.jsp">retour exercice7.jsp</a><br>
	    <br><br>
	<a href="index.html">retour à l'index</a><br>
</body>
</html>