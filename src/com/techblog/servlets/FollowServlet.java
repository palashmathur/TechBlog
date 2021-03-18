package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.database.FollowDatabase;
import com.techblog.database.LikesDatabase;
import com.techblog.helper.DBConnectionProvider;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FollowServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String operation = request.getParameter("operation");

		FollowDatabase followDao = new FollowDatabase(DBConnectionProvider.getConnection());

		if (operation.equals("follow")) {
			int follower_id = Integer.parseInt(request.getParameter("follower_id"));
			int following_id = Integer.parseInt(request.getParameter("following_id"));
			String flag = followDao.Follow(follower_id, following_id);
			out.print(flag);
		}
//		
//		if (operation.equals("allFollowers")) {
//			int follower_id = Integer.parseInt(request.getParameter("user_id"));
//			
//			followDao.getAllFollowers(follower_id);
//			
//		}
	}

}
