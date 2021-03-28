<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.Connexion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%!
public static void setDriver(String driver) throws ClassNotFoundException {
Class.forName(driver);
}
public static Connection getConnection(String url, String username, String password)
throws SQLException {
String user = "?user=" + username;
String pword = "&password=" + password;
return DriverManager.getConnection(url + user + pword);
} 
public Object[] getRendezVous(PreparedStatement requete,PreparedStatement tailledelarequette) throws SQLException{
	Object[]t=null;
	ResultSet rs;
	ResultSet rs1=tailledelarequette.executeQuery();
	while(rs1.next()){
		t=new Object[rs1.getInt("taille")*5];
	}
    rs = requete.executeQuery();
    int j=0;
    
    while(rs.next()){
    	t[j]=rs.getInt("numId");
    	t[j+1]=rs.getString("Med");
    	t[j+2]=rs.getString("Pat");
    	t[j+3]=rs.getDate("date");
    	t[j+4]=rs.getTime("heure");
    	j+=5;
    }
    return t;
}
%>