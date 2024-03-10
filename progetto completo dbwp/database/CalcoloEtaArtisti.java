import java.util.Date;
import java.sql.*;
public class CalcoloEtaArtisti {
	//effettuamo la connessione al database
private static final String DB_URL = "jdbc:mysql://localhost:3306/progetto";
private static final String USER ="utente";
private static final String PWD = "password";
public static void main(String[] args) {
	//calcoliamo l'anno corrente
	Date data = new Date();
	int anno = data.getYear();
	int annocorrente=anno+1900;  
Connection conn = null;
try {
// aprire una connessione col database
conn = DriverManager.getConnection(DB_URL,USER,PWD);
 Statement stmt = conn.createStatement();
 ResultSet rs;
 rs = stmt.executeQuery("SELECT * FROM ARTISTA");
 while(rs.next()) {
	 String nome= rs.getString("Nome");
	 Integer datanascita = rs.getInt("DataNascita");
	 Integer datamorte = rs.getInt("DataMorte");
	 Integer o = annocorrente - datanascita;
	 //stampiamo età e nome dell'artista, controllando se l'artista sia vivo o defunto
	 if(datamorte == 0)
	 {
	 System.out.println(o + " " + nome);
	 } 
	 else {System.out.println("L'artista "  + nome + " " + "è morto nel " + datamorte);} 
 }

 } 
   catch
       (
    		   SQLException e) {e.printStackTrace();}
       finally{try{if(conn!=null) conn.close();
 }
       catch
       (
    		   SQLException se){se.printStackTrace();}
 
 }

 }//end main
}