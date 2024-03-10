import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

public class ricercaArtista {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/progetto";
	private static final String USER ="utente";
	private static final String PWD = "password";
	public static void main(String[] args) throws IOException {
		Connection conn = null;

		try {
			
		// aprire una connessione col database
		conn = DriverManager.getConnection(DB_URL,USER,PWD);
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("Digita l'album di cui vuoi sapere da chi è stato fatto : ");
		String s = br.readLine();
		
		Statement stmt = conn.createStatement();
		 ResultSet rs;
		 rs = stmt.executeQuery("SELECT * FROM ALBUM_ARTISTA INNER JOIN ARTISTA ON CODICEA=ID_ARTISTA");
		 while(rs.next()) {
			 String NomeArtista = rs.getString("Artista.Nome");
			 String NomeAlbum = rs.getString("Album_Artista.Nome");
			 if(NomeAlbum.equals(s)) {
			 System.out.println(NomeArtista);
			 }
		}
		 Statement st = conn.createStatement();
		 ResultSet rss;
		 rss = st.executeQuery("SELECT * FROM ALBUM_GRUPPO INNER JOIN GRUPPO ON CODICEG=ID_GRUPPO");
		 while(rss.next()) {
			 String NomeGruppo= rss.getString("Gruppo.Nome");
			 String NomeAlbum = rss.getString("Album_Gruppo.Nome");
			 if(NomeAlbum.equals(s)) {
			 System.out.println(NomeGruppo);
			 }
		 }
		}
		catch(SQLException e) 
		{
			e.printStackTrace();}
		 finally{
			 try{if(conn!=null) conn.close();
		 }
		 catch(SQLException se){
			 se.printStackTrace();
		 }
		 }

		}
	}
