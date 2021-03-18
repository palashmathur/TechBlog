package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.database.BlogsDatabase;
import com.techblog.helper.DBConnectionProvider;

/**
 * Servlet implementation class DeleteBlogServlet
 */
@WebServlet("/DeleteBlogServlet")
public class DeleteBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteBlogServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int bid = Integer.parseInt(request.getParameter("bid"));

		BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());
		boolean flag = blogDao.deleteBlog(bid);
		if(flag) {
			out.print("done");
		}
		else {
			out.print("notdone");
		}

		// out.print(bid);

	}

}
