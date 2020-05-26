<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Application Project User Registration">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Edit User</title>
	
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
			
		boolean isAdd = (session.getAttribute("uid") == null);
	
		String welcome = "";
		String submit = "";
		String back = "";
		
		if (isAdd) {
		
			welcome = "User Registration";
			submit = "Register";
			back = "UserLogin.jsp";
		
		} else {
			
			welcome = "Edit your Profile";
			submit = "Update Profile";
			back = "UBookList.jsp";
			
		}
			
		User u = new User();
			
		if (!isAdd) {
		
			UserMain um = new UserMain();
			
			int id = Integer.parseInt(session.getAttribute("uid").toString());
			
			u = um.getUser(id); 
				
		%>
				
			<div class="pt-3 pl-3">	
				<button class="btn btn-outline-danger" onclick="document.location = 'DeleteUser.jsp'">Delete Account</button>
			</div>
				
	<%
			
		}
		
	%>
	
	<div id="align">
	
		<h3 class="pb-3"><%= welcome %></h3>
		
		<form action="SaveUser.jsp" class="needs-validation">
			<script src="form-validation.js"></script>
	
			<div class="row">
				<label for="firstName">Firstname</label>
				<input type="text" id="firstName" name="firstname" class="w-100 form-control pt-2" value="<%= u.firstname %>" required>
   				<div class="invalid-feedback">Valid first name is required</div>
   			</div>
   			
   			<div class="row">
   				<label for="lastName">Lastname</label>
				<input type="text" id="lastName" name="lastname" class="w-100 form-control pt-2" value="<%= u.lastname %>" required>
    			<div class="invalid-feedback">Valid last name is required</div>
   			</div>
   			
   			<div class="row">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" class="w-100 form-control pt-2" value="<%= u.username %>" required>
   				<div class="invalid-feedback">Username is required</div>
   			</div>
   			
   			<div class="row">
   				<label for="email">Email</label>
				<input type="email" id="email" placeholder="youremail@example.com" name="email" class="w-100 form-control pt-2" value="<%= u.email %>" required>
				<div class="invalid-feedback">Valid e-mail is required</div>
   			</div>
   			
   			<div class="row">
   				<label for="password">Password</label>
   				<input type="password" id="password" name="password" class="w-100 form-control pt-2" value="<%= u.password %>" required>
   				<div class="invalid-feedback">Password is required</div>
   			</div>
   			
   			<input name="id" type="hidden" value="<%=u.id%>">
   			
   			<div class="row pt-4 justify-content-center pb-5">
   				<button type="submit" class="btn btn-success px-4 py-1 mr-2" ><%= submit %></button>
   			</div>
		</form>
		
		<button class="btn btn-outline-danger" onclick="document.location = '<%= back %>'">Back</button>
		
	</div>
	
</body>

</html>