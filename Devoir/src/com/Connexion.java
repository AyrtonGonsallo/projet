package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Connexion {
	private Connection conn;
	private ResultSet rs;
	public Connexion() throws ClassNotFoundException{
		try{
		String cn="com.mysql.cj.jdbc.Driver";
    	String url="jdbc:mysql://localhost:3306/cliniquemedicale";
    	String login="root";
    	String pass="mysql";
    	Class.forName(cn);
        conn = DriverManager.getConnection(url,login,pass);
		}
	catch(SQLException e){
		e.printStackTrace();
		}
	}
	public Connexion(String url) throws ClassNotFoundException{
		try{
		String cn="com.mysql.cj.jdbc.Driver";
    	String login="root";
    	String pass="mysql";
    	Class.forName(cn);
        conn = DriverManager.getConnection(url,login,pass);
		}
	catch(SQLException e){
		e.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public String[] getInfos(PreparedStatement requete,PreparedStatement tailledelarequette,String[]champs) throws SQLException{
		String[]t=null;
		
		ResultSet rs1=tailledelarequette.executeQuery();
		while(rs1.next()){
			t=new String[rs1.getInt("taille")*champs.length];
		}
        rs = requete.executeQuery();
        int j=0;
        
        while(rs.next()){
        	for(int i=0;i<champs.length;i++){
        		t[j]=rs.getString(champs[i]);
        		j++;
        	}
        }
        return t;
	}
	public Object[] getRendezVous(PreparedStatement requete,PreparedStatement tailledelarequette) throws SQLException{
		Object[]t=null;
		
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
}
