package servlets;

import java.io.IOException;

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
	
		
	}

}
