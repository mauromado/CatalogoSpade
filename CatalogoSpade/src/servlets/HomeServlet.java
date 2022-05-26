package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Abilita;
import beans.Arma;
import beans.Categoria;
import beans.ListaAbilita;
import beans.ListaArmi;
import beans.ListaCategoria;
import beans.ListaMunizioni;
import beans.Munizioni;
import database.DbConnection;


public class HomeServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		private static final String PARAMETER_CATALOGO = "catalogo";
		private static final String PARAMETER_VALUE_CATALOGO = "Mostra Catalogo";
		private static final String PARAMETER_CATEGORIA = "categorie";
		private static final String PARAMETER_VALUE_CATEGORIA = "Mostra Categorie";
		private static final String PARAMETER_MUNIZIONI = "munizioni";
		private static final String PARAMETER_VALUE_MUNIZIONI = "Mostra Munizioni";
		private static final String PARAMETER_ABILITA = "abilita";
		private static final String PARAMETER_VALUE_ABILITA = "Mostra Abilita";
		ListaAbilita listaAbilita = new ListaAbilita();
	       
	    public HomeServlet() {
	        super();
	    }
	    
	    @Override
	    public void init(ServletConfig config){
	    	ResultSet rs;
			DbConnection dbConnection = new DbConnection();
			listaAbilita.getListaAbilita().clear();
			try {
				rs = dbConnection.selectAllAbilita();
				while(rs.next()) {
					System.out.println(rs.getString("Nome"));
					Abilita newAbilita= new Abilita(
							rs.getString("Nome"),
							rs.getString("Descrizione"),
							rs.getString("TipologiaArma"));
					listaAbilita.getListaAbilita().add(newAbilita);
				}
			} catch (SQLException e){
				e.printStackTrace();
			}
			dbConnection.close();
	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ListaArmi listaArmi = new ListaArmi();
			if(request.getParameter(PARAMETER_CATALOGO) != null && request.getParameter(PARAMETER_CATALOGO).equals(PARAMETER_VALUE_CATALOGO)) {//catalogo=mostraCatalogo
				ResultSet rs;
				DbConnection dbConnection = new DbConnection();
				ListaCategoria listaCategorie = new ListaCategoria();
				try {
					rs = dbConnection.selectAllArmi();
					while(rs.next()) {
						Arma newArma= new Arma(rs.getString("Nome"),
								rs.getFloat("Potenza"),
								rs.getFloat("Peso"),
								rs.getInt("Livello"),
								rs.getString("TipoDanno"),
								rs.getFloat("Stabilita"),
								rs.getInt("RiduzioneDanno"),
								rs.getString("Scaling"),
								rs.getString("NomeCategoria"),
								rs.getString("NomeAbilita"));
						listaArmi.getListaArmi().add(newArma);
					}
					dbConnection.close();
					request.setAttribute("listaArmi", listaArmi);
					
					rs = dbConnection.selectAllCategorie();
					while(rs.next()) {
						Categoria newCategoria= new Categoria(rs.getString("NomeCategoria"),
								rs.getString("Descrizione"));
						listaCategorie.getListaNomiCategorie().add(newCategoria);
					}
					dbConnection.close();
					request.setAttribute("listaCategorie", listaCategorie);
					
				} catch (SQLException e){
					e.printStackTrace();
				}
				
				request.setAttribute("listaAbilita", listaAbilita);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraCatalogo.jsp");
				dispatcher.forward(request, response);
			}
			else if(request.getParameter(PARAMETER_CATEGORIA) != null && request.getParameter(PARAMETER_CATEGORIA).equals(PARAMETER_VALUE_CATEGORIA)) {
				ResultSet rs;
				ListaCategoria listaCategorie = new ListaCategoria();
				DbConnection dbConnection = new DbConnection();
				try {
					rs = dbConnection.selectAllCategorie();
					while(rs.next()) {
						Categoria newCategoria= new Categoria(rs.getString("NomeCategoria"),
								rs.getString("Descrizione"));
						listaCategorie.getListaNomiCategorie().add(newCategoria);
					}
				} catch (SQLException e){
					e.printStackTrace();
				}
				dbConnection.close();
				request.setAttribute("listaCategorie", listaCategorie);
				RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraCategorie.jsp");
				dispatcher.forward(request, response);
				
			}
			
			else if(request.getParameter(PARAMETER_ABILITA) != null && request.getParameter(PARAMETER_ABILITA).equals(PARAMETER_VALUE_ABILITA)) {
				ResultSet rs;
				ListaCategoria listaCategorie = new ListaCategoria();
				DbConnection dbConnection = new DbConnection();
				try {
					rs = dbConnection.selectAllCategorie();
					while(rs.next()) {
						Categoria newCategoria= new Categoria(rs.getString("NomeCategoria"),
								rs.getString("Descrizione"));
						listaCategorie.getListaNomiCategorie().add(newCategoria);
					}
				} catch (SQLException e){
					e.printStackTrace();
				}
				dbConnection.close();
				request.setAttribute("listaCategorie", listaCategorie);
				init(null);
				request.setAttribute("listaAbilita", listaAbilita);
				RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraAbilita.jsp");
				dispatcher.forward(request, response);
				
			}
			
			else if(request.getParameter(PARAMETER_MUNIZIONI) != null && request.getParameter(PARAMETER_MUNIZIONI).equals(PARAMETER_VALUE_MUNIZIONI)) {
				ResultSet rs;
				ListaMunizioni listaMunizioni = new ListaMunizioni();
				DbConnection dbConnection = new DbConnection();
				try {
					rs = dbConnection.selectAllMunizioni();
					while(rs.next()) {
						Munizioni newMunizioni= new Munizioni(
								rs.getString("Nome"),
								rs.getString("Descrizione"),
								rs.getFloat("Danno"),
								rs.getString("TipoDanno"));
						listaMunizioni.getListaNomiMunizioni().add(newMunizioni);
					}
				} catch (SQLException e){
					e.printStackTrace();
				}
				dbConnection.close();
				request.setAttribute("listaMunizioni", listaMunizioni);
				RequestDispatcher dispatcher = request.getRequestDispatcher("pages/MostraMunizioni.jsp");
				dispatcher.forward(request, response);
				
			}
			
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

}
