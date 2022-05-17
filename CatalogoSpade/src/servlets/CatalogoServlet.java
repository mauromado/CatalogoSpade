package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Arma;
import beans.ListaArmi;
import database.DbConnection;

public class CatalogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    public CatalogoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println("doGet Start");
		ResultSet rs;
		ListaArmi listaArmi = new ListaArmi();
		response.setContentType("text/html");
		PrintWriter stampa = response.getWriter();
		stampa.println("<p>questa e' una prova del get</p>");
		if(request.getParameter("catalogo") != null && request.getParameter("catalogo").equals("mostraCatalogo")) {
			//System.out.println("Entrato nel if");
			DbConnection dbConnection = new DbConnection();
			try {
				rs = dbConnection.selectAll();
				while(rs.next()) {
					Arma newArma= new Arma(rs.getString("Nome"),
							rs.getFloat("Potenza"),
							rs.getFloat("Peso"),
							rs.getInt("Livello"),
							rs.getString("TipoDanno"),
							rs.getFloat("Stabilita"),
							rs.getInt("RiduzioneDanno"),
							rs.getString("Scaling"),
							rs.getString("NomeCategoria"));
					listaArmi.getListaArmi().add(newArma);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} //TODO: Non stiamo inserendo niente, solo test per connessione con il Database

			dbConnection.close();
			request.setAttribute("listaArmi", listaArmi);
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraCatalogo.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	

}
