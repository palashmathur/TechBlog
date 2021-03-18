<%@ page import="java.sql.*"%>
<%@ page import="com.techblog.helper.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog</title>

<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

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

	<!--NAVBAR   -->
	<%@include file="home_navbar.jsp"%>
	<!-- NAVBAR END -->

	<!--BANNER START-->

	<div class="container-fluid  m-0 p-0">
		<div class="jumbotron home_banner">
			<div class="container text-white text-center">
				<h1>Welcome to TechBlog</h1>
				<p>
					Sharing knowledge has helped mankind survive and evolve into the
					intelligent and productive species he is today. <br>In the
					animal kingdom and indeed in business, knowledge sharing can make
					the difference between survival and extinction.
				</p>
				<br>
				<p>
					" There is no wealth like knowledge, <br>and no poverty like
					ignorance "
				</p>

				<a href="register.jsp" type="button" class="btn btn-outline-light">
					<span class="fa fa-user-plus"></span> Sign up
				</a>
				<a href="user_login.jsp" type="button" class="btn btn-light"> <span
					class="fa fa-user fa-spin"></span> Sign in
				</a>
			</div>
		</div>
	</div>

	<!-- BANNER END -->


	<!-- CARD START -->
	<div class="container">

		<div class="row mb-2">
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn text-white bg-dark">Read more</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn text-white bg-dark">Read more</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn text-white bg-dark">Read more</a>
					</div>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn text-white bg-dark">Read more</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn text-white bg-dark">Read more</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn text-white bg-dark">Read more</a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- CARD END -->

	<!-- javascript link bootstrap -->
	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>


	<!-- custom javasript -->
	<script src="javascript/myjs.js"></script>

</body>
</html>