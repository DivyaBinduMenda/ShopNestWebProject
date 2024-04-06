<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	    <title>Customer Login</title>
	    <link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
	   
	    <div class="form-container">
		    <form id="login"  action="log" method="post">
		        <label>User Name</label>
		        <input type="text" name="uname" placeholder="Username">
		        <label>Password</label>
		        <input type="Password" name="pass" placeholder="Password">
		        <input type="submit" value="Log In">
		        <a href="register.jsp">New user? Register here</a>
		    </form>
		</div>
	</body>
</html>
