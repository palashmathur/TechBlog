
<%@page import="com.techblog.entities.Categories"%>
<%@page import="com.techblog.database.UsersDatabase"%>
<%@page import="com.techblog.database.LikesDatabase"%>
<%@page import="com.techblog.entities.Blogs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.database.BlogsDatabase"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%
Admin admin = (Admin) session.getAttribute("current_admin");
if (admin == null) {
	response.sendRedirect("admin_login.jsp");
}
%>
<%@page import="com.techblog.entities.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm post || TechBlog INDIA</title>

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

.container-blog {
	box-shadow: 3px 3px 3px 3px #888888;
	background: white;
	border: 1px solid black;
}

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

body {
	background: #f5f5f5;
}

.list-group {
	margin-top: 100px;
	border: 1px solid black;
}
</style>

</head>
<body>
	<!-- --------------------------------------------------------------------------------------------------  -->

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
						href="admin_profile_page.jsp" tabindex="-1" aria-disabled="true"><span
							class="fa fa-bars"></span> Categories</a></li>
					<li class="nav-item"><a class="nav-link" href="all_users.jsp"
						tabindex="-1" aria-disabled="true"><span class="fa fa-users"></span>
							Users</a></li>

					<li class="nav-item"><a class="nav-link"
						href="confirm_post.jsp" tabindex="-1" aria-disabled="true"><span
							class="fa fa-check-square-o"> confirm Posts</span> </a></li>


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

	<!-- --------------------------------------------------------------------------------------------------  -->
	<!-- display blogs  -->
	
	<%
	BlogsDatabase blogDao = new BlogsDatabase(DBConnectionProvider.getConnection());
	ArrayList<Blogs> list = blogDao.getAllNotConfirmedBlogs();
	%>
	
	<%
	CategoriesDatabase catDao = new CategoriesDatabase(DBConnectionProvider.getConnection());
	%>
	<div class="container-fluid container-blog mt-3" style="width: 1400px">
		<div class="row">

			<div class="col-md-3  bg-secondary">
				<div class="list-group text-center">

					<a href="#" onclick="getBlogs(0,this)"
						class="c-link list-group-item list-group-item-action"
						aria-current="true"> All Posts </a>

					<%
					ArrayList<Categories> allCat = catDao.getCategories();
					for (Categories c : allCat) {
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

			<div class="col-md-9">

				<div class="row mb-2">

					<!-- for loader -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-spin fa-3x"></i>
						<h3>Loading..</h3>
					</div>

				</div>
				
					<div class="container-fluid text-center" id="blogs-container"></div>
		
			</div>

		</div>
	</div>



	<!-- --------------------------------------------------------------------------------------------------  -->



	<!-- javascript link bootstrap -->
	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

	<!-- JS for select category -->
	<script>
	function getBlogs(b_cid, temp) {
		$("#loader").show();
		$("#blogs-container").hide();
		//$(".c-link").removeClass("active");
		$(".c-link").removeClass("bg-dark");
		$(".c-link").removeClass("text-white");

		$.ajax({

			url : "not_confirmed_blogs.jsp",
			data : {
				cid : b_cid
			},
			success : function(data, textStatus, jqXHR) {
				$("#loader").hide();
				$("#blogs-container").show();

				$(temp).addClass('bg-dark');
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
</body>
</html>