package com.techblog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.startup.UserDatabase;

import com.techblog.database.UsersDatabase;
import com.techblog.entities.Message;
import com.techblog.entities.Users;
import com.techblog.helper.DBConnectionProvider;
import com.techblog.helper.User_Profile_Pic_Helper;

/**
 * Servlet implementation class Edit_User_Profile_Servlet
 */
@WebServlet("/Edit_User_Profile_Servlet")
@MultipartConfig
public class Edit_User_Profile_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Edit_User_Profile_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String user_name = request.getParameter("edit_user_name");
		String user_email = request.getParameter("edit_user_email");
		String user_password = request.getParameter("edit_user_password");
		String user_contact = request.getParameter("edit_user_contact");
		String user_gender = request.getParameter("edit_user_gender");
		Part part = request.getPart("edit_user_profile");
		String user_profile = part.getSubmittedFileName();

		// get current user from session

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("current_user");

		user.setUsername(user_name);
		user.setEmail(user_email);
		user.setPassword(user_password);
		user.setContact(user_contact);
		user.setGender(user_gender);
		user.setProfile(user_profile);

		// creating object of UserDatabase class

		UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());

		boolean ans = userDao.updateUser(user);

		if (ans == true) {

			// out.print("success");

			String path = request.getRealPath("/") + "profile-pics" + File.separator + user.getProfile();

			if (User_Profile_Pic_Helper.saveFile(part.getInputStream(), path)) {
				out.print("saved");
				Message msg = new Message("Profile updated successfuly", "success", "alert-success");
				session.setAttribute("msg", msg);

			} else {
				out.print("not saved");
				Message msg = new Message("Something went wrong..try again letter", "danger", "alert-danger");
				session.setAttribute("msg", msg);
			}

			// response.sendRedirect("user_profile_page.jsp");
		} else {
			out.print("error");
			Message msg = new Message("Something went wrong..try again letter", "danger", "alert-danger");
			session.setAttribute("msg", msg);
		}
		response.sendRedirect("user_profile_page.jsp");
	}

}
