<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/theme/css/style.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
</head>
<body style="background-color: gray;">
	<div class="topnav">
		<div class="header">
			<h1>Student Management App</h1>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron" style="margin-top: 100px;">
			<h3 style="text-align: center">Edit Data</h3>
			 <form:form method="POST" commandName="student" action="update"> 
				<table align="center">
					<tr>
						<td><form:hidden path="id"></form:hidden></td>
						<%-- <td><form:input path="id" class="form-control"
								value="${student.id}" /></td> --%>
					</tr>

					<tr>
						<td><form:label path="name">Name:</form:label></td>
						<td><form:input path="name" class="form-control"
								value="${student.name}" /></td>
					</tr>

					<tr>
						<td><form:label path="address">Address:</form:label></td>
						<td><form:input path="address" class="form-control"
								value="${student.address}" /></td>
					</tr>
					<tr>
						<td><form:label path="roll">Roll:</form:label></td>
						<td><form:input path="roll" class="form-control"
								value="${student.roll}" /></td>
					<tr>
						<td><button type="submit" class="btn btn-default">Submit</button></td>
					</tr>
				</table>
			</form:form>
			<a href="studentList">Go Back</a>
		</div>
	</div>
</body>
<div class="footer">
	<br>
	<div class="row">
		<div class="col-sm-6">Designed by Sandip Mahato</div>
		<div class="col-sm-6" style="text-align: right;">Address:
			Balkumari</div>
		<br>
	</div>
	<br>
</div>
</html>