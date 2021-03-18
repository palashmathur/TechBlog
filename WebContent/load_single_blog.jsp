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
Users user = (Users) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("user_login.jsp");
}
int b_id = Integer.parseInt(request.getParameter("b_id"));
//out.print(b_id);

BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());

Blogs blog = blogDao.getSingleBlog(b_id);
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=blog.getB_title()%> || TechBlog India</title>



<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- FONT AWESOME LINK-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom css -->
<link href="css/home_style.css" rel="stylesheet" type="text/css">


<style>
.post-title {
	font-weight: 400;
	color: white;
	font-size: 25px;
	text-shadow: 1px 1px black;
}

.post-content {
	font-weight: 200;
	font-size: 15px;
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
	height: 450px;
	overflow-y: scroll;
}
</style>


</head>
<body>

	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- navbar start-->
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
						href="user_profile_page.jsp" tabindex="-1" aria-disabled="true"><span
							class="fa fa-file-code-o"></span> All post</a></li>

					<li class="nav-item"><a class="nav-link" href="your_posts.jsp"
						tabindex="-1" aria-disabled="true"><span
							class="fa fa-asterisk"></span> My Post's</a></li>
				</ul>

				<ul class="navbar-nav mr-right">

					<li class="nav-item"><a class="nav-link" href="#!"
						tabindex="-1" data-toggle="modal" data-target="#profil-modal"
						aria-disabled="true"> <span class="fa fa-user-circle	"></span>
							<%=user.getUsername()%>
					</a></li>


					<li class="nav-item"><a class="nav-link"
						href="User_logout_Servlet" tabindex="-1" aria-disabled="true"><span
							class="fa fa-sign-out"></span> Logout</a></li>
				</ul>

			</div>
		</nav>
	</div>
	<!-- navbar end-->
	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- main content start -->

	<!-- code for displaying post start -->



	<div class="container container-post  mt-4">

		<div class="card">
			<div class="card-title text-center">
				<h4 class="post-title text-info">
					<u><%=blog.getB_title().toUpperCase()%></u>
				</h4>
			</div>


			<div class="scrollable">
				<img src="blog-pics/<%=blog.getB_pic()%>" class="card-img-top"
					alt="...">


				<p class="post-content"><%=blog.getB_content()%></p>
				<br>

				<div class="post-code">
					<pre><%=blog.getB_code()%></pre>
				</div>
			</div>
			<hr>
			<%
			UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
			%>
			<%
			LikesDatabase likeDao = new LikesDatabase(DBConnectionProvider.getConnection());
			int likes = likeDao.getTotalLikes(blog.getB_id());
			%>

			<div class="like-div mt-2 bg-light">

				<a href="#!" class=" btn btn-primary"
					onclick="doLike(<%=blog.getB_id()%>,<%=user.getId()%>)"><i
					class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=likes%>
				</span></a>
				
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				
				<small class="text-center"> Contributed by : <a
				
						href="profiles.jsp?user_id=<%=blog.getUser_id()%>"
				
						class="post-user-info-a"><%=userDao.getUserById(blog.getUser_id()).getUsername()%></a>
						
						
						&nbsp;&nbsp; || &nbsp;&nbsp; Date : <%=blog.getDate().toLocaleString()%></small></u>

			</div>
		</div>

	</div>






	<!-- code for displaying post end -->

	<!-- main content end -->

	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- profile modal start -->
	<div class="modal fade" id="profil-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">


				<!--modal header  -->
				<div class="modal-header home_banner">
					<h5 class="modal-title  text-white" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- modal body -->
				<div class="modal-body">

					<div class="container text-center">

						<!--profile pic and username  -->
						<img src="profile-pics/<%=user.getProfile()%>"
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="moldal-title mt-3"><%=user.getUsername()%></h5>

						<!--profile content  -->

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">Email id :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Password :</th>
										<td><%=user.getPassword()%></td>

									</tr>
									<tr>
										<th scope="row">Contact details :</th>
										<td><%=user.getContact()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getRegistration_time().toString()%></td>

									</tr>

								</tbody>
							</table>
						</div>


						<!-- edit profile details -->
						<div id="edit-profile" style="display: none;">

							<form action="Edit_User_Profile_Servlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">Username :</th>
											<td><input type="text" name="edit_user_name"
												value="<%=user.getUsername()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Email ID :</th>
											<td><input type="text" name="edit_user_email"
												value="<%=user.getEmail()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Password :</th>
											<td><input type="password" name="edit_user_password"
												value="<%=user.getPassword()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Contact details :</th>
											<td><input type="number" name="edit_user_contact"
												value="<%=user.getContact()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Gender :</th>
											<td><input type="radio" name="edit_user_gender"
												value="Male"> Male &nbsp;&nbsp;&nbsp;<input
												type="radio" name="edit_user_gender" value="FeMale">
												FeMale</td>

										</tr>
										<tr>
											<th scope="row">Profile pic :</th>
											<td><input type="file" name="edit_user_profile"></td>

										</tr>

										<tr>
											<th scope="row">Registered on :</th>
											<td><%=user.getRegistration_time().toString()%></td>

										</tr>


									</tbody>
								</table>

								<div class="container">
									<button class="btn btn-outline-info btn-large" type="submit">Save
										changes</button>
								</div>
							</form>
						</div>


					</div>

					<!-- modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" id="edit-profile-btn"
							class="btn btn-primary">Edit</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- profile modal end -->

	<!-- -------------------------------------------------------------------------------------------------- -->



	<!-- javascript link bootstrap -->
	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

	<!-- sweet alert cdn -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<!-- like javascript link -->
	<script src="javascript/like_js.js"></script>

	<!-- edit profile -->
	<script src="javascript/user_profile.js"></script>






</body>
</html>