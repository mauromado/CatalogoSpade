package database;

import java.security.KeyStore.PrivateKeyEntry;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DbConnection {
	private Connection connection;
	private static String projectLocation = System.getenv("PROJECT_LOC");
	private static String dbName = "CatalogoSpade.db";
	private static final String QRY_ARMI_LISTA_TUTTO = "SELECT * "
			 									    + "FROM Arma;";
	
	public Connection connect() {
		try {
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection("jdbc:sqlite:" + projectLocation + "/" + dbName);
			System.err.println("Connessione avvenuta con successo.");
		}catch(ClassNotFoundException | SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return connection;
	}
	
	public void close() {
		try {
			this.connection.close();
			System.out.println("Disconnessione avvenuta con successo.");
		}
		
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	//TODO: Da completare insert
	/*public void insert() {
		Connection c = this.connect();
	}*/
	
	public ResultSet selectAll() throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_ARMI_LISTA_TUTTO);
		return rs;
	}
	
	
}
