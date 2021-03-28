<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	  <html>
	  <head>
        <title> inscription ou commande dans le magasin   </title>
	  </head>
	 <body>
	 
<!-- ****************
     cas d'inscription dans le magasin -->

	  <h1>  inscription dans le magasin      </h1> 
	  <form name = "commande" method="get"  action = "unecommande.jsp" >
		 votre nom  : 
		   <input name="leNom" type="text"> <br>
		 votre mot de passe :
		   <input type="password" name="leMotPass"> <br>
	       <input name="inscription" type="submit" value = "inscription">
	</form>

        
<!-- ****************
     cas   de  identification pour commander   dans le magasin -->


	  <h1>  Vous  etes  déja inscrit identifiez vous :      </h1> 
  
	  <form name = "commande" method="get"   action = "unecommande.jsp" >
		     votre nom  : 
		      <input name="leNom" type="text" > <br>
		     votre mot de passe : 
		      <input type="password" name="leMotPass"><br>
	          <input name="commander" type="submit" value = "commander">
	   </form>
	
	</body>
	</html>
