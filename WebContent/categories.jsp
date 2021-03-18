<%@page import="com.techblog.entities.Message"%>
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
<title>Categories || TechBlog INDIA</title>

<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- FONT AWESOME LINK-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom css -->
<link href="css/home_style.css" rel="stylesheet" type="text/css">


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

					<li class="nav-item"><a class="nav-link" href="all_users.jsp"
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
	<!-- ------------------------------------------------------------------------------------------------- -->



	<!-- ------------------------------------------------------------------------------------------------- -->
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



</body>
</html>