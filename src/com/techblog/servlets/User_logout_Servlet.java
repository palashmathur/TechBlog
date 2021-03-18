package com.techblog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.entities.Message;

/**
 * Servlet implementation class User_logout_Servlet
 */
@WebServlet("/User_logout_Servlet")
public class User_logout_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User_logout_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		session.removeAttribute("current_user");

		Message Logout_msg = new Message("Logout successfuly", "success", "alert-success");
		session.setAttribute("msg", Logout_msg);
		response.sendRedirect("user_login.jsp");
	}

}
