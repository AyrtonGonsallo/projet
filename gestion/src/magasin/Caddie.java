
	package magasin;
	import java.util.Vector;
	import java.util.Iterator;

	public class Caddie {
	    int prix;
	    String nomProduit = "peche", code="jj";
	    boolean commandeFaite = false ;
	    public Vector<Element> commande;	
	 
	    public Caddie() {
	       commande = new Vector<Element>();
	    }
			
	    public void EffaceCommande() {
	       commande.clear();
	    }
		
	    public  String getNomProduit () {
	       return nomProduit;
	    }
	    public  String getCode () {
	       return code;
	    }
	    public  int getPrix () {
	       return prix;
	    }
	    public  void commander (Element e) {		
	       commande.add (e);
	       commandeFaite = true;
	    }
	    public Iterator<Element> iterator () {
	       return commande.iterator();
	    }
	    public  boolean getCommandeFaite () {
	       return commandeFaite;
	    }
	    public void  setNomProduit (String val) {
	       nomProduit = val;
	       commandeFaite = true;
	    }
	 
	    public void  setCode (String val) {
	       code = val;
	       commandeFaite = true;
	    }      
	    public void  setPrix (int val) {
	       prix = val;
	       commandeFaite = true;
	    }
	    
	}
