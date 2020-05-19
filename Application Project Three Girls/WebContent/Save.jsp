<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="def.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="description" content="Application Project Save Book">
	<meta name="author" content="Group Three Girls">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" href= "Icon.png">
	<title>Save Book</title>
	
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
			background-color: rgba(255,255,255,0.6);
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
	
			Book b = new Book();
			b.title = request.getParameter("title");
			b.author = request.getParameter("author");
			b.year = Integer.parseInt(request.getParameter("year"));
			b.pages = Integer.parseInt(request.getParameter("pages"));
			int id = Integer.parseInt(request.getParameter("id"));
	
			boolean isAdd = (id==0);
	
			Main m = new Main();
		
			if (isAdd) {
			
				m.addBook(b);
		
			} else {
		
				m.updateBook(id, b);
		
			}
		
		%>

		<div>
			<h3>The Book has been successfully saved!</h3>
			<button class="btn btn-outline-info" onclick="document.location = 'List.jsp'">Go Back</button>
		</div>

	</div>

</body>

</html>