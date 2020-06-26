<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Save Admin">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Save Admin</title>
	
	<style>
		h3 {
			color: darkcyan;
			font-family: "Times New Roman";
			font-weigth: bold;
		}
		#align {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			text-align: center;
		}
		body {
			background-image: url(library.jpeg);
			background-color: rgba(255,255,255,0.8);
    		background-blend-mode: lighten;
			background-repeat: no-repeat;
			height: 100%;
			background-size: cover;
		}
	</style>
	
</head>

<body>

	<div id="align">
	
	<%
		
		Class.forName("org.postgresql.Driver");
	
		AdminMain am = new AdminMain();
	
		Admin a = new Admin();
			
		a.firstname = request.getParameter("firstname");
		a.lastname = request.getParameter("lastname");
		a.username = request.getParameter("username");
		a.password = request.getParameter("password");
			
		int id = Integer.parseInt(request.getParameter("id"));
	
		boolean isAdd = (id==0);
		
		String message = "";
			
		if (isAdd) {
			
			am.addAdmin(a);
			
			message = "You have successfully registered a new Admin!";
			
		} else {
			
			am.updateAdmin(id, a);
			
			message = "Admin data has been successfully updated!";
			
		}
				
		%>
		
			<div>
				<h3><%= message %></h3>
				<button class="btn btn-outline-info" onclick="document.location = 'AAdminList.jsp'">Go Back</button>
			</div>

	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>

</body>

</html>