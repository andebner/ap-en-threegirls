<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Application Project Admin Login">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Admin Login</title>
	
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
	</style>
</head>

<body>

	<div id="align">
		<h3 class="pb-3">Admin Login</h3>
		
		<form action="AdminValidate.jsp" class="needs-validation pb-5">
				<script src="form-validation.js"></script>
   			<div class="row">
   				<label for="username" class="pb-2">Username</label>
				<input type="text" id="username" name="username" class="w-100 form-control" required>
				<div class="invalid-feedback">Valid username is required</div>
   			</div>
   			<div class="row pt-3">
   				<label for="password" class="pb-2">Password</label>
				<input type="password" id="password" name="password" class="w-100 form-control" required>
				<div class="invalid-feedback">Valid Password is required</div>
   			</div>
   			<div class="row pt-4 justify-content-center">
   				<button type="submit" class="btn btn-success px-4 py-1 mr-2">Login</button>
   			</div>
		</form>
		
		<button class="btn btn-outline-danger" onclick="document.location = 'SelectLogin.jsp'">Back</button>
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>
	
</body>

</html>