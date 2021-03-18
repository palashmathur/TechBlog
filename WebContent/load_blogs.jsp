<!-- loading your blogs ... -->

<%@page import="com.techblog.database.UsersDatabase"%>
<%@page import="com.techblog.entities.Users"%>
<%@page import="com.techblog.database.LikesDatabase"%>
<%@page import="com.techblog.entities.Blogs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.BlogsDatabase"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Users user = (Users) session.getAttribute("current_user");
%>
<%
Thread.sleep(300);
BlogsDatabase blogsDao = new BlogsDatabase(DBConnectionProvider.getConnection());

ArrayList<Blogs> list = null;

int b_cid = Integer.parseInt(request.getParameter("cid"));

if (b_cid == 0) {
	list = blogsDao.getAllBlogs();
} else {
	list = blogsDao.getBlogsByCategories(b_cid);
}

if (list.size() == 0) {
	out.print("<h3 class='display-3 text-center'>Sorry! No post in this category..</h3>");
	return;
}
%>
<div class="row row-cols-1 row-cols-md-3">
	<%
	for (Blogs b : list) {
	%>



	<div class="col mb-4">
		<div class="card" style="border: 1px solid black;">
			<img src="blog-pics/<%=b.getB_pic()%>" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title"><%=b.getB_title()%></h5>

			</div>
			<%
			UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
			%>


			<small class="text-center"> Contributed by : <a href="profiles.jsp?user_id=<%=b.getUser_id()%>"
				class="post-user-info-a"><%=userDao.getUserById(b.getUser_id()).getUsername()%></a>
				|| Date : <%=b.getDate().toLocaleString()%></small>

			<div class="card-footer">

				<%
				LikesDatabase likeDao = new LikesDatabase(DBConnectionProvider.getConnection());
				int likes = likeDao.getTotalLikes(b.getB_id());
				%>

				<a href="#!" class=" btn btn-outline-primary btn-small"><i
					class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=likes%>
				</span></a> <a href="load_single_blog.jsp?b_id=<%=b.getB_id()%>"
					class="btn btn-primary btn-small">Read more</a>

			</div>


		</div>
	</div>



	<%
	}
	%>


</div>

