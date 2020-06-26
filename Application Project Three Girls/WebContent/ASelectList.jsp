<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Application Project Select List">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="icon" href= "Icon.png">
	<title>Select List</title>
	
	<style type="text/css">
		h3 {
			color: darkcyan;
			font-family: "Times New Roman";
			font-weigth: bold;
		}
		body {
			background-image: url(library.jpeg);
			background-color: rgba(255,255,255,0.8);
    		background-blend-mode: lighten;
			background-repeat: no-repeat;
			height: 100%;
			background-size: cover;
		}
		#align {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			text-align: center;
		}
		.alert {
			opacity: 0.7;
			text-align: center;
		}
		.navbar-brand {
			color: darkcyan  !important;
			font-family: "Times New Roman";
		}
	</style>
</head>

<body>

	<%
	
		int id = Integer.parseInt(session.getAttribute("aid").toString());
	
		AdminMain am = new AdminMain();
		Admin a = new Admin();
		
		a = am.getAdmin(id);
		
	%>

	<nav class="navbar navbar-light navbar-expand-sm">
	
				<a class="nav-link text-info" href="EditAdmin.jsp?id=<%= a.id %>">Profile</a>
	
				<span class="navbar-brand mx-auto">Three Girls Library</span>
	
				<a class="nav-link text-info" href="Logout.jsp">Logout</a>
	
	</nav>

	<div class="container pt-4">
		<div class="alert alert-info alert-dismissible fade show">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Welcome <%= a.firstname %>!</strong>
		</div>
  	</div>

	<div id="align">
	
		<h3 class="pb-3">Select List</h3>
		
		<div class="pb-2">
			<button class="btn btn-info" onclick="document.location = 'ABookList.jsp'">Books</button>
		</div>
		<div class="pb-2">
			<button class="btn btn-info" onclick="document.location = 'AUserList.jsp'">Users</button>
		</div>
		<button class="btn btn-info" onclick="document.location = 'AAdminList.jsp'">Admins</button>
	
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>
	
</body>

</html>