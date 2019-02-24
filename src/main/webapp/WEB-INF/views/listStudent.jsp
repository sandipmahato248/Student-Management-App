<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/theme/css/style1.css" />" rel="stylesheet"> 
<link href="<c:url value="/theme/css/datatables.min.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='<c:url value="/theme/js/lib/jquery.min.js"/>'></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student List</title>
</head>
<body style="background-color: #FAF0E6;">
<!--   Navigation Bar -->

	<div class="topnav">
		<span class="logo">	
		<a href="#"><img src="<c:url value="/theme/image/226777.svg" />"></a></span>
		 <h2 class="header">Student Management App</h2> 
	</div>

	<br></br>
	<br></br>
	<br></br>
<!--  Add Button -->
	<div class="container">
		<div class="row">
			<button type="button" style="margin-bottom: -20px;"
				data-toggle="modal" data-target="#myModal" 
				class="btn btn-primary col-md-offset-11">ADD</button>
			<h3 style="color: darkred; margin-left: 20px; margin-bottom: -40px;">User</h3>
<!-- Table -->
			<div class="row">
				<h3 align="center">Student List</h3>
				<table style="align: center" id="studentList"
					class="table table-bordered ">
					<thead>
						<tr>
							<th rowspan="2">ID</th>
							<th rowspan="2">Name</th>
							<th rowspan="2">Address</th>
							<th rowspan="2">Roll</th>
							<th colspan="2" style="text-align: center">Action</th>
						</tr>
						<tr>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>

				</table>
			</div>
		</div>
	</div>
	<!-- Modal to ADD Button -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- 	Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="color:white;">Registration</h4>
				</div>
				<div class="modal-body">
					<form  method="post" >
						<table>					  
							<tr>
								<td>Name:<br> <input id="name" type="text" name="name"></td>
							</tr>
							<tr>
								<td>Address:<br> <input id="address" type="text" name="address"></td>
							<tr>
								<td>Roll:<br> <input id="roll" type="text" name="roll"></td>
							<!-- <tr>
								<td><input id="btnAdd" type="button" value="Submit" /></td>
							</tr> -->
						</table>
					</form>
				</div>
				<div class="modal-footer">
				<input id="btnAdd" type="button" class="btn btn-danger" value="Submit" />
					<!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- Modal to Edit Data-->
	<div class="container">
		<div id="myModal1" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Data</h4>
					</div>
					<div class="modal-body">
						<form method="post">
							<table>
								<tr>
									<td><input type="hidden" id="idEdit" name="id"
										value="${student.id }"></td>
								</tr>
								<tr>
									<td>Name: <input type="text" id="nameEdit" name="name"
										value="${student.name }"></td>
								</tr>
								<tr>
									<td>Address: <input type="text" id="addressEdit"
										name="address" value="${student.address }"></td>
								<tr>
									<td>Roll: <input type="text" id="rollEdit" name="roll"
										value="${student.roll }"></td>
								<!-- <tr>
									<td><input id="btnUpdate" type="button" value="Submit"></td>
								</tr> -->
							</table>
						</form>
					</div>
					<div class="modal-footer">
					<input id="btnUpdate" type="button" value="Submit">
						<!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Footer -->
<div class="footer">
	<br>
	<div class="row">
		<div class="col-sm-6" style="text-align: left">Designed by
			Sandip Mahato</div>
		<div class="col-sm-6" style="text-align: right;">Address:
			Balkumari</div>
		<br>
	</div>
	<br>
</div>

<script type="text/javascript"
	src='<c:url value="/theme/js/lib/datatables.min.js"/>'></script>
	
	
<!--  JavaScript,Jquery and Ajax code -->
<script>
	var A_PAGE_CONTEXT_PATH = "${pageContext.request.contextPath}"
	/* For Adding Data */
	$("#btnAdd").click(function() {
		var studentObj = {
			name : $("#name").val(),
			address : $("#address").val(),
			roll : $("#roll").val()
		};
		console.log(studentObj);
		$.ajax({
			method : "POST",
			url : A_PAGE_CONTEXT_PATH + '/save',
			data : JSON.stringify(studentObj),
			dataType : "json",
			contentType : "application/json",
			cache : false,
			success : function(data, textStatus, xhr) {
			 alert("Data Added Successfully");  
				
			},
		 	complete : function(response) {
				 $("#myModal").modal('hide'); 
				location.reload();
				SequentialExecutor.executeNext();
			} 
			
		});
	});
	/*  Update Data */
	$("#btnUpdate").click(function() {
		var studentObj = {
			id : $("#idEdit").val(),
			name : $("#nameEdit").val(),
			address : $("#addressEdit").val(),
			roll : $("#rollEdit").val()
		};
		$.ajax({
			method : "POST",
			url : A_PAGE_CONTEXT_PATH + '/update',
			data : JSON.stringify(studentObj),
			dataType : "json",
			contentType : "application/json",
			cache : false,
			success : function(data, textStatus, xhr) {
				alert("Update Successful");
			},
			complete : function(response) {
				$("#myModal1").modal('hide');
				location.reload();
				SequentialExecutor.executeNext();
			}
		});
	});
	/* Edit Data */
	$(document).on("click", ".editStudent", function() {
		var id = parseInt($(this).attr("alt").replace("edit", ""));
		$.ajax({
			type : "POST",
			url : A_PAGE_CONTEXT_PATH + '/studentList/' + id,
			dataType : "json",
			contentType : "application/json",
			cache : false,
			success : function(response) {
				console.log(response);
				$("#nameEdit").val(response.name);
				$("#addressEdit").val(response.address);
				$("#rollEdit").val(response.roll);
				$("#idEdit").val(response.id);
			}
		});
	});
	/*  Delete Data */
	$(document).on("click", ".deleteStudent", function() {
		var id = parseInt($(this).attr("alt").replace("delete", ""));
		$.ajax({
			type : "POST",
			url : A_PAGE_CONTEXT_PATH + '/delete/' + id,
			dataType : "json",
			contentType : "application/json",
			cache : false,
			success : function(data, textStatus, xhr) {
				 alert("Delete Successful");   
				location.reload();
			}	
		});
	});
	/* DataTable */
	$(document).ready(function() {
		studentList();
	});
	function studentList() {
		$('#studentList')
				.DataTable(
						{
							"processing" : true,
							"ajax" : {
								"url" : A_PAGE_CONTEXT_PATH + '/studentList/',
								dataSrc : ''
							},

							"columns" : [
									{
										"data" : "id"
									},
									{
										"data" : "name"
									},
									{
										"data" : "address"
									},
									{
										"data" : "roll"
									},
									{
										"data" : function(param_obj, type,
												full, meta, oData) {
											return "<div><button type='button' class='btn btn-info btn-md editStudent'"
					+"data-toggle='modal' data-target='#myModal1' alt='edit"+param_obj.id+"'>"
													+ "<span class='glyphicon glyphicon-pencil'></span>"
													+ "</button></div>";
										}
									},
									{
										"data" : function(param_obj, type,
												full, meta, oData) {
											return "<div><button type='button' class='btn btn-info btn-md deleteStudent'"
					+"alt='delete"+param_obj.id+"'>"
													+ "<span class='glyphicon glyphicon-trash'></span>"
													+ "</button></div>";
										}
									} ]
						});
	}
	

	
	
	
</script>

</html>