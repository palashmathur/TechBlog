<%@page import="com.techblog.entities.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.UsersDatabase"%>
<%@page import="com.techblog.entities.Admin"%>
<%@page import="com.techblog.entities.Message"%>
<%
Admin admin = (Admin) session.getAttribute("current_admin");
if (admin == null) {
	response.sendRedirect("admin_login.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users || TechBlog INDIA</title>

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
	<!-- ------------------------------------------------------------------------------------------------- -->
	<%
	UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
	ArrayList<Users> list = userDao.getAllUser();

	if (list.size() == 0) {
		out.print("<h3 class='display-3 text-center'>No Users yet..</h3>");
	}
	%>
	<div class="container mt-5 border">
		<h4 class="text-center">All users</h4>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">S.no.</th>
					<th scope="col">ID</th>
					<th scope="col">Username</th>
					<th scope="col">Email ID</th>
					<th scope="col">Password</th>
					<th scope="col">Contact</th>
					<th scope="col">Gender</th>
					<th scope="col">Reg. Date</th>
					<th scope="col">Profile</th>
					<th scope="col">Delete</th>

				</tr>
			</thead>
			<tbody>
				<%
				int x = 1;
				for (Users user : list) {
				%>
				<tr>
					<th scope="row"><%=x++%></th>
					<td><%=user.getId()%></td>
					<td><a href="#!"><%=user.getUsername()%></a></td>
					<td><%=user.getEmail()%></td>
					<td><%=user.getPassword()%></td>
					<td><%=user.getContact()%></td>
					<td><%=user.getGender()%></td>
					<td><%=user.getRegistration_time()%></td>
					<td><img src="profile-pics/<%=user.getProfile()%>"
						style="max-width: 50px; max-height: 50px"></td>

					<td><a class="btn btn-danger" role="button" href="#"
						onclick="deleteUser(<%=user.getId()%>)">Delete</a></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

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

	<!-- delete user -->
	<script>

function deleteUser(user_id){
	/* console.log(user_id); */

	swal({
		  title: "Are you sure?",
		  text: "Once deleted, all data of the user will also get deleted !",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {

			   var d = {

						user_id:user_id,
					}
			   
			  $.ajax({
				  
				  url:"DeleteUserServlet",
				  data:d,
				  
				  success:function(data,textStatus, jqXHR){
					  
					  if(data.trim()=="done")
					  {
						  swal("Deleted successfuly!", "", "success");
					  }
					  else{
						  console.log("not deleted");
						  swal("Something went wrong", "Try again letter", "error");
					  }
				  },
				  error:function(jqXHR, textStatus, errorThrown){
						  console.log("not deleted some");
						  swal("Something went wrong", "Try again letter", "error");
						  }
			  });
			  
		    
		    
		  } else {
		  
		  }
		});

	
	
}

</script>
</body>
</html>