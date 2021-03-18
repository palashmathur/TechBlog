package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.database.UsersDatabase;
import com.techblog.entities.Users;
import com.techblog.helper.DBConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
//ye mapping hui h web.xml me
@WebServlet("/RegisterServlet")

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doPost method of servlet
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// content type set kra
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		String check = request.getParameter("check_terms");
		if (check == null) {
			out.println("terma and condition ko agree kr");
		} else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String contact = request.getParameter("user_contact");
			String gender = request.getParameter("user_gender");

			// user class ka object bnaya aur iske corresponding constructor udhr call ho
			// jayega
			Users user = new Users(name, email, password, contact, gender);

			// UserDatabase class ka object bnaya aur wha constructor chal jayega
			// connection pass kra yha se wha accept kr lega wo
			UsersDatabase insertuser = new UsersDatabase(DBConnectionProvider.getConnection());

			// insertUser method of UserDatabase ko call kra jo ki insert kra degi user ko
			// Users table me aur
			// aur successesfuly enter kra ne pr true return kr degi aur koi error whera aai
			// to false.
			if (insertuser.insertUser(user)) {
				out.print("successful");
			} else {
				out.print("error");
			}
		}

	}

}
