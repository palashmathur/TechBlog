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

import com.techblog.database.BlogsDatabase;
import com.techblog.entities.Blogs;
import com.techblog.entities.Users;
import com.techblog.helper.DBConnectionProvider;
import com.techblog.helper.User_Profile_Pic_Helper;

/**
 * Servlet implementation class DoPostServlet
 */
@WebServlet("/DoPostServlet")
@MultipartConfig
public class DoPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoPostServlet() {
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

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("current_user");

		int user_id = user.getId();

		int b_cid = Integer.parseInt(request.getParameter("b_cid"));
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		String b_code = request.getParameter("b_code");

		Part part = request.getPart("b_pic");
		String b_pic = part.getSubmittedFileName();

		Blogs blog = new Blogs(b_title, b_content, b_code, b_pic, null, b_cid, user_id);

		BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());
		if (blogDao.doPost(blog)) {

			// now pic ko folder me save krna
			String path = request.getRealPath("/") + "blog-pics" + File.separator + b_pic;

			User_Profile_Pic_Helper.saveFile(part.getInputStream(), path);
			out.print("done");
		} else {
			out.print("not done");
		}
		/*
		 * out.print(b_cid); out.print(b_title); out.print(b_content);
		 * out.print(b_code); out.print(b_pic); out.print(user_id);
		 */
	}

}
