package magasin;
import java.util.TreeMap;

public class Utilisateurs {
		      public TreeMap<String,Client> clients;
		      boolean identifier = false;
		      String leNom, leMotPass ;
		      
		      public Utilisateurs () {
		         clients = new TreeMap <String,Client>();
		      }

		      public void setLeNom(String val) {
		         leNom = val;
		      }
		      public String getLeNom() {
		         return leNom;
		      }
		      public String getLeMotPass() {
		         return leMotPass;
		      }
		      public void setLeMotPass(String val) {
		         leMotPass = val;
		      }		   
		      public void  ajouteClient() {
		         clients.put(leNom,  new Client(leNom,leMotPass) );
		      }
		      public boolean  clientExiste() {		      
		         if ( clients.containsKey(leNom) ) {
		            identifier =   ((Client) clients.get(leNom)).motPasseCorrect(leMotPass);
		            return identifier;
		         }		         
		         else 
		            return false;		      
		      }
		   }	

