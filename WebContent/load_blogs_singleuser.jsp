<%@page import="com.techblog.entities.Blogs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.BlogsDatabase"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%@page import="com.techblog.entities.Categories"%>
<%@page import="com.techblog.database.UsersDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.card-blog {
	border: 1px solid black;
}

.card-blog:hover {
	box-shadow: 3px 3px 3px 3px #888888;
	border: 1px solid black;
}

.scrollable {
	height: 650px;
	overflow-y: scroll;
}
</style>


</head>
<body>

	<%
	Thread.sleep(300);
	BlogsDatabase blogsDao = new BlogsDatabase(DBConnectionProvider.getConnection());

	ArrayList<Blogs> list = null;

	int user_id = Integer.parseInt(request.getParameter("user_id"));

	list = blogsDao.getAllBlogByUserID(user_id);

	if (list.size() == 0) {
		out.print("<h3 class='display-3 text-center'>No Post..</h3>");
		return;
	}
	%>

	<div class="scrollable text-center">

		<div class="row mt-2">
			<%
			for (Blogs blog : list) {
			%>

			<div class="col-md-4">
				<div class="card card-blog mt-2">
					<div class="card-body">
						<h5 class="card-title"><%=blog.getB_title()%></h5>

						<%
						CategoriesDatabase catDao = new CategoriesDatabase(DBConnectionProvider.getConnection());

						Categories category = catDao.getCategoryByCID(blog.getB_cid());
						%>

						<span>Category : <%=category.getC_name()%></span>
					</div>

					<%
					UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
					%>
					<div class="card-footer">
						<small class="text-center"> Contributed by : <a href="#!"><%=userDao.getUserById(blog.getUser_id()).getUsername()%></a>

							<a href="load_single_blog.jsp?b_id=<%=blog.getB_id()%>"
							class="btn btn-primary mt-2">Read more</a>
						</small>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>


</body>
</html>