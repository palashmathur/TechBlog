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
.card {
	border: 1px solid black;
}

.card:hover {
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

	int b_cid = Integer.parseInt(request.getParameter("cid"));

	if (b_cid == 0) {
		list = blogsDao.getAllNotConfirmedBlogs();
	} else {
		list = blogsDao.getNotConfirmedBlogsByCategories(b_cid);
	}

	if (list.size() == 0) {
		out.print("<h3 class='display-3 text-center'>Sorry! No post in this category..</h3>");
		return;
	}
	%>

	<div class="scrollable">

		<div class="row mt-2">
			<%
			for (Blogs blog : list) {
			%>

			<div class="col-md-4">
				<div class="card mt-2">
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

							<a href="not_confirmed_single_blog.jsp?b_id=<%=blog.getB_id()%>"
							class="btn btn-primary mt-2">Read more</a>
						</small>
					</div>
					<%-- 
								<div class="card-footer">
									<div class="row row-user">
										<div class="col-md-8">
											<p class="post-user-info">
												<%
												UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
												%>



												Contributed by : <a href="#!" class="post-user-info-a"><%=userDao.getUserById(blog.getUser_id()).getUsername()%>
												</a>
											</p>
										</div>
										<div class="col-md-4">
											<p class="post-date"><%=blog.getDate().toLocaleString()%></p>
										</div>

									</div>
								</div> --%>

				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>


</body>
</html>