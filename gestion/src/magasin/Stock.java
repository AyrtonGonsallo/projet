package magasin;
import java.io.IOException;
import javax.servlet.jsp.JspWriter;
public class Stock {
	
    static String [] [] leStock = {
       {"Disque CD - Patrick Bruel", "15", "897TR566"},
       {"Disque CD - Los Mayas", "19", "78UUNYT67"},
       {"Disque CD - Dick Anglas", "25", "87YHG564"},
       {"Disque CD - Frederic Angonas", "35", "98HUYU56"}
       };
 
     public static void vente (JspWriter out) {
       try {
          out.println("<table border=1>");
          for(int i = 0; i< leStock.length; i++) {;
             out.println( "<tr> <td>" + leStock[i][0] + "   " + leStock[i][1] + " Euros  </td>");
             out.println("<td><A HREF=\"unecommande.jsp?nomProduit="+leStock[i][0]+"&code=" + leStock[i][2]+ "&commander=true&prix=" +leStock[i][1] +"\"><IMG SRC=\"images/panier.gif\" BORDER=0></A><br> </td> </tr>");
          }
          out.println("</table> </form>");
       }
           catch (IOException e) {}
    }

}
