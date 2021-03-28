<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %>
<%@ page import = "magasin.Client" %>
<%@ page import = "magasin.Caddie" %>
<%@ page import = "magasin.Element" %>
<%@ page import = "java.util.*" %>
<%@ page import = "magasin.Utilisateurs" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "magasin.Stock" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<jsp:useBean id="client" class="magasin.Utilisateurs" scope="session"/>
	<jsp:setProperty name="client" property="*"/> 
	<jsp:useBean id="commande" class="magasin.Caddie" scope="session"/>
	<jsp:setProperty name="commande" property="*"/>
	<jsp:useBean id="el" class="magasin.Element" scope="request"/>
	<jsp:setProperty name="el" property="*"/>
	<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/magasin" user="root"  password="mysql" scope="session"/> 
	
	<sql2:connection id="conn1">
					   <sql2:url>
					           jdbc:mysql://localhost:3306/magasin
					   </sql2:url>
					   <sql2:userId>root</sql2:userId>
					   <sql2:password>mysql</sql2:password>
					    <sql2:driver>com.mysql.cj.jdbc.Driver</sql2:driver>
					</sql2:connection>
	
	<%int cle =0; %>
	
	<% if ("inscription".equalsIgnoreCase(request.getParameter("inscription"))) { %> 
			<%client.ajouteClient();%>
			<sql:query dataSource="${dataSource}" var="personel">
      		SELECT * from personel where nom=?;
      		<sql:param value="<%=client.getLeNom() %>" />
    		</sql:query>
    		<c:if test="${personel.rowCount == 0}">
            <%System.out.println("Vous n'etes pas dans la base de données"); %>
            <sql:update dataSource="${dataSource}" var="personel">
     			 INSERT INTO `personel`( `nom`, `motdepasse`) VALUES (?,?);
     			 <sql:param value="<%=client.getLeNom() %>" />
            	 <sql:param value="<%=client.getLeMotPass() %>" />
    		</sql:update>
    		<%System.out.println("Vous y avez éte inscrit"); %>
        	</c:if>
    		<%for (Map.Entry<String,Client> e : client.clients.entrySet()){
	            System.out.println("Valeur: "+e.getKey()+ " "+e.getValue().getNom()+" "+e.getValue().getMotPasse()); %>
	          	<%response.sendRedirect("identification.jsp?leNom="+client.getLeNom()+"&inscription=succes"); }%>
         	
    <% } else if("commander".equalsIgnoreCase(request.getParameter("commander"))) { %>
    		<%for (Map.Entry<String,Client> e : client.clients.entrySet())
    			System.out.println("Valeur: "+e.getKey()+ " "+e.getValue().getNom()+" "+e.getValue().getMotPasse()); %>
    		
         	<% if (client.clientExiste()) { %>
         	<html>
					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
						<title>Magasin Super Disques </title>
					</head>
					<body>
						<h1>Votre session est valide</h1>
						<h3> bonjour <%= client.getLeNom()  %>  vous pouvez commander </h3>
						<a href="unecommandecomplete.jsp">commande complete</a>
					</body>
			</html>
					
    		<% } else{ %>
    				<sql:query dataSource="${dataSource}" var="personel">
      				SELECT * from personel where nom=? and motdepasse=?;
      				<sql:param value="<%=client.getLeNom() %>" />
		      		<sql:param value="<%=client.getLeMotPass() %>" />
		    		</sql:query>
		    		<c:if test="${personel.rowCount != 0}">
		    			<html>
							<head>
								<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
								<title>Magasin Super Disques </title>
							</head>
							<body>
							<h1>Vous etes dans la base de données</h1>
								<h3> bonjour <%= client.getLeNom()  %>  vous pouvez commander </h3>
								<a href="unecommandecomplete.jsp">commande complete</a>
							</body>
						</html>
		    		</c:if>	
		    		<c:if test="${personel.rowCount == 0}">
    				<%response.sendRedirect("identification.jsp?erreurIdentification=echec"); %>
         			</c:if>
   			<% }} else if("oui".equalsIgnoreCase(request.getParameter("connaitre"))) { %>
    				
    				<%Iterator<Element> iterator = commande.commande.iterator();%>
         			<%while (iterator.hasNext()) {%>
         	            <%=iterator.next().getNomProduit()%>
         	       <% } %>
   			<% } else if("oui".equalsIgnoreCase(request.getParameter("enregistre"))) { %>
    				<%System.out.println("enregistrer mes commandes");%>
    				<!-- numero -->
    				
    				<%
					ResultSet rset = null;
					PreparedStatement pstmt= conn1.prepareStatement("select numero from personel where nom=?");
					pstmt.setString(1, client.getLeNom() );
					  rset=pstmt.executeQuery();
					  while (rset.next())  {
						  cle = rset.getInt("numero");
					  }
					%>
    				
    				<%Iterator<Element> iterator = commande.commande.iterator();%>
    				<%int t=0;System.out.println("Votre numero dans la base de données est: "+cle);%>
         			<%while (iterator.hasNext()) {
         				Element e = (Element)iterator.next();
         	            t+=e.getPrix();%>
         	            <sql:update dataSource="${dataSource}" var="personel">
     						 INSERT INTO `commande`( `article`, `numclient`) VALUES (?,?);
     						 <sql:param value="<%=e.getNomProduit() %>" />
            	 			 <sql:param value="<%=cle %>" />
    					</sql:update>
         	       <%} %>
         	       <%="prix total = "+t %>
    				<%commande.commande.clear(); %>

   			<% } else if(request.getParameter("nomProduit")!=null) { %>
				<%commande.commander(el); %> 
				<jsp:getProperty property="nomProduit" name="el"/>
    		<% } else if("oui".equalsIgnoreCase(request.getParameter("voirtout"))) { %>
    		
    				
			<%
			ResultSet rset = null;
			PreparedStatement pstmt= conn1.prepareStatement("select numero from personel where nom=?");
			pstmt.setString(1, client.getLeNom() );
			  rset=pstmt.executeQuery();
			  while (rset.next())  {
				  cle = rset.getInt("numero");
			  }
			%>
		<sql:query dataSource="${dataSource}" var="commande">  
			SELECT * FROM `commande` WHERE numclient=?;  
			<sql:param value="<%=cle %>" />
			
		</sql:query>  
		<table border="2" width="100%">  
		<tr>  
		<th>numero commande</th>  
		<th>article</th>  
		<th>nomero client</th>   
		</tr>  
		<c:forEach var="row" items="${commande.rows}">  
		<tr>  
		<td><c:out value="${row.numcommande}"/></td>  
		<td><c:out value="${row.article}"/></td>  
		<td><c:out value="${row.numclient}"/></td>  
		</tr>  
		</c:forEach>  
		</table>  
    	<% } else if("oui".equalsIgnoreCase(request.getParameter("deconnecte"))) { %>	
         	<%commande.commande.clear();
         	response.sendRedirect("identification.jsp?deconnecte=oui");
         	%>
         			
   			<% } %>
