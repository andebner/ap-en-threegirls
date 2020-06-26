<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Borrow Book">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="icon" href= "Icon.png">
	<title>Borrow Book</title>
	
	<style type="text/css">
		h3 {
			color: darkcyan;
			font-family: "Times New Roman";
			font-weigth: bold;
			text-align: center;
		}

		th {
			font-family: serif;
			font-size: large;
		}
		#align {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			text-align: center;
		}
		#table {
			background-color: white;
		}
		body {
			background-image: url(library.jpeg);
			background-color: rgba(255,255,255,0.8);
    		background-blend-mode: lighten;
			background-repeat: no-repeat;
			height: 100%;
			background-size: cover;			
		}
		.navbar-brand {
			color: darkcyan  !important;
			font-family: "Times New Roman";
		}
	</style>
	
</head>

<body class="container">

			<%
				
				Class.forName("org.postgresql.Driver");
				
				UserMain um = new UserMain();
				Main m = new Main();
				
				User u = new User();
				
				int bid = Integer.parseInt(request.getParameter("bid"));	
				
				Book b = new Book();
					
				b = m.getBook(bid);
					
				String ret = "";
				String edit = "";
				
				int id = 0;
				
				if(session.getAttribute("uid")== null) {
					
					int aid = Integer.parseInt(session.getAttribute("aid").toString());
					
					id = b.by;
					ret = "UBorrowed.jsp?uid=" + b.by;
					edit = "EditAdmin.jsp?id=" + aid;
					
				} else {
					
					id = Integer.parseInt(session.getAttribute("uid").toString());
					ret = "UBookList.jsp";
					edit = "EditUser.jsp";
					
				}			
				
				u = um.getUser(id);
				
				String message = "";
					
				if(b.isBorrow()==false) {
						
					m.borrowBook(bid, u.id);
					message = "You have borrowed " + b.title;
						
				} else {
						
					m.returnBook(bid);
					message = b.title + " has been returned.";
						
				}
						
			%>
				
		<nav class="navbar navbar-light navbar-expand-sm">
	
			<a class="nav-link text-info" href="<%= edit %>">Profile</a>
	
			<span class="navbar-brand mx-auto">Three Girls Library</span>
	
			<a class="nav-link text-info" href="Logout.jsp">Logout</a>
	
		</nav>

	<div id="align">
	
		
				
		<div>
			<h3><%= message %></h3>
			<button class="btn btn-outline-danger" onclick="document.location = '<%= ret %>'">Go Back</button>
		</div>
			
    
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>

</body>

</html>