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
<title>rendezvous</title>
</head>
<body>
	<form action="exo7RV.jsp" method="get">
	Patient et Medecin:<br>
	Patient: <input name="patient" ><br>
	Medecin: <input name="medecin" ><br>
	
	<input type="submit" value="envoyer">
	</form>
	---------------------------------<br><br>
	<h1>Patients de la base de données</h1>
	<table>
	<tr>
		<td>rendez-vous n°</td>
		<td>medecin</td>
		<td>patient</td>
       	<td>date</td>
        <td>heure</td>
        
	</tr>
	<%!Object []resultats=null; %>
	<%!Connexion c=null; %>
	<%!PreparedStatement ps=null; %>
	<%
	try{
		c=new Connexion("jdbc:mysql://localhost:3306/cliniquemedicale");
		//--taille pour le tableau
		PreparedStatement pstaille=c.getConn().prepareStatement("Select count(*) as taille from rendezvous r,medecin m,patient p where r.numPatient=p.numId and r.numMedecin=m.numId and (m.nom=? or p.nom=?)");
		pstaille.setString(1,request.getParameter("medecin"));
        pstaille.setString(2,request.getParameter("patient"));
		//---requette
		ps=c.getConn().prepareStatement("Select r.numId,date,heure,m.nom as Med,p.nom as Pat from rendezvous r,medecin m,patient p where r.numPatient=p.numId and r.numMedecin=m.numId and (m.nom=? or p.nom=?) ORDER BY m.nom");
		ps.setString(1,request.getParameter("medecin"));
        ps.setString(2,request.getParameter("patient"));
		resultats=c.getRendezVous(ps,pstaille);
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