<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>clinique medicale</title>
</head>
<body>
	<h1>Requettes de creation des tables</h1>
	<p>
	CREATE TABLE `cliniquemedicale`.`medecin` ( `numId` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(40) NOT NULL , `spécialité` VARCHAR(40) NOT NULL , PRIMARY KEY (`numId`)) ENGINE = InnoDB;<br>
	CREATE TABLE `cliniquemedicale`.`patient` ( `numId` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(40) NOT NULL , `numTel` BIGINT NOT NULL , PRIMARY KEY (`numId`)) ENGINE = InnoDB;<br>
	CREATE TABLE `cliniquemedicale`.`rendezvous` ( `numId` INT NOT NULL AUTO_INCREMENT , `numPatient` INT NOT NULL , `numMedecin` INT NOT NULL , `date` DATE NOT NULL , `heure` TIME NOT NULL , PRIMARY KEY (`numId`)) ENGINE = InnoDB;
	</p>
	<h1>voir l'application</h1>
	<a href="exo7RV.jsp">chercher rendez vous</a><br>
	<a href="exo7M.jsp">chercher medecins</a><br>
	<a href="exo7P.jsp">chercher patients</a><br><br>
	<a href="index.html">retour à l'index</a><br>
</body>
</html>