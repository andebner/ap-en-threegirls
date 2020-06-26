<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Book List">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="icon" href= "Icon.png">
	<title>Book List</title>
	
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

<body class="container">

	<%

		Class.forName("org.postgresql.Driver");
		
		UserMain um = new UserMain();
		
		int id = Integer.parseInt(session.getAttribute("uid").toString()); 
		
		User u = new User();
		
		u = um.getUser(id);
	
	%>
	
	<nav class="navbar navbar-light navbar-expand-sm">
	
				<a class="nav-link text-info" href="EditUser.jsp">Profile</a>
	
				<span class="navbar-brand mx-auto">Three Girls Library</span>
	
				<a class="nav-link text-info" href="Logout.jsp">Logout</a>
	
	</nav>

	<div class="container pt-4">
		<div class="alert alert-info alert-dismissible fade show">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Welcome <%= u.firstname %>!</strong>
		</div>
  	</div>

	<div id="align">
	
		<h1 class="pt-3 pb-2">Books</h1>

		<table class="table table-bordered table-hover" id="table">
			<thead class="table-info">
				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>Year</th>
					<th>Pages</th>
					<th>Borrow</th>
				</tr>
			</thead>
			<tbody>

				<%
				
					Main m = new Main();
					ArrayList<Book> books = m.getBooks();
				
					for (int i=0; i<books.size(); i++) {
						Book b = books.get(i);
					
				%>
        	
				<tr>
					<td><%= b.title %></td>
					<td><%= b.author %></td>
					<td><%= b.year %></td>
					<td><%= b.pages %></td>
					
        		<%
					
				
						if(b.borrow==true){
							
							if(b.by == u.id) {
								
								%>
									<td><button class="btn btn-outline-danger" onclick="document.location = 'BorrowBook.jsp?bid=<%= b.id %>'">Return</button></td>
								<%
								
							} else {
							
							%>
								<td style="color: red;">Not available</td>
							<%
							
							}
							
						} else {
							
							%>
								<td><button class="btn btn-outline-primary" onclick="document.location = 'BorrowBook.jsp?bid=<%= b.id %>'">Borrow</button></td>
							<%
							
						}
        		
					}
				
				%>
								
				</tr>
							
			</tbody>
		</table>
    	
    	<div>
    		<button class="btn btn-outline-primary" onclick="document.location = 'UBorrowed.jsp'">My Borrowed Books</button>
    	</div>
    	
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>

</body>

</html>