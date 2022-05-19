package servlets;

import java.io.IOException;
import beans.Arma;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class InserimentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InserimentoServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("insertArma") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/CreaArma.jsp");
			dispatcher.forward(request, response);
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeArma = request.getParameter("nome");
		float potenzaArma = Float.parseFloat(request.getParameter("potenza"));
		float pesoArma = Float.parseFloat(request.getParameter("peso"));
		int livelloArma = Integer.parseInt(request.getParameter("livello"));
		String tipoDannoArma = request.getParameter("tipoDanno");
		float stabilitaArma = Float.parseFloat(request.getParameter("stabilita"));
		int riduzioneDannoArma = Integer.parseInt(request.getParameter("riduzioneDanno"));
		String scalingArma = request.getParameter("scaling");
		String nomeCategoriaArma = request.getParameter("nomeCategoria");
		
		Arma arma = new Arma(nomeArma,potenzaArma,pesoArma,livelloArma,tipoDannoArma,
				             stabilitaArma,riduzioneDannoArma,scalingArma,nomeCategoriaArma);
		
	}

}
