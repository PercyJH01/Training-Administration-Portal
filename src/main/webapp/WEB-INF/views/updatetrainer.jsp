<%@page import="project.demo.entities.Trainer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Trainer</title>
<style>
body {
	background-color: rgb(229, 211, 183);
	overflow: hidden;
}

h1 {
	text-align: center;
	margin-top: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: rgb(224, 205, 170);
	box-shadow: 0 2px 4px rgba(0, 0, 0, 1);
	margin-top: 20px;
	border: 1px solid #dddddd;
}

caption {
	font-size: 1.2em;
	font-weight: bold;
	margin-bottom: 10px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-top: 2px solid #dddddd;
	border-bottom: 2px solid #dddddd;
	border-left: 2px solid #dddddd;
	border-right: 2px solid #dddddd;
}

th {
	background-color: rgb(224, 205, 170);
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: rgb(224, 205, 170);
}

a {
	text-decoration: none;
	color: #007bff;
	margin-right: 10px;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<%
	Trainer trainer = (Trainer) request.getAttribute("trainerToupdate");
	out.print(trainer);
	%>


	<form
		action=" <%=request.getContextPath()%>/Update/<%=trainer.getTrainerId()%>"
		method="post">


		<fieldset>
			<legend>Update Trainer Form</legend>
			<input type="text" name="trainerName"
				value="<%=trainer.getTrainerName()%>"
				placeholder="Enter Trainer Name" /><br /> <input type="text"
				name="qualification" value="<%=trainer.getQualification()%>"
				placeholder="Enter Qualification" /><br /> <input type="text"
				name="trainerDescription"
				value="<%=trainer.getTrainerDescription()%>"
				placeholder="enter Description" /><br /> <input type="number"
				name="year_of_exp" value="<%=trainer.getYear_of_exp()%>"
				placeholder="experience" /><br /> <input type="submit"
				value="Submit">
		</fieldset>
	</form>


</body>
</html>