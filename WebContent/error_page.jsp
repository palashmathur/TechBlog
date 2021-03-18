<%@page isErrorPage="true"%>
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



</head>
<body>
	<div class="container text-center">
		<img src="images/error-img.png" class="img-fluid mt-5">
		<h3 class="d	isplay-4 mt-5">Something went wrong!...please try
			again letter</h3>
		<%=exception%>
		<br>
		<a href="index.jsp" type="button"
			class="btn btn-primary btn-large  mt-4">Home</a>
	</div>
</body>
</html>