
<%@page import="com.techblog.database.FollowDatabase"%>
<%@page import="com.techblog.entities.Users"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.UsersDatabase"%>

<%
int user_id = Integer.parseInt(request.getParameter("user_id"));
//	out.print(user_id);

UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
Users user = userDao.getUserById(user_id);
%>
<!-- current user details through session -->
<%
Users current_user = (Users) session.getAttribute("current_user");
int current_user_id = current_user.getId();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=user.getUsername()%> || TechBlog INDIA</title>

<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- FONT AWESOME LINK-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom css -->
<link href="css/home_style.css" rel="stylesheet" type="text/css">

<style>
.profile-col{
position:static;
}
</style>


</head>
<body onload="displayBlogs(<%=user_id%>)">


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
							<%=current_user.getUsername()%>
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

	<!-- profile code start-->
	<div class="container-fluid mt-2">

		<div class="row">
			<div class="col-md-3 profile-col">
				<div class="card text-center bg-light" style="width: 20rem;">
					<div class="card-title">
						<img src="profile-pics/<%=user.getProfile()%>"
							class="card-img-top mt-2" alt="..."
							style="max-width: 200px; max-height: 200px; border-radius: 50%;">
						<br>
						<h4 class="mt-3"><%=user.getUsername().toUpperCase()%></h4>
					</div>
					<div class="card-body">
						<h5 class="card-title"><%=user.getEmail()%></h5>
						<h6 class="card-title"><%=user.getContact()%></h6>
						<p class="card-text">
							<%
							FollowDatabase followDao = new FollowDatabase(DBConnectionProvider.getConnection());
							%>
							<a href="#" onclick="allFollowers(<%=user_id%>,'followers')">Followers
								: </a>
							<%=followDao.getTotalFollowers(user_id)%>
							|| <a href="#" onclick="allFollowers(<%=user_id%>,'following')">Following
								: </a>
							<%=followDao.getTotalFollowing(user_id)%>
						</p>
						<a href="#" class="btn btn-primary">Post's</a>

						<%
						String follow_button_html = "follow";
						if (followDao.alredyFollowing(current_user_id, user_id)) {
							follow_button_html = "unfollow";
						}
						%>
						<a href="#" class="btn btn-outline-primary follow-checker"
							onclick="follow(<%=current_user_id%>,<%=user_id%>)"><%=follow_button_html%></a>
					</div>
				</div>
			</div>
			<!-- profile col end -->

			<div class="col-md-9">

				<div class="row mb-2">

					<!-- for loader -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-spin fa-3x"></i>
						<h3>Loading..</h3>
					</div>

				</div>

				<div class="container-fluid text-center"
					id="all-followers-following-container"></div>



				<div class="container-fluid text-center" id="blogs-container"></div>

			</div>
			<!-- row end -->
		</div>
		<!-- "cantainer-fluid end -->
	</div>

	<!-- profile code end-->


	<!-- ------------------------------------------------------------------------------------------ -->
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


	<!-- script for follow -->
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

	<!-- all Followers script -->
	<script>
		$(document).ready(function() {

			$("#loader").show();
			$("#all-followers-following-container").hide();
			$("#blogs-container").hide();
			//
		});
		
	function displayBlogs(user_id){
		//console.log("blogs");
			//$("#blogs-container").html("blogs");

			$.ajax({

				url : "load_blogs_singleuser.jsp",
				data : {
					user_id : user_id
				},
				success : function(data, textStatus, jqXHR) {
					$("#loader").hide();
					$("#blogs-container").show();

					/* $(temp).addClass('bg-secondary');
					$(temp).addClass('text-white'); */

					$("#blogs-container").html(data);
					console.log(data);

				}

			});
			
			
	}
		
		
function allFollowers(user_id,operation){
	//console.log(user_id);
	        $("#loader").hide();
			$("#all-followers-following-container").show();
			$("#blogs-container").hide();
	
	$.ajax({
		url:"all_followers.jsp",
		
		data : {
			user_id : user_id,
			operation:operation
		},
		
		success:function(data, textStatus, jqXHR){
			console.log(data);
			$("#all-followers-following-container").html(data);
		},
		error:function(jqXHR, textStatus, errorThrown){
			console.log(data+", error");
		
	}
	});
	
}
</script>
</body>
</html>