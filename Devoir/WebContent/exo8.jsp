<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Connexion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="bd.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exercice 8</title>
</head>
<body>
	<form action="exo8.jsp" method="get">
	Patient et Medecin:<br>
	Patient: <input name="patient" ><br>
	Medecin: <input name="medecin" ><br>
	
	<input type="submit" value="envoyer">
	</form>
	---------------------------------<br><br>
	<h1>Patients de la base de données</h1>
	<p> les noms des médecins, les noms des clients et les dates de leur rendez-vous ordonnes par le nom du médecin
	</p>
	<table>
	<tr>
		<td>rendez-vous n°</td>
		<td>nom medecin</td>
		<td>nom patient</td>
       	<td>date du rendez-vous</td>
        <td>heure du rendez-vous</td>
        
	</tr>
	<%!Object []resultats=null; %>
	<%!Connection c=null; %>
	<%!PreparedStatement ps=null; %>
	<%
	try{
		setDriver("com.mysql.cj.jdbc.Driver");
		
		c=getConnection("jdbc:mysql://localhost:3306/cliniquemedicale", "root", "mysql");
		//--taille pour le tableau
		PreparedStatement pstaille=c.prepareStatement("Select count(*) as taille from rendezvous r,medecin m,patient p where r.numPatient=p.numId and r.numMedecin=m.numId and (m.nom=? or p.nom=?)");
		pstaille.setString(1,request.getParameter("medecin"));
        pstaille.setString(2,request.getParameter("patient"));
		//---requette
		ps=c.prepareStatement("Select r.numId,date,heure,m.nom as Med,p.nom as Pat from rendezvous r,medecin m,patient p where r.numPatient=p.numId and r.numMedecin=m.numId and (m.nom=? or p.nom=?) ORDER BY m.nom");
		ps.setString(1,request.getParameter("medecin"));
        ps.setString(2,request.getParameter("patient"));
		resultats=getRendezVous(ps,pstaille);
		}
	catch(SQLException e){
		e.printStackTrace();
		}
	%>
	<% for(int i=0;i<resultats.length;i+=5){%>
	<tr>
    	<td><%=resultats[i]%></td>
        <td><%=resultats[i+1]%></td>
        <td><%=resultats[i+2]%></td>
        <td><%=resultats[i+3]%></td>
        <td><%=resultats[i+4]%></td>
    </tr>
	<%}%>
	    </table>
	    <br><br><a href="exercice7.jsp">retour exercice7.jsp</a><br>
	    <br><br>
	<a href="index.html">retour à l'index</a><br>
</body>
</html>