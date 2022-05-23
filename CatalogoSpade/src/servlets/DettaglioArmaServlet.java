package servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Arma;
import database.DbConnection;

public class DettaglioArmaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PARAMETER_DETTAGLIO = "dettaglioArma";
       
    public DettaglioArmaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// http://localhost:8080/CatalogoSpade/dettaglioArmaServlet?dettaglioArma=arma y
		if(request.getParameter(PARAMETER_DETTAGLIO) != null && !request.getParameter(PARAMETER_DETTAGLIO).isEmpty()) {
			String nomeArma = request.getParameter(PARAMETER_DETTAGLIO);
			DbConnection dbConnection = new DbConnection();
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
					dbConnection.close();
					request.setAttribute("detailsArma", arma);
			}catch(Exception e){
				e.printStackTrace();		
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/DettagliArma.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
