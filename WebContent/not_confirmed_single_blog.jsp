<%@page import="com.techblog.entities.Admin"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%@page import="com.techblog.entities.Categories"%>
<%@page import="com.techblog.database.LikesDatabase"%>
<%@page import="com.techblog.database.UsersDatabase"%>
<%@page import="org.apache.catalina.startup.UserDatabase"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.entities.Blogs"%>
<%@page import="com.techblog.entities.Users"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.BlogsDatabase"%>
<%@page import="com.techblog.database.UsersDatabase"%>

<%
Admin admin = (Admin) session.getAttribute("current_admin");
if (admin == null) {
	response.sendRedirect("admin_login.jsp");
}
int b_id = Integer.parseInt(request.getParameter("b_id"));

BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());

Blogs blog = blogDao.getSingleNotConfirmedBlog(b_id);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- FONT AWESOME LINK-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom css -->
<link href="css/home_style.css" rel="stylesheet" type="text/css">


<style>
.title-div{
width:200px;
}
.post-title {
	font-weight: 400;
	color: white;
	font-size: 30px;
	text-shadow: 1px 1px black;
}

.post-content {
	font-weight: 200;
	font-size: 25px;
}

.post-date {
	font-style: italic;
	font-size: 15px;
}

.post-user-info {
	font-size: 15px;
}

.post-user-info-a {
	font-style: italic;
}

.row-user {
	border: 1px solid rgba(0, 0, 0, 0.5);
	padding-bottom: 0px;
}

.container-post {
	box-shadow: 8px 8px 8px 8px #888888;
	max-width: 550px;
	background: white;
}

body {
	background: #f5f5f5;
}

.like-div {
	padding-bottom: 10px;
}

.scrollable {
	height: 480px;
	overflow-y: scroll;
}
</style>


</head>
<body>

	<!-- navbar start-->
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
			<a class="navbar-brand" href="index.jsp"> <span
				class="fa fa-asl-interpreting  fa-spin"></span> TechBlog
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">

					<li class="nav-item"><a class="nav-link"
						href="confirm_post.jsp" tabindex="-1" aria-disabled="true"><span
							class="fa fa-check-square-o"> confirm Posts</span> </a></li>

					<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true"><span class="fa fa-users"></span>
							Users</a></li>

					<li class="nav-item"><a class="nav-link"
						href="admin_profile_page.jsp" tabindex="-1" aria-disabled="true"><span
							class="fa fa-bars"></span> Categories</a></li>

				</ul>

				<ul class="navbar-nav mr-right">

					<li class="nav-item"><a class="nav-link" href="#!"
						tabindex="-1" data-toggle="modal" data-target="#profil-modal"
						aria-disabled="true"> <span class="fa fa-user-circle	"></span>
							<%=admin.getAdmin_name()%>
					</a></li>

					<li class="nav-item"><a class="nav-link"
						href="Admin_logout_Servlet" tabindex="-1" aria-disabled="true"><span
							class="fa fa-sign-out"></span> Logout</a></li>
				</ul>

			</div>
		</nav>
	</div>
	<!-- navbar end-->
	<!-- ------------------------------------------------------------------------------------- -->
	<!-- code for displaying post start -->

	<div class="container container-post  mt-3">
		<div class="text-center title-div">
			<h4 class="post-title text-info">
				<u><%=blog.getB_title().toUpperCase()%></u>
			</h4>
		</div>
		<hr>
		<div class="scrollable">
			<img src="blog-pics/<%=blog.getB_pic()%>" class="card-img-top"
				alt="...">


			<p class="post-content"><%=blog.getB_content()%></p>
			<br>

			<div class="post-code">
				<pre><%=blog.getB_code()%></pre>
			</div>
		</div>
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
	
		<div class="like-div mt-3">


			<a href="#!" onclick="confirmPost(<%=blog.getB_id()%>)"
				class=" btn btn-success"><i class="fa fa-check"></i> Confirm Post</a>

			<a href="#!" onclick="deletePost(<%=blog.getB_id()%>)"
				class=" btn btn-danger"><i class="fa fa-close"></i> Delete Post</a>

		</div>
	</div>

	<!-- code for displaying post end -->
	
	<!-- ----------------------------------------------------------------------------------- -->
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

	<!-- sweet alert cdn -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	<!-- for confirm  -->
	<script>
	
	 function confirmPost(bid){
		   //console.log(bid);
		   
		   swal({
			   title: "Are you sure?",
			   text: "Once Confirmed, all the users will be able to see this post!",
			   icon: "warning",
			   buttons: true,
			   dangerMode: true,
			 })
			 .then((willDelete) => {
			   if (willDelete) {
			   
				   var d = {

							bid: bid,
						}

				   
				$.ajax({
					
					url:"ConfirmBlogServlet",
					data:d,
					
					success: function(data, textStatus, jqXHR) {
						if (data.trim() == "done") {
							swal("Confirmed","","success")
							.then((value) => {
							window.location="confirm_post.jsp";
							 
							});
						   
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(data);
						
						swal("Something went wrong!", "Try again letter", "Error");
						window.location="confirm_post.jsp";
					}
					
				});   
				   
				   
			   } else {
			   
				   swal("Post not confirmed!");
				  	   }
			 });
		   
		   
		   
	   }/**
	 * 
	 */
	</script>
	
	
	<!-- for delete -->
	<script>
	 function deletePost(bid){
		   //console.log(bid);
		   
		   swal({
			   title: "Are you sure?",
			   text: "Once deleted, you will not be able to recover this post!",
			   icon: "warning",
			   buttons: true,
			   dangerMode: true,
			 })
			 .then((willDelete) => {
			   if (willDelete) {
			   
				   var d = {

							bid: bid,
						}

				   
				$.ajax({
					
					url:"DeleteNotConfirmedBlogServlet",
					data:d,
					
					success: function(data, textStatus, jqXHR) {
						if (data.trim() == "done") {
							swal("post Deleted successfuly","","success")
							.then((value) => {
							window.location="confirm_post.jsp";
							 
							});
						   
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(data);
						
						swal("Something went wrong!", "Try again letter", "Error");
						window.location="confirm_posts.jsp";
					}
					
				});   
				   
				   
			   } else {
				   swal("Post is safe !");
			   
				  	   }
			 });
		   
		   
		   
	   }/**
	 * 
	 */
	</script>
</body>
</html>