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
<title>medecins</title>
</head>
<body>
	<form action="exo7M.jsp" method="get">
	sp�cialit�s:<br>
	<input type="radio" name="sp�cialit�" value="Radiologie">Radiologie<br>
	<input type="radio" name="sp�cialit�" value="Oncologie">Oncologie<br>
	<input type="radio" name="sp�cialit�" value="Pediatrie">Pediatrie<br>
	<input type="radio" name="sp�cialit�" value="gynecologie">gynecologie<br>
	<input type="radio" name="sp�cialit�" value="neurologie">neurologie<br>
	<input type="radio" name="sp�cialit�" value="Psychiatrie">Psychiatrie<br>
	<input type="submit" value="envoyer">
	</form>
	---------------------------------<br><br>
	<h1>Medecins de la base de donn�es</h1>
	<table>
	<tr>
       	<td>nom</td>
        <td>prenom</td>
	</tr>
	<%!String []resultats=null; %>
	<%!Connexion c=null; %>
	<%!PreparedStatement ps=null; %>
	<%
	try{
		c=new Connexion("jdbc:mysql://localhost:3306/cliniquemedicale");
		//--taille pour le tableau
		PreparedStatement pstaille=c.getConn().prepareStatement("Select count(*) as taille from medecin where sp�cialit�=?");
		pstaille.setString(1,request.getParameter("sp�cialit�"));
		//---requette
		ps=c.getConn().prepareStatement("Select nom,prenom from medecin where sp�cialit�=?");
		ps.setString(1,request.getParameter("sp�cialit�"));
		String[]champs={"nom","prenom"};
		resultats=c.getInfos(ps,pstaille,champs);
		}
	catch(SQLException e){
		e.printStackTrace();
		}
	%>
	<% for(int i=0;i<resultats.length;i+=2){%>
	<tr>
    	<td><%=resultats[i]%></td>
        <td><%=resultats[i+1]%></td>
    </tr>
	<%}%>
	    </table>
	    <br><br><a href="exercice7.jsp">retour exercice7.jsp</a><br>
	    <br><br>
	<a href="index.html">retour � l'index</a><br>
</body>
</html>