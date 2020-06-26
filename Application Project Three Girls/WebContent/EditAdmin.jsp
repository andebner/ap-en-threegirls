<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Application Project Edit Admin">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Edit Admin</title>
	
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
	
	<%
	
		Class.forName("org.postgresql.Driver");
	
		AdminMain am = new AdminMain();
			
		boolean isAdd = (request.getParameter("id")==null);
	
		String welcome = "";
		String submit = "";
		
		if (isAdd) {
		
			welcome = "Admin Registration";
			submit = "Register";
	
		} else {
			
			welcome = "Edit Admin Profile";
			submit = "Update Profile";
					
		}
			
		Admin a = new Admin();
			
		if (!isAdd) {
						
			int id = Integer.parseInt(request.getParameter("id"));
		
			a = am.getAdmin(id);
		
		%>
			<div class="pt-3 pl-3">
				<button class="btn btn-outline-danger" onclick="document.location = 'DeleteAdmin.jsp?id=<%= a.id %>'">Delete Admin Account</button>
			</div>	
			
		<%
				
			}
		
	%>
	
	<div id="align">
	
		<h3 class="pb-3"><%= welcome %></h3>
		
		<form action="SaveAdmin.jsp" class="needs-validation">
			<script src="form-validation.js"></script>
	
			<div class="row">
				<label for="firstName">Firstname</label>
				<input type="text" id="firstName" name="firstname" class="w-100 form-control pt-2" value="<%= a.firstname %>" required>
   				<div class="invalid-feedback">Valid first name is required</div>
   			</div>
   			
   			<div class="row">
   				<label for="lastName">Lastname</label>
				<input type="text" id="lastName" name="lastname" class="w-100 form-control pt-2" value="<%= a.lastname %>" required>
    			<div class="invalid-feedback">Valid last name is required</div>
   			</div>
   			
   			<div class="row">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" class="w-100 form-control pt-2" value="<%= a.username %>" required>
   				<div class="invalid-feedback">Username is required</div>
   			</div>
   			
   			<div class="row">
   				<label for="password">Password</label>
   				<input type="password" id="password" name="password" class="w-100 form-control pt-2" value="<%= a.password %>" required>
   				<div class="invalid-feedback">Password is required</div>
   			</div>
   			
   			<input name="id" type="hidden" value="<%= a.id %>">
   			
   			<div class="row pt-4 justify-content-center pb-5">
   				<button type="submit" class="btn btn-success px-4 py-1 mr-2" ><%= submit %></button>
   			</div>
		</form>
		
		<%
			
			String back = "";
		
			if(session.getAttribute("aid") == null) {
				
				back = "AAdminList.jsp";
				
			} else {
				
				back = "ASelectList.jsp";
				
			}
		%>
		
		<button class="btn btn-outline-danger" onclick="document.location = '<%= back %>'">Back</button>
		
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>
	
</body>

</html>