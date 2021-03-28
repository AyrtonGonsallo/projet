package magasin;

public class Client {
		      private String nom, motPasse;
		      public Client (String leNom, String leMotPasse) {
		         nom = leNom;
		         motPasse = leMotPasse;
		      }
		      public String getNom() {
				return nom;
			}
			public void setNom(String nom) {
				this.nom = nom;
			}
			public String getMotPasse() {
				return motPasse;
			}
			public void setMotPasse(String motPasse) {
				this.motPasse = motPasse;
			}
			public boolean motPasseCorrect(String leMotPasse) {
		         return  leMotPasse.equals(motPasse);
		      }
}
