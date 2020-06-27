<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Borrowed Book List">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="icon" href= "Icon.png">
	<title>Borrowed Book List</title>
	
	<style type="text/css">
		h1 {
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
		AdminMain am = new AdminMain();
		
		String edit = "";
		String title = "";
		String ret = "";
		String back = "";
		User u = new User();
		
		if(session.getAttribute("uid")== null) {
			
			int aid = Integer.parseInt(session.getAttribute("aid").toString());
			
			Admin a = new Admin();
			a = am.getAdmin(aid);
			
			int uid = Integer.parseInt(request.getParameter("uid").toString());

			u = um.getUser(uid);
			
			edit = "EditAdmin.jsp?id=" + aid;
			title = "Books borrowed by " + u.username;
			ret = "Mark as returned";
			back = "AUserList.jsp?aid=" + a.id;
		
		} else {
		
			int uid = Integer.parseInt(session.getAttribute("uid").toString()); 
		
			u = um.getUser(uid);
		
			edit = "EditUser.jsp";
			title = "My Borrowed Books";
			ret = "Return";
			back = "UBookList.jsp";
			
		}
		
	%>
	
	<nav class="navbar navbar-light navbar-expand-sm">
	
				<a class="nav-link text-info" href="<%= edit %>">Profile</a>
	
				<span class="navbar-brand mx-auto">Three Girls Library</span>
	
				<a class="nav-link text-info" href="Logout.jsp">Logout</a>
	
	</nav>

	<div id="align">
	
		<h1 class="pt-3 pb-2"><%= title %></h1>

		<table class="table table-bordered table-hover" id="table">
			<thead class="table-info">
				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>Year</th>
					<th>Pages</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<%
				
					Main m = new Main();
					ArrayList<Book> books = m.getBooks();
				
					for (int i=0; i<books.size(); i++) {
						Book b = books.get(i);
						
						if(b.isBorrow()) {
							
							if(u.id == b.by) {
							
				%>
        	
				<tr>
					<td><%= b.title %></td>
					<td><%= b.author %></td>
					<td><%= b.year %></td>
					<td><%= b.pages %></td>
					<td><button class="btn btn-outline-danger" onclick="document.location = 'BorrowBook.jsp?bid=<%= b.id %>'"><%= ret %></button></td>
					
        		<%
					
							}
						
						}
						
					}
				
				%>		
						
				</tr>
							
			</tbody>
		</table>
    	
    	<div class="pb-5">
    		<button class="btn btn-outline-danger" onclick="document.location = '<%= back %>'">Back</button>
    	</div>
    	
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>

</body>

</html>