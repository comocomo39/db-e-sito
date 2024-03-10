
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
public class ricercaAlbum {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/progetto";
	private static final String USER ="utente";
	private static final String PWD = "password";
public static void main(String[] args) throws IOException {
Connection conn = null;

try {
// aprire una connessione col database
conn = DriverManager.getConnection(DB_URL,USER,PWD);
//prendiamo da input da tastiera l'artista o il gruppo a cui siamo interessati sapere che album hanno fatto
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
System.out.println("Digita l'artista o gruppo di cui vuoi sapere gli album : ");
String s = br.readLine();
 Statement stmt = conn.createStatement();
 ResultSet rs;
 rs = stmt.executeQuery("SELECT * FROM ARTISTA INNER JOIN ALBUM_ARTISTA ON ID_ARTISTA = CODICEA");
 while(rs.next()) {
	 String NomeArtista = rs.getString("Nome");
	 String NomeAlbum = rs.getString("Album_Artista.Nome");
	 if(NomeArtista.equals(s)) {
	 System.out.println(NomeAlbum);
	 }
 }
 Statement st = conn.createStatement();
 ResultSet ss;
 ss = st.executeQuery("SELECT * FROM GRUPPO INNER JOIN ALBUM_GRUPPO ON ID_GRUPPO = CODICEG");
 while(ss.next())
 {
	 String NomeGruppo = ss.getString("Gruppo.Nome");
	 String NomeAlbum = ss.getString("Album_Gruppo.Nome");
	 if(NomeGruppo.equals(s)) {
	 System.out.println(NomeAlbum);
	 }
 }
 } 
catch
(SQLException e) {e.printStackTrace();}
 finally{try{if(conn!=null) conn.close();
 }catch(SQLException se){se.printStackTrace();}
 
 }

 }//end main
}
	
	
	
	
