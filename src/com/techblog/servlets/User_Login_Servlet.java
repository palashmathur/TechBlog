package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.database.UsersDatabase;
import com.techblog.entities.*;
import com.techblog.helper.DBConnectionProvider;

/**
 * Servlet implementation class User_Login_Servlet
 */
@WebServlet("/User_Login_Servlet")
public class User_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_Login_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String user_email = request.getParameter("user_email");
		String user_password = request.getParameter("user_password");

		UsersDatabase userdb = new UsersDatabase(DBConnectionProvider.getConnection());

		Users current_user = userdb.LoginUser(user_email, user_password);

		if (current_user == null) {

			// out.print("invalid credentials");
			Message error_msg = new Message("Invalide username or password", "error", "alert-danger");

			HttpSession errorSession = request.getSession();
			errorSession.setAttribute("msg", error_msg);
			
			response.sendRedirect("user_login.jsp");


		} else {

			HttpSession session = request.getSession();
			session.setAttribute("current_user", current_user);

			response.sendRedirect("user_profile_page.jsp");
		}

	}

}
