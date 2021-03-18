<%@page import="com.techblog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign in</title>

<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<!-- custom css -->
<link href="css/home_style.css" rel="stylesheet" type="text/css">


<style>
/* for ZIG-ZAG using (clip path) */
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


	<!--LOGIN FORM STARTS  -->

	<main class="d-flex align-items-center home_banner text-white"
		style="height: 90vh;">

		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card text-dark">
						<div class="card-header text-center">
							<span class="fa fa-user fa-3x"></span> <br>
							<h2>Login</h2>
						</div>

						<!--invalide user name password msg  -->
						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>

						<div class="alert <%=msg.getCssClass()%> text-center"
							role="alert">
							<%=msg.getMsg_content()%>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>

						<div class="card-body">
							<form action="User_Login_Servlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="user_email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="user_password"
										id="exampleInputPassword1">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Login</button>
									<br>
										<p>don't have an account ?<a href="register.jsp"> sign up</a>
									</p>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

	</main>

	<!--LOGIN FORM END  -->

	<!-- javascript link bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- custom javasript -->
	<script src="javascript/myjs.js"></script>
</body>
</html>