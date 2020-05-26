<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project User Validation">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>User Validation</title>
	
	<style type="text/css">
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
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserMain um = new UserMain();
		
			if(um.validateLogin(username, password) == false) {
			
		%>
		
			<div id="warning" class="container pb-3">
				<div class="alert alert-danger">
	    			<strong>Wrong username or password!</strong>
	  			</div>
	  		</div>
	  		<button class="btn btn-outline-danger" onclick="document.location = 'UserLogin.jsp'">Back</button>
		
		<%
		
   			} else {
				
   				String welcome = "";
   				
   				User u = new User();
   				
   				u = um.getByName(username);
   				
   				welcome = "Welcome " + u.firstname + "!";
   				
   				session.setAttribute("uid", u.id); 
   				
		%>
		
			<h3 class="pb-3"><%= welcome %></h3>
			<button class="btn btn-info" onclick="document.location = 'UBookList.jsp'">to the Books</button>
		
		<%
   			}
		%>
	
	</div>
	
</body>

</html>