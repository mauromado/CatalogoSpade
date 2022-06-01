package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import database.DbConnection;


@WebServlet("/LogInServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("login")!=null && request.getParameter("login").equals("accedi")) {
			if (request.getParameter("username")!=null && request.getParameter("password")!=null) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				User userDb = new User ();
				DbConnection db = new DbConnection();
				try {
					ResultSet rs = db.selectUserByUsername(username);
					if (rs.next()==false) {
						db.close();//forward jsp registrazione
					} else {
						userDb.setUsername(rs.getString("Username"));
						userDb.setEmail(rs.getString("Email"));
						userDb.setPassword(rs.getString("Password"));
						db.close();
						if (!password.equals(userDb.getPassword())){
							//forward jsp login(+messaggio password sbagliata)
						} else {
							RequestDispatcher dispatcher = request.getRequestDispatcher("pages/home.jsp");
							dispatcher.forward(request, response);
						}
					}
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
