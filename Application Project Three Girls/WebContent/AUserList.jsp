<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project User List">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>User List</title>
	
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
	
		<h1 class="pt-3 pb-2">User List</h1>

		<table class="table table-bordered table-hover" id="table">
			<thead class="table-info">
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Username</th>
					<th>Email</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<%
				
					Class.forName("org.postgresql.Driver");
				
					UserMain um = new UserMain();
					ArrayList<User> users = um.getAllUsers();
				
					for (int i=0; i<users.size(); i++) {
						
						User u = users.get(i);
					
				%>
        	
				<tr>
					<td><%= u.firstname %></td>
					<td><%= u.lastname %></td>
					<td><%= u.username %></td>
					<td><%= u.email %></td>
					<td><button class="btn btn-sm btn-outline-danger" onclick="document.location = 'DeleteUser.jsp?id=<%=u.id %>'">Delete</button></td>
				</tr>
        
        		<%
					}
				%>
			
			</tbody>
		</table>
    
		<div class="pt-3 text-center"><button class="btn btn-outline-danger" onclick="document.location = 'ASelectList.jsp'">Back</button></div>
		
	</div>

</body>

</html>