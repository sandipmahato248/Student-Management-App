<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<h1>Student Management App</h1>
<form:form method="POST" commandName="student" action="save">
					<table align="center">
						<tr>
							<td><form:label path="name">Name:</form:label></td>
							<td><form:input path="name" value="${student.name}" /></td>
						</tr>
						
						<tr>
							<td><form:label path="address">Address:</form:label></td>
							<td><form:input path="address" value="${student.address}" /></td>
						</tr>
						<tr>
							<td><form:label path="roll">Roll:</form:label></td>
							<td><form:input path="roll" value="${student.roll}" /></td>
						<tr>
							<td><input type="submit" value="Submit" /></td>
						</tr>
					</table>
				</form:form>
				<a href="studentList">Goto list page</a>
</body>
</html>