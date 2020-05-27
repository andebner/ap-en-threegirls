<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Admin List">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Admin List</title>
	
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
	</style>
	
</head>

<body class="container">

	<div id="align">
	
		<h1 class="pt-3 pb-2">Admin List</h1>

		<table class="table table-bordered table-hover" id="table">
			<thead class="table-info">
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Username</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<%
				
					Class.forName("org.postgresql.Driver");
				
					AdminMain am = new AdminMain();
			
					ArrayList<Admin> admins = am.getAllAdmin();
				
					for (int i=0; i<admins.size(); i++) {
						
						Admin a = admins.get(i);
					
				%>
        	
				<tr>
					<td><%= a.firstname %></td>
					<td><%= a.lastname %></td>
					<td><%= a.username %></td>
					<td><button class="btn btn-sm btn-outline-warning" onclick="document.location = 'EditAdmin.jsp?id=<%= a.id %>'">Edit</button> | <button class="btn btn-sm btn-outline-danger" onclick="document.location = 'DeleteAdmin.jsp?id=<%=a.id %>'">Delete</button></td>
				</tr>
        
        		<%
					}
				%>
			
			</tbody>
		</table>
    
    	<div class="pt-3 text-center"><button class="btn btn-info" onclick="document.location = 'EditAdmin.jsp'">Add Admin</button></div>
		<div class="pt-2 text-center"><button class="btn btn-outline-danger" onclick="document.location = 'ASelectList.jsp'">Back</button></div>

	</div>

</body>

</html>