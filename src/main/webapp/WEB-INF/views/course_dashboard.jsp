<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="project.demo.entities.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Dashboard</title>

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
        margin_top:50px;
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
	List<Course> listOfCourse = (List) request.getAttribute("listOfCourse");
	%>
	<h1>Course List</h1>
	<div class="tab">
	<table>
		<tr>
			<th>ID</th>
			<th>Course Name</th>
			<th>Course Description</th>
			<th>Category</th>
			<th>Audience</th>
			<th>Benefits</th>
			<th>Edit Course</th>
			<th>Delete Course</th>
		</tr>
		<%
		int serialNo = 0;
		for (Course course : listOfCourse) {
		%>

		<tr>
			<td><%=course.getCourseId()%></td>
			<td><%=course.getCourseName()%></td>
			<td><%=course.getDescription()%></td>
			<td><%=course.getCategory()%></td>
			<td><%=course.getIntendedAudience()%></td>
			<td><%=course.getBenefits()%></td>
			<td><a
				href="<%=request.getContextPath()%>/update_course/<%=course.getCourseId()%>">Update</a></td>
			<td><a
				href="<%=request.getContextPath()%>/delete/<%=course.getCourseId()%>">Delete</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<button>
		<a href="<%=request.getContextPath()%>/openIndex">Home Page</a>
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