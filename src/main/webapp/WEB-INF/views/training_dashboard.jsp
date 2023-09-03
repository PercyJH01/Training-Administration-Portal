<%@page import="java.util.Base64"%>
<%@page import="project.demo.entities.Training"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Training Dashborad</title>

<style>
body {
		 background-color: rgb(229, 211, 183);
            
            overflow: hidden;
	}
	
	h1{
	text-align:center;
	margin-top:20px;
	
	}
	.tab{
	margin-top:40px;
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
	List<Training> listOfTraining = (List) request.getAttribute("listOfTraining");
	%>
	<h1>Training List</h1>
	<div class="tab">
	<table>
		<tr>
			<th>ID</th>
			<th>Course ID</th>
			<th>Trainer ID</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Fees</th>
			<th>Discount</th>
			<th>Batch Size</th>
			<th>Offer Price</th>
			<th>Update</th>
			<th>Delete</th>

		</tr>

		<!-- Dynamic No of rows depending upon records in the database -->

		<%
		int serialNo = 0;
		for (Training training : listOfTraining) {
		%>
		<tr>
			<td><%=training.getTrainingId()%></td>
			<td><%=training.getCourseId()%></td>
			<td><%=training.getTrainerId()%></td>
			<td><%=training.getStart_date()%></td>
			<td><%=training.getEnd_date() %></td>
			<td><%=training.getFees()%></td>
			<td><%=training.getDiscount()%></td>
			<td><%=training.getBatchSize()%></td>
			<td><%=training.getDiscountedPrice() %></td>
			
			<td><a
				href="<%=request.getContextPath()%>/Update_Training/<%=training.getTrainingId()%>">updateTraining</a>
			</td>
			<td><a
				href="<%=request.getContextPath()%>/delete_training/<%=training.getTrainingId()%>">DeleteTraining</a>
			</td>


		</tr>
		<%
		}
		%>
		
		

	</table>

	<button>
		<a href="<%=request.getContextPath()%>/openDashboardTraining">Dashboard</a>
	</button>
	</div>


	<p>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
			out.print(message);
		}
		%>

	</p>
</body>
</html>
