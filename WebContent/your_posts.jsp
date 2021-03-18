<%@page import="com.techblog.database.UsersDatabase"%>
<%@page import="com.techblog.entities.Categories"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%@page import="com.techblog.database.LikesDatabase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Blogs"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.BlogsDatabase"%>
<%@page import="com.techblog.database.LikesDatabase"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%@page import="com.techblog.entities.Users"%>
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
/* for ZIG-ZAG using (clip path)*/
.home_banner {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 66% 100%, 30% 93%, 0 100%, 0 0
		);
}
</style>


</head>
<body>



	<!-- current user details through session -->
	<%
	Users user = (Users) session.getAttribute("current_user");
	int user_id = user.getId();

	BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());

	ArrayList<Blogs> list = null;

	list = blogDao.getAllBlogByUserID(user_id);
	%>

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
						href="user_profile_page.jsp" tabindex="-1" aria-disabled="true"><span
							class="fa fa-code"></span> All post</a></li>

					<li class="nav-item"><a class="nav-link" href="#!"
						data-toggle="modal" data-target="#do-post-modal" tabindex="-1"
						aria-disabled="true"><span class="fa fa-edit"></span> Do post</a></li>

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

	<%
	if (list.size() == 0) {

		out.print("<h3 class='display-3 text-center mt-4'>You have not posted anything yet !</h3>");

	}
	%>


	<!-- main  part start  -->

	<!-- sho your blogs start -->
	<div class="container mt-4">
		<div class="row row-cols-1 row-cols-md-3">
			<%
			for (Blogs b : list) {
			%>
			<div class="col mb-4">
				<div class="card" style="border: 1px solid black;">
					<img src="blog-pics/<%=b.getB_pic()%>" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=b.getB_title()%></h5>
					</div>
					<%
					UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
					%>


					 <small class="text-center"> Contributed by  : <a href="profiles.jsp?user_id=<%=b.getUser_id()%>"
						class="post-user-info-a"><%=userDao.getUserById(b.getUser_id()).getUsername()%></a>
					|| Date : <%=b.getDate().toLocaleString()%></small>
					
					<div class="card-footer">
						<%
						LikesDatabase likeDao = new LikesDatabase(DBConnectionProvider.getConnection());
						int likes = likeDao.getTotalLikes(b.getB_id());
						%>

						<a href="#!" class=" btn btn-outline-primary btn-small"><i
							class="fa fa-thumbs-o-up"></i><span class="like-counter">
								<%=likes%>
						</span></a> <a href="load_my_single_post.jsp?b_id=<%=b.getB_id()%>"
							class="btn btn-primary btn-small">Read more</a>

					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
	</div>


	<!-- show your blogs end -->
	<!-- main  part end  -->
	<!--  -->
	<!-- -------------------------------------------------------------------------------------------------- -->




	<!-- do post modal start -->




	<!-- Modal -->
	<div class="modal fade" id="do-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- modal heading -->
				<div class="modal-header home_banner">
					<h5 class="modal-title text-white" id="exampleModalLabel">Write
						your blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- modal body -->
				<div class="modal-body">

					<form action="DoPostServlet" id="do-post-form" method="post">


						<select class="form-control" name="b_cid">
							<option class="text-center" selected disabled>---Select
								Category--</option>

							<%
							CategoriesDatabase categories = new CategoriesDatabase(DBConnectionProvider.getConnection());
							ArrayList<Categories> list2 = categories.getCategories();

							for (Categories c : list2) {
							%>

							<option value="<%=c.getC_id()%>"><%=c.getC_name()%></option>


							<%
							}
							%>

						</select> <br>

						<div class="form-group">
							<input type="text" name="b_title" placeholder="Blog title"
								class="form-control">
						</div>

						<div class="form-group">
							<textarea style="height: 200px;" name="b_content"
								placeholder="Enter Blog content" class="form-control"></textarea>
						</div>

						<div class="form-group">
							<textarea style="height: 150px;" name="b_code"
								placeholder="Program Code (if any)" class="form-control"></textarea>
						</div>

						<div class="form-group">
							<label>Choose pic for your blog..</label> <br> <input
								type="file" name="b_pic">
						</div>

						<div class="container text-center">
							<button class="btn btn-primary btn-large" type="submit">Post</button>
						</div>

					</form>

				</div>


			</div>
		</div>
	</div>


	<!-- do post modal end -->
	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- ----------------------------------------------------------------------------------------------  -->
	<!-- profile modal start -->
	<!-- Modal -->
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
	<!-- ----------------------------------------------------------------------------------------------  -->
	<!-- javascript link bootstrap -->
	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
	<!-- like javascript like -->
	<script src="javascript/like_js.js"></script>
	<!-- edit profile javascript-->

	<script src="javascript/EditProfile.js"></script>


	<!-- do post -->
	<script src="javascript/do_post.js"></script>
	<!-- sweet alert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



</body>
</html>