<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="time1" class="examens.TimeBean" scope="page" />
<jsp:useBean id="time2" class="examens.TimeBean" scope="request" />
<jsp:useBean id="time3" class="examens.TimeBean" scope="session" />
<jsp:useBean id="time4" class="examens.TimeBean" scope="application" />
<html><head> <title> Exercice sur portee 2 </title> </head>
<body>
<p> Time1
<jsp:getProperty name="time1" property="hours" />:
<jsp:getProperty name="time1" property="minutes" /> </p>
<p> Time2
<jsp:getProperty name="time2" property="hours" />:
<jsp:getProperty name="time2" property="minutes" /> </p>
<p> Time3
<jsp:getProperty name="time3" property="hours" />:
<jsp:getProperty name="time3" property="minutes" /> </p>
<p> Time4
<jsp:getProperty name="time4" property="hours" />:
<jsp:getProperty name="time4" property="minutes" /> </p>
<h1>reponses</h1>
a)10h00 --date actuelle<br>
b)page et request changent a 10h05min car seuls eux sont recrées 
On peut mettre un affichage dans le constructeur pour observer.<br>
c)10h20min pour les 3 premiers.Les 3 premiers, page request et session se mettent a jour(recreent l'objet). 
</body>
</html>