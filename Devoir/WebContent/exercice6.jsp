<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>exercice 6</title>
</head>
<body>
	<h1>exercice 6</h1>
	Question 1) <a href="exercice4a.jsp">exercice 4a</a><br>
	Question 2) <a href="exercice4b.jsp">exercice 4b</a><br>
	Question 3)<br>
	<p>
	C:\Users\user\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\Devoir\org\apache\jsp<br>
	est le dossier ou sont transformées en .java et compilées en .class les jsp.<br>
	Dans ce dossier on remarque en regardant les fichiers exercice4a.java et exercice4b.java que:<br>
	-> dans exercice4a.java a un attribut de classe <b>private static double nombreAleatoireClasse = Math.random()</b>, il est donc crée une seule fois<br>
	-> dans exercice4b.java, la variable <b>double nombreAleatoireClasse = Math.random()</b> n'est pas un attribut et est crée dans la methode <i>_jspService</i> appellée a chaque requette<br><br>
	</p>
	<a href="index.html">retour à l'index</a><br>
	
</body>
</html>