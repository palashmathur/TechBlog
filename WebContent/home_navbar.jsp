<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- bootstrap link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<!-- FONT AWESOME LINK-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<!-- HOME NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asl-interpreting  fa-spin"></span> TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
     
     
      <li class="nav-item">
        <a class="nav-link" href="register.jsp" tabindex="-1" aria-disabled="true"><span class="fa fa-user-plus"></span> Sign up</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="user_login.jsp" tabindex="-1" aria-disabled="true"><span class="fa fa-user-circle"></span> Sign in</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" aria-disabled="true"><span class="	fa fa-question-circle-o"></span> About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" aria-disabled="true"><span class="fa fa-phone	"></span> Contact</a>
      </li>
    
    </ul>
  
    <form class="form-inline my-2 my-lg-0">
       <a href="admin_login.jsp" class="btn btn-outline-light" type="button" ><span class="	fa fa-user-circle"></span> Admin</a>
    </form>
  </div>
</nav>



<!-- JS link -->
<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

	<!-- jquery link  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>
</html>