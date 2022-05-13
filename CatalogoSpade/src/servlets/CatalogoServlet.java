package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DbConnection;

public class CatalogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CatalogoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter stampa = response.getWriter();
		stampa.println("<p>questa e' una prova</p>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter stampa = response.getWriter();
		stampa.println("<p>questa e' una prova</p>");
		DbConnection dbConnection = new DbConnection();
		dbConnection.insert(); //TODO: Non stiamo inserendo niente, solo test per connessione con il Database
		dbConnection.close();
	}
	
	

}
