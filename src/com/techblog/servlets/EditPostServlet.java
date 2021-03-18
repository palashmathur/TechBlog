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
import javax.servlet.http.Part;

import com.techblog.database.BlogsDatabase;
import com.techblog.entities.Blogs;
import com.techblog.helper.DBConnectionProvider;
import com.techblog.helper.User_Profile_Pic_Helper;

/**
 * Servlet implementation class EditPostServlet
 */
@WebServlet("/EditPostServlet")
@MultipartConfig
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		//out.print("done");
		int bid=Integer.parseInt(request.getParameter("bid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		String btitle=request.getParameter("b_title");
		String bcontent=request.getParameter("b_content");
		String bcode=request.getParameter("b_code");
		Part part = request.getPart("b_pic");
		String bpic = part.getSubmittedFileName();
		
		Blogs blog = new Blogs(bid,btitle, bcontent, bcode, bpic);

		BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());
		if (blogDao.editPost(blog)) {

			// now pic ko folder me save krna
			String path = request.getRealPath("/") + "blog-pics" + File.separator + bpic;

			User_Profile_Pic_Helper.saveFile(part.getInputStream(), path);
			out.print("done");
		} else {
			out.print("not done");
		}
	}

}
