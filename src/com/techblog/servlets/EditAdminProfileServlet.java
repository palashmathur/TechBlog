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

import com.techblog.database.AdminDatabase;
import com.techblog.database.UsersDatabase;
import com.techblog.entities.Admin;
import com.techblog.entities.Message;
import com.techblog.entities.Users;
import com.techblog.helper.DBConnectionProvider;
import com.techblog.helper.User_Profile_Pic_Helper;

/**
 * Servlet implementation class EditAdminProfileServlet
 */
@WebServlet("/EditAdminProfileServlet")
@MultipartConfig
public class EditAdminProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAdminProfileServlet() {
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

		int admin_id = Integer.parseInt(request.getParameter("admin_id"));
		String admin_name = request.getParameter("edit_admin_name");
		String admin_email = request.getParameter("edit_admin_email");
		String admin_password = request.getParameter("edit_admin_password");
		String admin_contact = request.getParameter("edit_admin_contact");
		String admin_gender = request.getParameter("edit_admin_gender");
		Part part = request.getPart("edit_admin_profile");
		String admin_profile = part.getSubmittedFileName();

		// out.print("aao seth");

		// get current admin from session

		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("current_admin");

		admin.setAdmin_id(admin_id);
		admin.setAdmin_name(admin_name);
		admin.setAdmin_email(admin_email);
		admin.setAdmin_password(admin_password);
		admin.setAdmin_contact(admin_contact);
		admin.setAdmin_gender(admin_gender);
		admin.setProfile(admin_profile);

		// creating object of AdminDatabase class

		AdminDatabase adminDao = new AdminDatabase(DBConnectionProvider.getConnection());

		boolean ans = adminDao.updateAdmin(admin);
		if (ans == true) {

			// out.print("success");

			String path = request.getRealPath("/") + "profile-pics" + File.separator + admin.getProfile();

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
		response.sendRedirect("admin_profile_page.jsp");
	}

}
