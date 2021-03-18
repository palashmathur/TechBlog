<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>

<!-- bootstrap css link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<!-- custom css -->
<link href="css/home_style.css" rel="stylesheet" type="text/css">

<style>
/* for ZIG-ZAG using (clip path) */
.home_banner {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 69% 100%, 32% 89%, 0 100%, 0 0
		);
}
</style>

</head>
<body>

	<!--NAVBAR   -->
	<%@include file="home_navbar.jsp"%>
	<!-- NAVBAR END -->

	<main class="home_banner text-white" style="padding-bottom: 80px;">
		<div class="container">
			<div class="row">
				<div class="col-md-5 offset-4">

					<div class="card text-dark" style="margin-top: 70px;">
						<div class="card-header text-center">
							<span class="fa fa-user-plus fa-2x"></span><br>
							<h2>Register here</h2>
						</div>
						<div class="card-body" style="padding: 10px;">

							<!-- //REGISTRATION FORM
							 -->
							<form action="RegisterServlet" id="reg-form" method="post">

								<!-- 								//FOR USER NAME
 -->
								<div class="form-group">
									Username<input name="user_name" type="text" placeholder="username"
										class="form-control" id="username"
										aria-describedby="emailHelp">
								</div>
								<!-- 								//FOR EMAIL
 -->
								<div class="form-group">
									Email address<input name="user_email" type="email" placeholder="email"
										class="form-control" id="email" aria-describedby="emailHelp">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<!-- //FOR PASSWORD
								 -->
								<div class="form-group">
									Password <span></span><input name="user_password" placeholder="password"
										type="password" class="form-control fa fa-user"
										" id="password">
								</div>
								<!-- 	//FOR CONTACT -->
								<div class="form-group">
									Contact details<input name="user_contact" type="contact" placeholder="contact details"
										class="form-control" id="contact">
								</div>
								<!-- FOR GENDER -->
								<div class="form-group">
									Select Gender: <input type="radio" name="user_gender" value="Male"
										id="gender"> Male <input type="radio"
										name="user_gender"  value="Female" id="gender"> Female
								</div>

								<div class="form-group form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" name="check_terms"> <label
										class="form-check-label" for="exampleCheck1">terms and
										conditions</label>
								</div>

								<!-- 		//loader -->
								<div class="text-center" id="loader-div" style="display: none;">
									<span class="fa fa-refresh fa-2x"></span> <br>
									<h4>Please wait..</h4>
								</div>
								<!-- submit button -->
								<div class="text-center" id="submit-div">
									<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
									<br>
									<p>
										already registered ?<a href="user_login.jsp"> sign in</a>
									</p>
								</div>
							</form>


						</div>
					</div>

				</div>
			</div>
		</div>

	</main>


	<!-- javascript link bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- sweet alert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<!-- our javascript code  -->
	<script>
		$(document).ready(function() {

			console.log('palash mathur');

			$('#reg-form').submit(function(event) {

				event.preventDefault();

				let form = new FormData(this);

				$('#submit-div').hide();
				$('#loader-div').show();
				//send request to registerServlet

				$.ajax({

					url : "RegisterServlet",
					type : "POST",
					data : form,

					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$('#submit-div').show();
						$('#loader-div').hide();
						if (data.trim() === 'done') {
							swal("Registration successful..we are redirecting you to the loginpage")
							.then((value) => {
							window.loaction="user_login.jsp";
							});

						} else {
							swal(data);
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
						$('#submit-div').show();
						$('#loader-div').hide();
						

						swal("Something went wrong !", "...please try again letter!");
					},

					processData : false,
					contentType : false

				});
			});

		});
	</script>

</body>
</html>