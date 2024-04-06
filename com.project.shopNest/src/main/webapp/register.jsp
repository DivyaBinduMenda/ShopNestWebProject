<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	    <title>Customer Registration</title>
	    <link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
	    
	    <div class="form-container">
		    <form method="post" action="reg">
		        <label>User Name</label>	
		        <input type="text" name="uname" placeholder="Username">
		        <label>Email</label>	
		        <input type="text" name="mail" placeholder="E mail">
		        <label>Password</label>	
		        <input type="Password" name="pass" placeholder="Password">
		        <label>Gender</label>	
		        <div>
		            <input type="radio" name="gender" value="male"/> Male   
		            <input type="radio" name="gender" value="female"/> Female 
		            <input type="radio" name="gender" value="other"/> Other        
		        </div>
		        <label>Address</label>	
		        <textarea rows="2" cols="20" name="address"></textarea>
		        <input type="submit" value="Register">
		        <a href="login.jsp">Already registered? Sign in instead</a>
		    </form>
	    </div>
	</body>
</html>
