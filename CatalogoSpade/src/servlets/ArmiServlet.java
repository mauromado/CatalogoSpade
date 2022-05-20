package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Arma;
import beans.ListaArmi;
import beans.ListaCategoria;
import database.DbConnection;

public class ArmiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PARAMETER_CATALOGO = "catalogo";
	private static final String PARAMETER_VALUE_CATALOGO = "mostraCatalogo";
	private static final String PARAMETER_UPDATE = "updateArma";
	private static final String PARAMETER_DELETE = "deleteArma";
	private static final String PARAMETER_INSERT = "insertArma";
	private static final String PARAMETER_UPDATE_INSERT_BUTTON = "tipoOperazione";

       
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
			} catch (SQLException e){
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("listaArmi", listaArmi);
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraCatalogo.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter(PARAMETER_UPDATE) != null) {
			String nomeArma = request.getParameter("updateArma");
			DbConnection dbConnection = new DbConnection();
			ListaCategoria listaNomiCategorie = new ListaCategoria();;
			try {
				ResultSet rs = dbConnection.selectArmaByNome(nomeArma);
				Arma arma = new Arma(rs.getString("Nome"),
							rs.getFloat("Potenza"),
							rs.getFloat("Peso"),
							rs.getInt("Livello"),
							rs.getString("TipoDanno"),
							rs.getFloat("Stabilita"),
							rs.getInt("RiduzioneDanno"),
							rs.getString("Scaling"),
							rs.getString("NomeCategoria"));
				request.setAttribute("armaToUpdate", arma);
				rs = dbConnection.selectCategorie();
				while(rs.next()){
					listaNomiCategorie.getListaNomiCategorie().add(rs.getString("NomeCategoria"));}
				request.setAttribute("listaNomiCategorie", listaNomiCategorie);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dbConnection.close();
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/ModificaArma.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter(PARAMETER_DELETE) != null) {
			DbConnection dbConnection = new DbConnection();
			try {
				boolean ris = dbConnection.deleteArma(request.getParameter(PARAMETER_DELETE));
				if(!ris) {
					System.err.println("Errore nella delete");}
			
			}catch(Exception e) {
				System.err.println(e.getMessage());
				}
			System.out.println("Cancellazione dell'arma "+PARAMETER_DELETE+"");
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter(PARAMETER_INSERT) != null) {
			ResultSet rs;
			DbConnection dbConnection = new DbConnection();
			ListaCategoria listaNomiCategorie = new ListaCategoria();
			try {
				rs = dbConnection.selectCategorie();
				while(rs.next()){
					listaNomiCategorie.getListaNomiCategorie().add(rs.getString("NomeCategoria"));}
				}
			catch(SQLException e) {
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("listaNomiCategorie", listaNomiCategorie);
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/CreaArma.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter(PARAMETER_UPDATE_INSERT_BUTTON) != null && (request.getParameter(PARAMETER_UPDATE_INSERT_BUTTON).equals("inserisci")
				|| request.getParameter(PARAMETER_UPDATE_INSERT_BUTTON).equals("modifica")))  {
		String nomeArma = request.getParameter("nome");
		float potenzaArma = Float.parseFloat(request.getParameter("potenza"));
		float pesoArma = Float.parseFloat(request.getParameter("peso"));
		int livelloArma = Integer.parseInt(request.getParameter("livello"));
		String tipoDannoArma = request.getParameter("tipoDanno");
		float stabilitaArma = Float.parseFloat(request.getParameter("stabilita"));
		int riduzioneDannoArma;
		try{
			riduzioneDannoArma = Integer.parseInt(request.getParameter("riduzioneDanno"));
		}catch(NumberFormatException e){
			riduzioneDannoArma = 0;
		}
		String scalingArma = request.getParameter("scaling");
		String nomeCategoriaArma = request.getParameter("nomeCategoria");
		
		Arma arma = new Arma(nomeArma,potenzaArma,pesoArma,livelloArma,tipoDannoArma,
				             stabilitaArma,riduzioneDannoArma,scalingArma,nomeCategoriaArma);
		DbConnection dbConnection = new DbConnection();
		try {
			if(request.getParameter(PARAMETER_UPDATE_INSERT_BUTTON).equals("inserisci")) {
				dbConnection.insertUpdateArma(arma,false);
			}
			else {
				if(request.getParameter(PARAMETER_UPDATE_INSERT_BUTTON).equals("modifica")) {
					dbConnection.insertUpdateArma(arma,true);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dbConnection.close();
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
		dispatcher.forward(request, response);
		}
	}
	
}
