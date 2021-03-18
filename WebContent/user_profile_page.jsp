
<!-- checking session -->

<%@page import="com.techblog.database.FollowDatabase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%@page import="com.techblog.entities.Categories"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.entities.Users"%>
<%@ page errorPage="error_page.jsp"%>
<%
Users user = (Users) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("user_login.jsp");
}
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
.home_banner {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 66% 100%, 30% 93%, 0 100%, 0 0
		);
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
	<!-- profile updated msg  -->
	<div class="container">
		<%
		Message msg = (Message) session.getAttribute("msg");
		if (msg != null) {
		%>

		<div class="alert <%=msg.getCssClass()%> text-center" role="alert">
			<%=msg.getMsg_content()%>
		</div>

		<%
		session.removeAttribute("msg");
		}
		%>
	</div>

	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- main part coding  start-->

	<main>
		<!-- Categories list and post start -->

		<div class="container-fluid  m-0 p-0">
			<div class="jumbotron home_banner">
				<div class="list-group text-center "
					style="width: 300px; margin-left: 550px;">

					<a href="#" onclick="getBlogs(0,this)"
						class="c-link list-group-item list-group-item-action "
						aria-current="true"> All Posts </a>

					<%
					CategoriesDatabase C_categories = new CategoriesDatabase(DBConnectionProvider.getConnection());

					ArrayList<Categories> c_List = C_categories.getCategories();

					for (Categories c : c_List) {
					%>
					<a href="#" onclick="getBlogs(<%=c.getC_id()%>,this)"
						class="c-link list-group-item list-group-item-action"
						aria-current="true"> <%=c.getC_name()%>
					</a>

					<%
					}
					%>


				</div>

			</div>
		</div>


		<!-- for blogs -->

		<div class="container">

			<div class="row mb-2">

				<!-- for loader -->
				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-spin fa-3x"></i>
					<h3>Loading..</h3>
				</div>

				<!-- for blogs -->
				<div class="container-fluid text-center" id="blogs-container"></div>

			</div>
		</div>
		<!-- Categories list and post end -->
	</main>
	<!-- main part coding end -->
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
								Category---</option>

							<%
							CategoriesDatabase categories = new CategoriesDatabase(DBConnectionProvider.getConnection());
							ArrayList<Categories> list = categories.getCategories();

							for (Categories c : list) {
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
						<a href="#" data-toggle="modal" data-target="#followers-modal">Followers</a>
						:
						<%=11%>
						|| <a href="#" data-toggle="modal" data-target="#following-modal" >following</a> :
						<%=22%>
						<!--profile conten	t  -->

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

	<!-- Followers Modal start -->

	<!-- Modal -->
	<div class="modal fade" id="followers-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Followers</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				int user_id = user.getId();
				FollowDatabase followDao = new FollowDatabase(DBConnectionProvider.getConnection());
				ArrayList<Users> followersList = followDao.getFollowers(user_id);
				%>

				<div class="modal-body">

					<table class="table table-borderless">

						<tbody>
							<%
							for (Users follower : followersList) {
							%>
							<tr>
								<td><img src="profile-pics/<%=follower.getProfile()%>"
									style="width: 50px; height: 50px; border-radius: 25px;">&nbsp;&nbsp;&nbsp;
									<a href="profiles.jsp?user_id=<%=follower.getId()%>"><%=follower.getUsername()%></a></td>

								<%
								if (user_id == follower.getId()) {

								} else {
								%>

								<%
								String fol_btn_clr = "outline-primary";
								String follow_button_html = "follow";
								if (followDao.alredyFollowing(user_id, follower.getId())) {
									follow_button_html = "unfollow";
								}
								if (follow_button_html.equals("follow")) {
									fol_btn_clr = "primary";
								}
								%>
								<td><a href="#"
									onclick="follow(<%=user_id%>,<%=follower.getId()%>)"
									type="button" class="btn follow-checker btn-<%=fol_btn_clr%>"><%=follow_button_html%></a></td>
								<%
								}
								%>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<!-- Followers Modal end -->

	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- Following modal start -->
	
	<div class="modal fade" id="following-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Following</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				
				ArrayList<Users> followingList = followDao.getFollowing(user_id);
				%>

				<div class="modal-body">

					<table class="table table-borderless">

						<tbody>
							<%
							for (Users following : followingList) {
							%>
							<tr>
								<td><img src="profile-pics/<%=following.getProfile()%>"
									style="width: 50px; height: 50px; border-radius: 25px;">&nbsp;&nbsp;&nbsp;
									<a href="profiles.jsp?user_id=<%=following.getId()%>"><%=following.getUsername()%></a></td>

								<%
								if (user_id == following.getId()) {

								} else {
								%>

								<%
								String fol_btn_clr = "outline-primary";
								String follow_button_html = "follow";
								if (followDao.alredyFollowing(user_id, following.getId())) {
									follow_button_html = "unfollow";
								}
								if (follow_button_html.equals("follow")) {
									fol_btn_clr = "primary";
								}
								%>
								<td><a href="#"
									onclick="follow(<%=user_id%>,<%=following.getId()%>)"
									type="button" class="btn follow-checker btn-<%=fol_btn_clr%>"><%=follow_button_html%></a></td>
								<%
								}
								%>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	
	<!-- Following modal end -->

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

	<!-- edit profile -->

	<script src="javascript/EditProfile.js"></script>


	<!-- do post -->
	<script src="javascript/do_post.js"></script>

	<!-- show blogs javascript start -->

	<script>
		function getBlogs(b_cid, temp) {
			$("#loader").show();
			$("#blogs-container").hide();
			//$(".c-link").removeClass("active");
			$(".c-link").removeClass("bg-secondary");
			$(".c-link").removeClass("text-white");

			$.ajax({

				url : "load_blogs.jsp",
				data : {
					cid : b_cid
				},
				success : function(data, textStatus, jqXHR) {
					$("#loader").hide();
					$("#blogs-container").show();

					$(temp).addClass('bg-secondary');
					$(temp).addClass('text-white');

					$("#blogs-container").html(data);
					console.log(data);

				}

			})
		}

		$(document).ready(function() {

			//by defalut 0 mtlb sari posts
			let allPostRef = $('.c-link')[0];
			getBlogs(0, allPostRef);
		});
	</script>


	<!-- show blogs javascript end -->

	<!-- follow script -->
	<script>
 function follow(follower_id,following_id){
	
	
	var d={
		
		follower_id:follower_id,
		following_id:following_id,
		operation:"follow",
	}
	
 $.ajax({
	 
	 url:"FollowServlet",
	 data:d,
	 
	 success:function(data, textStatus, jqXHR){
		if(data.trim()=="followed") {
			$(".follow-checker").html("unfollow");
			
		 if(data.trim()=="unfollowed") {
				$(".follow-checker").html("follow");
			}
		}
		 
	 },
	 error:function(jqXHR, textStatus, errorThrown){
			 
		
	 }
 });
}

</script>

</body>
</html>