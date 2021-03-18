package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.database.AdminDatabase;
import com.techblog.entities.Admin;
import com.techblog.entities.Message;
import com.techblog.helper.DBConnectionProvider;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		
		String admin_email=request.getParameter("admin_email");
		String admin_password=request.getParameter("admin_password");
		
		AdminDatabase adminDao=new AdminDatabase(DBConnectionProvider.getConnection());
		
		Admin admin=adminDao.loginAdmin(admin_email, admin_password);
	
		if(admin==null) {
			Message error_msg = new Message("Invalide email or password", "error", "alert-danger");

			HttpSession errorSession = request.getSession();
			errorSession.setAttribute("msg", error_msg);
			
			response.sendRedirect("admin_login.jsp");
		}
		else {
			
			HttpSession session = request.getSession();
			session.setAttribute("current_admin", admin);

			response.sendRedirect("admin_profile_page.jsp");
		}
		
	}

}
