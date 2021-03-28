<%@ page import = "magasin.Caddie" %>
<%@ page import = "magasin.Element" %>
<%@ page import = "java.util.*" %>
<%@ page import = "magasin.Utilisateurs" %>
<%@ page import = "magasin.Stock" %>
<%@ page import = "java.sql.*" %>
<%@page errorPage="identification.jsp" %>
<jsp:useBean id="commande" class="magasin.Caddie" scope="session"/>
<jsp:setProperty name="commande" property="*"/>   
<jsp:useBean id="client" class="magasin.Utilisateurs" scope="session"/>
<jsp:setProperty name="client" property="*"/> 
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql" %>

<!--  
     cas ou le client est connu par le magasin 
     il peut être accueilli pour lancer une commande 
 -->   
    <html>
      <head><title>Magasin Super Disques</title></head>
       <body bgcolor="yellow">
      <h1 style="color: red"> bonjour <%=client.getLeNom()%> vous pouvez commander </h1>
       
        <% Stock.vente(out); %>
       
    <!-- 1) ****************************************************
            cas ou le client a commandé un disque
            on ecrit la commande et on lance la commande
     --> 
            
     
   <a href="unecommande.jsp?connaitre=oui" > Voulez vous connaitre vos commandes </a> 
        <br>
    <a href="unecommande.jsp?enregistre=oui" > Voulez vous enregistrez vos commandes </a><br>
    <a href="unecommande.jsp?voirtout=oui" > Voulez vous voir toutes vos commandes</a><br><br><br>
    <a href="unecommande.jsp?deconnecte=oui" > se deconnecter</a>
  


 </body>
 </html>




