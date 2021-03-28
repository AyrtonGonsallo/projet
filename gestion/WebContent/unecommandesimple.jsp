<%@ page import = "java.util.*" %>
<%@ page import = "magasin.Utilisateurs" %>

<jsp:useBean id="client" class="magasin.Utilisateurs" scope="application"/>
<jsp:setProperty name="client" property="*"/> 



<!-- ****************
     cas ou le client est connu par le magasin 
     il peut être accueilli pour lancer une commande 
-->   

   <html>
      <head>   <title>Magasin Super Disques</title>
      </head>
       <body bgcolor="yellow">
        <font size=5></font>
        <b><font color="red"></font>
         <!-- une variable leNom contient le nom du client -->
        <h1> bonjour <%= client.getLeNom()  %>  vous pouvez commander </h1>
        </b>
       </body>
   </html>
       
       
       
 <!-- ****************
     cas d'inscription dans le magasin 
     le client s'il y a un parametre "inscription" doit
     etre inscrit dans le magasin par le bean Utilisateur 
     puis la page identification.jsp est rappellée  
     avec un paramètre "nom" 
 -->


<!-- ****************
     cas ou le client n'est pas connu par le magasin 
     et n'est pas en cours d'inscription rappel à la page identification.jsp
     avec un paramètre "erreurIdentification" 
 -->  
     
