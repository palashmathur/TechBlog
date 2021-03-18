
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.CategoriesDatabase"%>
<%@page import="com.techblog.entities.Categories"%>
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
.scrollable {
	height: 480px;
	overflow-y: scroll;
}
.card,.cat-table,h4{
background:#FFFFE0;
}
</style>

</head>
<body class="bg-light">

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

						<!-- <li class="nav-item"><a class="nav-link"
							href="admin_profile_page.jsp" tabindex="-1" aria-disabled="true"><span
								class="fa fa-bars"></span> Categories</a></li>
 -->
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
	<!-- profile updated msg -->
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
	<!-- ------------------------------------------------------------------------------------------- -->
	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- categories code start -->

	<!-- add new category -->
	<div class="container mt-3" style="width: 500px;">
		<div class="card">
			<div class="card-body mx-auto">
				<h4 class="text-center card-title mt-3">Add New Category</h4>
				<br>
				<form action="AddCategoryServlet" method="post">

					<div class="form-group input-group">

						<input type="text" placeholder="Enter Category" name="cat_name"
							class="form-control" id="t2" aria-describedby="emailHelp" /> <span
							id="s2"></span>
					</div>
					<div class="form-group input-group">

						<input type="text" placeholder="Category Description"
							name="cat_des" class="form-control" id="t1"
							aria-describedby="emailHelp" /> <span id="s1"></span>
					</div>
					<button type="submit" class="btn btn-info btn-block">Add
						Course</button>
				</form>
			</div>
		</div>
	</div>



	<!-- display all categories -->

	<div class="container bg-light mt-3 border">
		<h4 class="text-center">All users</h4>
		<table class="table cat-table text-center table-hover">
			<thead>
				<tr>
					<th scope="col">S.no.</th>
					<th scope="col">Category ID</th>
					<th scope="col">Category</th>
					<th scope="col">Description</th>
					<th scope="col">Delete</th>
				</tr>

			</thead>
			
			<tbody class="scrollable">

				<%
				int x = 1;
				CategoriesDatabase catDao = new CategoriesDatabase(DBConnectionProvider.getConnection());
				ArrayList<Categories> list = catDao.getCategories();
				for (Categories cat : list) {
				%>
				<tr>
					<th scope="row"><%=x++%></th>
					<td><%=cat.getC_id()%></td>
					<td><%=cat.getC_name()%></td>
					<td><%=cat.getC_description()%></td>
					<td><a class="btn btn-danger" role="button"
						onclick="deleteCat(<%=cat.getC_id()%>)" href="#">Delete</a></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- categories code end -->
	<!-- ------------------------------------------------------------------------------------------------- -->
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
						<img src="profile-pics/<%=admin.getProfile()%>"
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="moldal-title mt-3"><%=admin.getAdmin_name()%></h5>

						<!--profile content  -->

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">Admin :</th>
										<td><%=admin.getAdmin_name()%></td>

									</tr>

									<tr>
										<th scope="row">Email id :</th>
										<td><%=admin.getAdmin_email()%></td>

									</tr>
									<tr>
										<th scope="row">Password :</th>
										<td><%=admin.getAdmin_password()%></td>

									</tr>
									<tr>
										<th scope="row">Contact details :</th>
										<td><%=admin.getAdmin_contact()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=admin.getAdmin_gender()%></td>

									</tr>

								</tbody>
							</table>
						</div>


						<!-- edit profile details -->
						<div id="edit-profile" style="display: none;">

							<form action="EditAdminProfileServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">Admin :</th>
											<td><input type="text" name="edit_admin_name"
												value="<%=admin.getAdmin_name()%>" class="form-control"></td>
											<input type="hidden" value="<%=admin.getAdmin_id()%>"
												name="admin_id">

										</tr>
										<tr>
											<th scope="row">Email ID :</th>
											<td><input type="text" name="edit_admin_email"
												value="<%=admin.getAdmin_email()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Password :</th>
											<td><input type="password" name="edit_admin_password"
												value="<%=admin.getAdmin_password()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Contact details :</th>
											<td><input type="number" name="edit_admin_contact"
												value="<%=admin.getAdmin_contact()%>" class="form-control"></td>

										</tr>
										<tr>
											<th scope="row">Gender :</th>
											<td><input type="radio" name="edit_admin_gender"
												value="Male"> Male &nbsp;&nbsp;&nbsp;<input
												type="radio" name="edit_admin_gender" value="FeMale">
												FeMale</td>

										</tr>
										<tr>
											<th scope="row">Profile pic :</th>
											<td><input type="file" name="edit_admin_profile"></td>

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

	<!-- edit profile -->
	<script src="javascript/EditProfile.js"></script>
	
	
	<!-- delete category -->
	<script>

function deleteCat(cid){
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

					cid:cid,
					}
			   
			  $.ajax({
				  
				  url:"DeleteCategoryServlet",
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