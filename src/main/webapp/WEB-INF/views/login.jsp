<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #ebcfd1;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    width: 350px;
    max-width: 90%;
    background-image: url("<c:url value="/resources/images/bg1.jpg" />") no-repeat;
	background-size: cover;
	
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 8px;
    color: #555;
}

input {
    width: 330px;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: auto;
    transition: background-color 0.3s;
    margin-left:140px;
}

button:hover {
    background-color: #0056b3;
}
@media (max-width: 400px) {
    .container {
        width: 80%;
    }
}
</style>

</head>
<body style ="background-image: url('<c:url value="/resources/images/login1.jpg"/>');background-size: cover;">
<div class="container">
    <h1>Login Form</h1>
    <form action = "adminlogin" method ="post">
    	
    	
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <button type="submit" >Login</button>
    </form>
    
    <% 
    String error = (String)request.getAttribute("error");
    out.print(error);
    %>
</div>
</body>
</html>