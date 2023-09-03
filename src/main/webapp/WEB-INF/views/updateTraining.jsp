<%@page import="project.demo.entities.Training"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Training</title>
<style>
body {
		 background-color: rgb(229, 211, 183);
            
            overflow: hidden;
	}
	h1{
	text-align:center;
	margin-top:10px;
	}

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgb(224,205,170);
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
            background-color: rgb(224,205,170);
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: rgb(224,205,170);
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
	Training  training = (Training) request.getAttribute("trainingToupdate");
	out.print(training);
	%>
 
 
	<form
		action=" <%= request.getContextPath()%>/UpdateTraining/<%= training.getTrainingId() %>"
		method="post">
 
 
		<fieldset>
			<legend>Update Training Form</legend>
			
			<input  type="number" name="courseId"
				value="<%=training.getCourseId()%>" placeholder="Enter Course Id" /><br />
			
			<input type="number" name="trainerId"
				value="<%=training.getTrainerId()%>"
				placeholder="Enter trainer Id" /><br /> 
				
				<input type="date"
				name="start_date" value="<%=training.getStart_date()%>"
				placeholder="start date" /><br />
				
				<input type="date"
				name="end_date" value="<%=training.getEnd_date()%>"
				placeholder="End date" /><br /> 
				
				<input type="number" name="fees"
				value="<%=training.getFees()%>" placeholder="FFES" /><br />
				
				<input type="number" name="discount"
				value="<%=training.getDiscount()%>" placeholder="Discount" /><br />
				
				<input type="number" name="batchSize"
				value="<%=training.getBatchSize()%>" placeholder="Batch Size" /><br />
			 
			 <input type="submit" value="Submit">
		</fieldset>
	</form>
 
 
</body>
</html>