package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DbConnection;

public class CatalogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String QRY_ARMI_LISTA_TUTTO = "SELECT ar.*,ct.NomeCategoria\n"
														+ "FROM Arma AS ar,Categoria AS ct\n"
														+ "WHERE ar.ID_Categoria = ct.ID;";
       
    public CatalogoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println("doGet Start");
		boolean testDB;
		response.setContentType("text/html");
		PrintWriter stampa = response.getWriter();
		stampa.println("<p>questa e' una prova del get</p>");
		if(request.getParameter("catalogo") != null && request.getParameter("catalogo").equals("mostraCatalogo")) {
			DbConnection dbConnection = new DbConnection();
			testDB = dbConnection.connect(); //TODO: Non stiamo inserendo niente, solo test per connessione con il Database
			dbConnection.close();
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraCatalogo.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	

}
