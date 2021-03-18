package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.database.CategoriesDatabase;
import com.techblog.helper.DBConnectionProvider;

/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String cat_name = request.getParameter("cat_name");
		String cat_des = request.getParameter("cat_des");
		
		CategoriesDatabase catDao=new CategoriesDatabase(DBConnectionProvider.getConnection());
		boolean flag = catDao.insertCategory(cat_name,cat_des);
		
		if(flag) {
			response.sendRedirect("admin_profile_page.jsp");
		}
		else {
			response.sendRedirect("error_page.jsp");
		}
	}

}
