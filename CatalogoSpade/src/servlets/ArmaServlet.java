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

import beans.Abilita;
import beans.Arma;
import beans.Categoria;
import beans.ListaAbilita;
import beans.ListaArmi;
import beans.ListaCategoria;
import beans.Munizioni;
import database.DbConnection;

public class ArmaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PARAMETER_UPDATE = "updateArma";
	private static final String PARAMETER_DELETE = "deleteArma";
	private static final String PARAMETER_INSERT = "insertArma";
	private static final String TIPO_OPERAZIONE = "tipoOperazione";

       
    public ArmaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean successOp = true;
		//update: (SELECT ARMA(DA INVIARE ALLA JSP) + UPDATE ARMA)
		if(request.getParameter(PARAMETER_UPDATE) != null) {
			String nomeArma = request.getParameter("updateArma");
			DbConnection dbConnection = new DbConnection();
			ListaCategoria listaNomiCategorie = new ListaCategoria();
			ListaAbilita listaNomiAbilita = new ListaAbilita();
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
							rs.getString("NomeCategoria"),
							rs.getString("NomeAbilita"));
				request.setAttribute("armaToUpdate", arma);
				dbConnection.close(); //chiudo
				
				rs = dbConnection.selectAllCategorie(); //riapro la connessione
				while(rs.next()){
					Categoria categoria = new Categoria(
							rs.getString("NomeCategoria"),
							rs.getString("Descrizione"));
					listaNomiCategorie.getListaNomiCategorie().add(categoria);}
				request.setAttribute("listaNomiCategorie", listaNomiCategorie);
				dbConnection.close();
				
				rs = dbConnection.selectAllAbilita();
				while(rs.next()){
					Abilita abilita = new Abilita (
							rs.getString("Nome"),
							rs.getString("Descrizione"),
							rs.getString("TipologiaArma"));
					listaNomiAbilita.getListaAbilita().add(abilita);}
				request.setAttribute("listaNomiAbilita", listaNomiAbilita);
				dbConnection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/ModificaArma.jsp");
			dispatcher.forward(request, response);
		} 
		
		//delete
		else if(request.getParameter(PARAMETER_DELETE) != null) {
			DbConnection dbConnection = new DbConnection();
			try {
				boolean ris = dbConnection.deleteArma(request.getParameter(PARAMETER_DELETE));
				if(!ris) {
					System.err.println("Errore nella delete");
				}
			
			}catch(Exception e) {
				successOp=false;
				System.err.println(e.getMessage());
				}
			dbConnection.close();
			request.setAttribute("esitoOperazione", successOp);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
		//insert
		else if(request.getParameter(PARAMETER_INSERT) != null) {
			ResultSet rs;
			DbConnection dbConnection = new DbConnection();
			ListaCategoria listaNomiCategorie = new ListaCategoria();
			ListaAbilita listaNomiAbilita = new ListaAbilita();
			try {
				rs = dbConnection.selectAllCategorie();
				while(rs.next()){
					Categoria categoria = new Categoria(
							rs.getString("NomeCategoria"),
							rs.getString("Descrizione"));
					listaNomiCategorie.getListaNomiCategorie().add(categoria);}
				request.setAttribute("listaNomiCategorie", listaNomiCategorie);
				dbConnection.close();
				
				rs = dbConnection.selectAllAbilita();
				while(rs.next()){
					Abilita abilita = new Abilita (
							rs.getString("Nome"),
							rs.getString("Descrizione"),
							rs.getString("TipologiaArma"));
					listaNomiAbilita.getListaAbilita().add(abilita);}
				request.setAttribute("listaNomiAbilita", listaNomiAbilita);
				dbConnection.close();
			
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			

			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/CreaArma.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean successOp = true;
		//inserimento:
		if(request.getParameter(TIPO_OPERAZIONE) != null && request.getParameter(TIPO_OPERAZIONE).equals("InserisciCategoria")) {
			System.out.println("sono nella servlet");
			String nome = request.getParameter("nome");
			String descrizione = request.getParameter("descrizione");
			Categoria categoria = new Categoria(nome,descrizione);
			DbConnection dbConnection = new DbConnection();
			try {
				dbConnection.insertCategoria(categoria);
			} catch (SQLException e) {
				successOp = false;
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("esitoOperazione", successOp);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
			
		else if(request.getParameter(TIPO_OPERAZIONE) != null && request.getParameter(TIPO_OPERAZIONE).equals("inserisciMunizioni")) {
			String nomeMunizioni = request.getParameter("nome");
			String descrizioniMunizioni = request.getParameter("descrizione");
			float dannoMunizioni = Float.parseFloat(request.getParameter("danno"));
			String tipoDannoMunizioni = request.getParameter("tipoDanno");
				
			Munizioni munizione = new Munizioni(nomeMunizioni,descrizioniMunizioni,dannoMunizioni,tipoDannoMunizioni);
			DbConnection dbConnection = new DbConnection();
			try {
				dbConnection.insertMunizioni(munizione);
			} catch (SQLException e) {
				successOp = false;
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("esitoOperazione", successOp);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		} 
		else if(request.getParameter(TIPO_OPERAZIONE) != null && request.getParameter(TIPO_OPERAZIONE).equals("modifica")) {
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
			String nomeAbilitaArma = request.getParameter("nomeAbilita");
			
			Arma arma = new Arma(nomeArma,potenzaArma,pesoArma,livelloArma,tipoDannoArma,
					             stabilitaArma,riduzioneDannoArma,scalingArma,nomeCategoriaArma,nomeAbilitaArma);
			DbConnection dbConnection = new DbConnection();
			try {
				dbConnection.updateArma(arma);
			} catch (SQLException e) {
				successOp = false;
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("esitoOperazione", successOp);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
			}
		else if(request.getParameter(TIPO_OPERAZIONE) != null && request.getParameter(TIPO_OPERAZIONE).equals("inserisci")) {
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
			String nomeAbilitaArma = request.getParameter("nomeAbilita");
			
			Arma arma = new Arma(nomeArma,potenzaArma,pesoArma,livelloArma,tipoDannoArma,
					             stabilitaArma,riduzioneDannoArma,scalingArma,nomeCategoriaArma,nomeAbilitaArma);
			DbConnection dbConnection = new DbConnection();
			try {
				dbConnection.insertArma(arma);
			} catch (SQLException e) {
				successOp = false;
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("esitoOperazione", successOp);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
			}
		else if(request.getParameter(TIPO_OPERAZIONE) != null && request.getParameter(TIPO_OPERAZIONE).equals("Inserisci abilita")) {
			String nomeAbilita = request.getParameter("nome");
			String descrizione = request.getParameter("descrizione");
			String tipologiaArma = request.getParameter("nomeCategoria");
			Abilita abilita = new Abilita(nomeAbilita,descrizione,tipologiaArma);
			DbConnection dbConnection = new DbConnection();
			try {
				dbConnection.insertAbilita(abilita);
			} catch (SQLException e) {
				successOp = false;
				e.printStackTrace();
			}
			dbConnection.close();
			request.setAttribute("esitoOperazione", successOp);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
	}
}
