<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Save User">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Save User</title>
	
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
	
			User u = new User();
			
			int id;
			
			if(session.getAttribute("uid") == null) {
				
				id = Integer.parseInt(request.getParameter("id"));
				u.id = Integer.parseInt(request.getParameter("id"));
				
			} else {
			
				id = Integer.parseInt(session.getAttribute("uid").toString());
				u.id = Integer.parseInt(session.getAttribute("uid").toString());
				
			}
			
			u.firstname = request.getParameter("firstname");
			u.lastname = request.getParameter("lastname");
			u.username = request.getParameter("username");
			u.email = request.getParameter("email");
			u.password = request.getParameter("password");
			
	
			boolean isAdd = (id==0);
	
			UserMain um = new UserMain();
		
			if (isAdd) {
			
				um.addUser(u);
				
		%>
		
			<div>
				<h3>You have been successfully registered!</h3>
				<button class="btn btn-success" onclick="document.location = 'UserLogin.jsp'">Login</button>
			</div>
		
		<%
		
			} else {
		
				um.updateUser(id, u);
				
				session.setAttribute("uid", id);
		
		%>
			
			<div>
				<h3>Your data has been successfully updated!</h3>
				<button class="btn btn-outline-info" onclick="document.location = 'UBookList.jsp'">Go Back</button>
			</div>
				
		<%		
				
			}
		
		%>

	</div>

</body>

</html>