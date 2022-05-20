package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Arma;


public class DbConnection {
	private Connection connection;
	private static String projectLocation = System.getenv("PROJECT_LOC");
	private static String dbName = "CatalogoSpade.db";
	private static final String QRY_ARMI_LISTA_TUTTO = "SELECT * "
			 									    + "FROM Arma;";
	private static final String QRY_DELETE_ARMA="DELETE FROM Arma WHERE Nome=?;";
	private static final String QRY_INSERT_ARMA="INSERT INTO Arma(Nome,Potenza,Peso,Livello,TipoDanno,"
			                                    + "Stabilita,RiduzioneDanno,Scaling,NomeCategoria)" 
			                                    + " VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String QRY_CATEGORIA_LISTA_NOMI="SELECT NomeCategoria FROM Categoria;";
	private static final String QRY_SELECT_ARMA_BY_NOME="SELECT * FROM Arma WHERE Nome=?;";
	private static final String QRY_UPDATE_ARMA="UPDATE Arma SET Nome=?,Potenza=?,Peso=?,Livello=?,"
												+ "TipoDanno=?,Stabilita=?,RiduzioneDanno=?,Scaling=?,NomeCategoria=?"
												+ " WHERE Nome=?";
	
	
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
	
	public ResultSet selectAll() throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_ARMI_LISTA_TUTTO);
		return rs;
	}
	
	public boolean deleteArma(String nomeArma) throws SQLException{
		boolean ris = false;
		Connection c = connect();
		try {
			PreparedStatement s = c.prepareStatement(QRY_DELETE_ARMA);
			s.setString(1, nomeArma);
			s.executeUpdate();
			ris=true;
			s.close();
		}
		catch(Exception e) {
			System.out.println("Delete: fallita la cancellazione dell'arma "+nomeArma +" ("+e.getMessage()+")");
		}
		return ris;
	}
	
	public void insertArma(Arma arma) throws SQLException {
		Connection c = connect();
		try {
			
			PreparedStatement s = c.prepareStatement(QRY_INSERT_ARMA);
			s.setString(1, arma.getNome());
			s.setFloat(2, arma.getPotenza());
			s.setFloat(3, arma.getPeso());
			s.setInt(4, arma.getLivello());
			s.setString(5, arma.getTipoDanno());
			s.setFloat(6, arma.getStabilita());
			s.setFloat(7, arma.getRiduzioneDanno());
			if(arma.getScaling().isEmpty()) {
				arma.setScaling("N/D");
			}
			s.setString(8, arma.getScaling());
			s.setString(9, arma.getNomeCategoria());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ arma.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public void updateArma(Arma arma) throws SQLException {
		Connection c = connect();
		try {
			PreparedStatement s = c.prepareStatement(QRY_UPDATE_ARMA);
			s.setString(1, arma.getNome());
			s.setFloat(2, arma.getPotenza());
			s.setFloat(3, arma.getPeso());
			s.setInt(4, arma.getLivello());
			s.setString(5, arma.getTipoDanno());
			s.setFloat(6, arma.getStabilita());
			s.setFloat(7, arma.getRiduzioneDanno());
			if(arma.getScaling().isEmpty()) {
				arma.setScaling("N/D");
			}
			s.setString(8, arma.getScaling());
			s.setString(9, arma.getNomeCategoria());
			s.setString(10, arma.getNome());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ arma.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public ResultSet selectCategorie()throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_CATEGORIA_LISTA_NOMI);
		return rs;
	}
	
	public ResultSet selectArmaByNome(String nomeArma)throws SQLException{
		Connection c = connect();
		PreparedStatement s = c.prepareStatement(QRY_SELECT_ARMA_BY_NOME);
		System.out.println("Arma da cercare: " + nomeArma);
		s.setString(1,nomeArma);
		ResultSet rs = s.executeQuery();
		return rs;
	}
	
	
}
