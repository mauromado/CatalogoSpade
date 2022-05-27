package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Abilita;
import beans.Arma;
import beans.Categoria;
import beans.Munizioni;


public class DbConnection {
	private Connection connection;
	private static String projectLocation = System.getenv("PROJECT_LOC");
	private static String dbName = "CatalogoSpade.db";
	
	private static final String QRY_ARMI_LISTA_TUTTO = "SELECT * "
			 									    + "FROM Arma;";
	
	private static final String QRY_DELETE_ARMA="DELETE FROM Arma WHERE Nome=?;";
	
	private static final String QRY_INSERT_ARMA="INSERT INTO Arma(Nome,Potenza,Peso,Livello,TipoDanno,"
			                                    + "Stabilita,RiduzioneDanno,Scaling,NomeCategoria,NomeAbilita)" 
			                                    + " VALUES(?,?,?,?,?,?,?,?,?,?)";
	
	private static final String QRY_CATEGORIA_LISTA_NOMI="SELECT NomeCategoria FROM Categoria;";
	
	private static final String QRY_SELECT_ARMA_BY_NOME="SELECT * FROM Arma WHERE Nome=?;";
	
	private static final String QRY_UPDATE_ARMA="UPDATE Arma SET Nome=?,Potenza=?,Peso=?,Livello=?,"
												+ "TipoDanno=?,Stabilita=?,RiduzioneDanno=?,Scaling=?,NomeCategoria=?,NomeAbilita=?"
												+ " WHERE Nome=?";
	
	private static final String QRY_CATEGORIA_LISTA_TUTTO="SELECT * FROM Categoria";
	
	private static final String QRY_MUNIZIONE_LISTA_TUTTO="SELECT * FROM Munizioni;";
	
	private static final String QRY_ABILITA_LISTA_TUTTO="SELECT * FROM Abilita;";
	
	private static final String QRY_INSERT_CATEGORIA="INSERT INTO Categoria(NomeCategoria,Descrizione) VALUES(?,?)";
	
	private static final String QRY_INSERT_MUNIZIONI="INSERT INTO Munizioni(Nome,Descrizione,Danno,TipoDanno) VALUES(?,?,?,?)";
	
	private static final String QRY_INSERT_ABILITA="INSERT INTO Abilita(Nome,Descrizione,TipologiaArma) VALUES(?,?,?);";
	
	private static final String QRY_DELETE_MUNIZIONI="DELETE FROM Munizioni WHERE Nome=?;";
	
	private static final String QRY_DELETE_CATEGORIA="DELETE FROM Categoria WHERE NomeCategoria=?";
	
	private static final String QRY_DELETE_ARMA_CATEGORIA="DELETE FROM Arma WHERE NomeCategoria=?";
	
	private static final String QRY_DELETE_ABILITA_CATEGORIA="DELETE FROM Abilita WHERE TipologiaArma=?";
	
	private static final String QRY_DELETE_ARMA_ABILITA="DELETE FROM ARMA WHERE NomeAbilita=?";
	
	private static final String QRY_DELETE_ABILITA="DELETE FROM ABILITA WHERE Nome=?;";
	
	private static final String QRY_UPDATE_CATEGORIA="UPDATE Categoria SET NomeCategoria=?,Descrizione=? WHERE NomeCategoria=?;";
	
	private static final String QRY_UPDATE_ABILITA="UPDATE Abilita SET Nome=?,Descrizione=?,TipologiaArma=? WHERE Nome=?;";
	
	private static final String QRY_UPDATE_MUNIZIONI="UPDATE Munizioni SET Nome=?,Descrizione=?,Danno=?,TipoDanno=? WHERE Nome=?;";
	
	private Connection connect() {
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
	
	
	public ResultSet selectAllArmi() throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_ARMI_LISTA_TUTTO);
		return rs;
	}
	
	public ResultSet selectAllMunizioni() throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_MUNIZIONE_LISTA_TUTTO);
		return rs;
	}
	
	public ResultSet selectAllAbilita() throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_ABILITA_LISTA_TUTTO);
		return rs;
	}
	
	public ResultSet selectAllCategorie() throws SQLException{
		Connection c = connect();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(QRY_CATEGORIA_LISTA_TUTTO);
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
			s.setString(10, arma.getNomeAbilita());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ arma.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public void insertMunizioni(Munizioni munizioni) throws SQLException {
		Connection c = connect();
		try {
			
			PreparedStatement s = c.prepareStatement(QRY_INSERT_MUNIZIONI);
			s.setString(1, munizioni.getNome());
			s.setString(2, munizioni.getDescrizione());
			s.setFloat(3, munizioni.getDanno());
			s.setString(4, munizioni.getTipoDanno());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento della munizione "+ munizioni.getNome() +" ("+e.getMessage()+")");
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
			s.setString(10, arma.getNomeAbilita());
			s.setString(11, arma.getNome());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ arma.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public void updateCategoria(Categoria categoria) throws SQLException {
		Connection c = connect();
		try {
			PreparedStatement s = c.prepareStatement(QRY_UPDATE_CATEGORIA);
			s.setString(1, categoria.getNome());
			s.setString(2, categoria.getDescrizione());
			s.setString(3, categoria.getNome());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ categoria.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public void updateAbilita(Abilita abilita) throws SQLException {
		Connection c = connect();
		//TODO se un abilita cambia tipo di arma le armi che avevano questa 
		//abilita dovranno cambiare di conseguenza (come ancora da definire)
		try {
			PreparedStatement s = c.prepareStatement(QRY_UPDATE_ABILITA);
			s.setString(1, abilita.getNome());
			s.setString(2, abilita.getDescrizione());
			s.setString(3, abilita.getTipologiaArma());
			s.setString(4, abilita.getNome());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ abilita.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public void updateMunizione(Munizioni munizioni) throws SQLException {
		Connection c = connect();
		try {
			PreparedStatement s = c.prepareStatement(QRY_UPDATE_MUNIZIONI);
			s.setString(1, munizioni.getNome());
			s.setString(2, munizioni.getDescrizione());
			s.setFloat(3, munizioni.getDanno());
			s.setString(4, munizioni.getTipoDanno());
			s.setString(5, munizioni.getNome());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ munizioni.getNome() +" ("+e.getMessage()+")");
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
	public void insertAbilita(Abilita abilita) throws SQLException {
		Connection c = connect();
		try {	
			PreparedStatement s = c.prepareStatement(QRY_INSERT_ABILITA);
			s.setString(1, abilita.getNome());
			s.setString(2, abilita.getDescrizione());
			s.setString(3, abilita.getTipologiaArma());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento dell'arma "+ abilita.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public void insertCategoria(Categoria categoria) throws SQLException {
		Connection c = connect();
		try {
			System.out.println("sono nel DB");
			PreparedStatement s = c.prepareStatement(QRY_INSERT_CATEGORIA);
			s.setString(1, categoria.getNome());
			s.setString(2, categoria.getDescrizione());
			s.executeUpdate();
			s.close();
		}
		catch(Exception e) {
			System.out.println("Insert: fallito l'inserimento della categoria "+ categoria.getNome() +" ("+e.getMessage()+")");
		}
	}
	
	public boolean deleteMunizione(String nomeMunizione) throws SQLException{
		boolean ris = false;
		Connection c = connect();
		try {
			PreparedStatement s = c.prepareStatement(QRY_DELETE_MUNIZIONI);
			s.setString(1, nomeMunizione);
			s.executeUpdate();
			ris=true;
			s.close();
		}
		catch(Exception e) {
			System.out.println("Delete: fallita la cancellazione della munizione "+nomeMunizione +" ("+e.getMessage()+")");
		}
		return ris;
	}
	
	public boolean deleteCategoria(String nomeCategoria) throws SQLException{
		boolean ris = false;
		Connection c = connect();
		try {
			Statement statement = c.createStatement();
			statement.executeUpdate("PRAGMA foreign_keys = ON;");
			PreparedStatement s = c.prepareStatement(QRY_DELETE_CATEGORIA);
			s.setString(1, nomeCategoria);
			s.executeUpdate();
			ris=true;
			s.close();
			statement.close();
		}
		catch(Exception e) {
			System.out.println("Delete: fallita la cancellazione della categoria "+nomeCategoria +" ("+e.getMessage()+")");
		}
		return ris;
	}
	
	public boolean deleteAbilita(String nomeAbilita) throws SQLException{
		boolean ris = false;
		Connection c = connect();
		try {
			Statement statement = c.createStatement();
			statement.executeUpdate("PRAGMA foreign_keys = ON;");
			PreparedStatement s = c.prepareStatement(QRY_DELETE_ABILITA);
			s.setString(1, nomeAbilita);
			s.executeUpdate();
			ris=true;
			s.close();
			statement.close();
		}
		catch(Exception e) {
			System.out.println("Delete: fallita la cancellazione abilità "+nomeAbilita +" ("+e.getMessage()+")");
		}
		return ris;
	}
	
}
