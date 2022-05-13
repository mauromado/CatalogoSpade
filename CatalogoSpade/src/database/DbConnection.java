package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DbConnection {
	private Connection connection;
	public Connection connect() {
		try {
			Class.forName("org.sqlite.JDBC");
			//connection = DriverManager.getConnection("jdbc:sqlite:D:/PCTO/CatalogoSpade/CatalogoSpade.db");
			connection = DriverManager.getConnection("jdbc:sqlite:./CatalogoSpade.db");
			System.out.println("connected");
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		
		return connection;
	}
	public void close() {
		try {
			this.connection.close();
			System.out.println("disconnected");
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void insert() {
		Connection c = this.connect();
	}
}
