<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>

<c:set var="base" value="${fn:substring(url, 0, fn:length(url) - fn:length(req.requestURI))}${req.contextPath}/" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Static content 
<link rel="stylesheet" href="/resources/css/style.css">
<script type="text/javascript" src="/resources/js/app.js"></script>-->

<title>Add Food</title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="${base}/resources/css/form_newFood.css">
    <link  href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" 
      rel="stylesheet"
      type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>
<body>
	
	
	<!--  
	<form:form method="POST" action="addFood" modelAttribute="foodMapper"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:label path="name">Name</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="description">description</form:label></td>
				<td><form:input path="description" /></td>
			</tr>
			<tr>
				<td><form:label path="file">
                      image_path</form:label></td>
				<td><form:input type="file" path="file" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form> -->
	
	<div class="form-group" >

		<div class="card">
		  	<h1 class="card-header" style="color:black;">
		  		<i class="fas fa-plus-circle"></i> Add new Food
		  		
		  		<a type="button" class="btn btn-warning" href="../">back to home page</a>
	  		</h1>

		  	<div class="card-body">
		  	
		  	 	<form:form method="POST" action="addFood" modelAttribute="foodMapper" enctype="multipart/form-data">		  	 	
				  	<div class="form-group">
				  		<form:label path="name"><h5> <i class="fas fa-drumstick-bite"></i><b> Food : </b></h5></form:label>
					    <!--  <label> <h5> <i class="fas fa-drumstick-bite"></i><b> Food : </b></h5></label> -->
					    <form:input path="name" class="form-control" placeholder="Enter name of food" />
					    <!--  <input class="form-control" placeholder="Enter name of food"> -->		    
					</div>
	
					<div class="form-group">
						<form:label path="description"><h5><i class="far fa-file-alt"></i> <b> Detail : </b></h5></form:label>
					    <!--  <label> <h5><i class="far fa-file-alt"></i> <b> Detail : </b></h5></label> -->
					    <form:textarea path="description" rows="4" class="form-control" placeholder="Enter the detail"/>
					    <!--  <textarea rows="4" class="form-control" placeholder="Enter the detail"></textarea> -->		    	    
					</div>
	
					<div class="form-group"> 
						<form:label path="file"><h5><i class="fas fa-camera"></i> <b>Picture : </b></h5> </form:label>
					    <form:input type="file" path="file" />
						
					</div>
					
					<input class="btn btn-success" type="submit" value="Submit" />
			    	<!--  <a href="#" class="btn btn-success"><i class="fas fa-plus-circle"></i> Create new Food</a> -->
		    	</form:form>
	
		  </div>
		</div>

	</div>


</body>
</html>