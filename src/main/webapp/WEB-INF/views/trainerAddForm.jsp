<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADD Trainer</title>
<style>
body {
	background-color: rgb(229, 211, 183);
	overflow: hidden;
}

h1 {
	text-align: center;
	margin-top: 10px;
}
.reg {
	margin-top: 170px;
}

form {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	
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

	<div class="reg">
	<form action="addTrainer" method="post">

		<table>
			<tr>
				<td>Trainer Name</td>
				<td><input type="text" name="trainerName"
					placeholder="Trainer Name" /></td>
			</tr>
			<tr>
				<td>Qualification</td>
				<td><input type="text" name="qualification"
					placeholder="Qualification" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input type="text" name="trainerDescription"
					placeholder="Description" /></td>
			</tr>
			<tr>
				<td>Years of Experience</td>
				<td><input type="number" name="year_of_exp"
					placeholder="Experience" /></td>
			</tr>

			<tr>
				<td><input type="reset" value="Reset" /> <input id="submit"
					type="submit" value="Submit" />
			</tr>
		</table>
	</form>
	</div>

</body>
</html>