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


public class MostraCatalogoServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		private static final String PARAMETER_CATALOGO = "catalogo";
		private static final String PARAMETER_VALUE_CATALOGO = "mostraCatalogo";
	       
	    public MostraCatalogoServlet() {
	        super();
	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ListaArmi listaArmi = new ListaArmi();
			if(request.getParameter(PARAMETER_CATALOGO) != null && request.getParameter(PARAMETER_CATALOGO).equals(PARAMETER_VALUE_CATALOGO)) {//catalogo=mostraCatalogo
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
			
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

}
