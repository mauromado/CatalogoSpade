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

public class ArmiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PARAMETER_CATALOGO = "catalogo";
	private static final String PARAMETER_VALUE_CATALOGO = "mostraCatalogo";
	private static final String PARAMETER_UPDATE = "updateArma";
	private static final String PARAMETER_DELETE = "deleteArma";
	private static final String PARAMETER_INSERT = "insertArma";

       
    public ArmiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ListaArmi listaArmi = new ListaArmi();
		if(request.getParameter(PARAMETER_CATALOGO) != null && request.getParameter(PARAMETER_CATALOGO).equals(PARAMETER_VALUE_CATALOGO)) {
			ResultSet rs;
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
			}
			dbConnection.close();
			request.setAttribute("listaArmi", listaArmi);
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraCatalogo.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter(PARAMETER_UPDATE) != null) {
			System.err.println("chiamata update arma");
		}
		else if(request.getParameter(PARAMETER_DELETE) != null) {
			DbConnection dbConnection = new DbConnection();
			try {
				boolean ris = dbConnection.deleteArma(request.getParameter(PARAMETER_DELETE));
				if(!ris) {
					System.err.println("Errore nella delete");}
			
			}catch(Exception e) {}
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter(PARAMETER_INSERT) != null) {
			System.err.println("chiamata insert arma");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	

}
