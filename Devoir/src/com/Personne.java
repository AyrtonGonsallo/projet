package com;

public class Personne {
	public String nom;
	public String prenom;
	public int age;
	public char sexe;
	public double taille;
	public Personne(){
		System.out.println("creé");
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public char getSexe() {
		return sexe;
	}
	public double getPoidsIdeal() {
		double pi=0;
		if(sexe==0){
			return 0;
		}
		else{
			if(sexe=='h'){
				pi=(62.1*this.getTaille())-44.7;
			}
			else{
				pi=(72.7*this.getTaille())-58.0;
			}
		}
		return pi;
	}
	public void setSexe(char sexe) {
		this.sexe = sexe;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getTaille() {
		return taille;
	}
	public void setTaille(double taille) {
		this.taille = taille;
	}
	
	
}
