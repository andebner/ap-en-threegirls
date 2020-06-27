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
		.navbar-brand {
			color: darkcyan  !important;
			font-family: "Times New Roman";
		}
	</style>
	
</head>

<body class="container">

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

	<div id="align">
	
		<h1 class="pt-3 pb-2">Book List</h1>

		<table class="table table-bordered table-hover" id="table">
			<thead class="table-info">
				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>Year</th>
					<th>Pages</th>
					<th>Borrowed</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<%
				
					Class.forName("org.postgresql.Driver");
							
					Main m = new Main();
					UserMain um = new UserMain();
					
					ArrayList<Book> books = m.getBooks();
				
					for (int i=0; i<books.size(); i++) {
						Book b = books.get(i);
						
						String borrowed = "";
						
						if (b.isBorrow()==false) {
							
							borrowed = "Not Borrowed";
							
						} else {
							
							User brw = new User();
							brw = um.getUser(b.by);
							
							borrowed = "Borrowed by " + brw.username + "  <button class=\"btn btn-outline-primary\" onclick=\"document.location = 'BorrowInfo.jsp?book=" + b.id + "'\">More</button>";
							
						}
					
				%>
        	
				<tr>
					<td><%= b.title %></td>
					<td><%= b.author %></td>
					<td><%= b.year %></td>
					<td><%= b.pages %></td>
					<td><%= borrowed %></td>
					<td><button class="btn btn-sm btn-outline-warning" onclick="document.location = 'BookEdit.jsp?id=<%= b.id %>'">Edit</button> | <button class="btn btn-sm btn-outline-danger" onclick="document.location = 'BookDelete.jsp?id=<%=b.id %>'">Delete</button></td>
				</tr>
        
        		<%
					}
				%>
			
			</tbody>
		</table>
    
    	<div class="pt-3 text-center"><button class="btn btn-info" onclick="document.location = 'BookEdit.jsp'">Add</button></div>
    	<div class="pt-2 pb-5 text-center"><button class="btn btn-outline-danger" onclick="document.location = 'ASelectList.jsp'">Back</button></div>
		
	</div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>

</body>

</html>