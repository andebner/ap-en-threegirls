<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Edit Books">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Edit Books</title>
	
	<style type="text/css">
		h1 {
			color: darkcyan;
			font-family: "Times New Roman";
			font-weigth: bold;
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

		<%
	
			Class.forName("org.postgresql.Driver");
		
			boolean isAdd = (request.getParameter("id")==null);
	
			String welcome = "";
		
			if (isAdd) {
		
				welcome = "Please enter the data";
		
			} else {
			
				welcome = "Please edit the data";
			
			}
		
		%>
	
		<h1 class="pl-4"><%= welcome %></h1>
	
		<form action="BookSave.jsp">
	
		<%
	
			Book b = new Book();
	
			if (!isAdd) {
			
				int id = Integer.parseInt(request.getParameter("id"));
			
				Main m = new Main();
			
				b = m.getBook(id);
			
			}
	
		%>

			<table class="table table-borderless">
        		<tr>
            		<td><label for="title">Title</label></td>
					<td><input type="text" id="title" name="title" value="<%= b.title %>"></td>
        		</tr>
        		<tr>
					<td><label for="author">Author</label></td>
            		<td><input type="text" id="author" name="author" value="<%= b.author %>"></td>
        		</tr>
        		<tr>
            		<td><label for="year">Year</label></td>
            		<td><input type="text" id="year" name="year" value="<%= b.year %>"></td>
        		</tr>
        		<tr>
            		<td><label for="pages">Pages</label></td>
            		<td><input type="text" id="pages" name="pages" value="<%= b.pages %>"></td>
        		</tr>
    		</table>
    
    		<input name="id" type="hidden" value="<%= b.id%>">
    
    		<div class="pt-3 pl-5 pb-5" style="margin-left: 50px">
        		<button class="btn btn-success" type="submit" value="Submit">Save</button>
        		<button class="btn btn-outline-danger" onclick="document.location = 'ABookList.jsp'" type="button">Close</button>
    		</div>

    	</form>
    	
    </div>

	<footer class="page-footer fixed-bottom">
		 <div class="footer-copyright text-center py-3">© 2020 Three Girls</div>
	</footer>

</body>

</html>