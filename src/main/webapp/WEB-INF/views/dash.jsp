<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Custom Website</title>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Roboto:700&display=swap');
*{
	padding: 0;
	margin: 0;
}
.wrapper{
	background-image: url("<c:url value="/resources/images/bg1.jpg" />") no-repeat;
	background-size: cover;
	height: 100vh;
}
.navbar{
	position: fixed;
	height: 80px;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(0,0,0,0.4);
}
.navbar .logo{
	width: 140px;
	height: auto;
	padding: 20px 100px;
}
.navbar ul{
	float: right;
	margin-right: 20px;
}
.navbar ul li{
	list-style: none;
	margin: 0 8px;
	display: inline-block;
	line-height: 80px;
}
.navbar ul li a{
	font-size: 20px;
	font-family: 'Roboto', sans-serif;
	color: white;
	padding: 6px 13px;
	text-decoration: none;
	transition: .4s;
}
.navbar ul li a.active,
.navbar ul li a:hover{
	background: red;
	border-radius: 2px;
}
.wrapper .center{
	position: absolute;
	left: 50%;
	top: 55%;
	transform: translate(-50%, -50%);
	font-family: sans-serif;
	user-select: none;
}
.center h1{
	color: white;
	font-size: 70px;
	width: 900px;
	font-weight: bold;
	text-align: center;
}
.center h2{
	color: white;
	font-size: 70px;
	font-weight: bold;
	margin-top: 10px;
	width: 885px;
	text-align: center;
}
.center .buttons{
	margin: 35px 280px;
}
.buttons button{
	height: 50px;
	width: 150px;
	font-size: 18px;
	font-weight: 600;
	color: #ffb3b3;
	background: red;
	outline: none;
	cursor: pointer;
	border: 1px solid #cc0000;
	border-radius: 25px;
	transition: .4s;
}
.buttons .btn2{
	margin-left: 25px;
}
.buttons button:hover{
	background: #cc0000;
}

	</style>
</head>
<body style ="background-image: url('<c:url value="/resources/images/bg1.jpg"/>');background-size: cover;">
	<div class="wrapper">
			<nav class="navbar">
				 <img class="logo" src="<c:url value="/resources/images/logo1.png"/>">
				<ul>
					<li><a class="active" href="#">Home</a></li>
					<li><a href="aboutus">About Us</a></li>
					<li><a href="login">login</a></li>
					<li><a href="contact">Contact Us</a></li>
					<li><a href="services">Services</a></li>
				</ul>
			</nav>
			<div class="center">
			<h1>Welcome To Genome</h1>
			<h2>Training Administration Portal </h2>
			<div class="buttons">
		</div>
		</div>
</body>
</html>