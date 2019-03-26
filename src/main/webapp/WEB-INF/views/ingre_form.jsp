<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>Add Ingredient</title>

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
	<form:form method="POST" action="../addIngredient"
		modelAttribute="foodIngre">

		<td><form:input type="hidden" path="food_id" /></td>
		<table>

			<tr>
				<td><form:label path="unit">unit</form:label></td>
				<td><form:input path="unit" /></td>
			</tr>
			<tr>
				<td><form:label path="code">
                      code</form:label></td>
				<td><form:select path="code">
						<c:forEach var="item" items="${ingredients}">
							<form:option value="${item.code}" label="${item.name}" />
						</c:forEach>

					</form:select></td>

			</tr>

			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form>  -->
	
	<div class="form-group" >

		<div class="card">
		  	<h1 class="card-header" style="color:black;">
		  		<i class="fas fa-plus-circle"></i> Add new Ingredent
		  		<a type="button" class="btn btn-warning" href="../">back to home page</a>
	  		</h1>

		  	<div class="card-body">
		  		<!-- Choosing a ingredient. -->
		  		<form:form method="POST" action="../addIngredient" modelAttribute="foodIngre">
		  			<form:input type="hidden" path="food_id" />
		  			
				  	<div class="form-group">
				  		<form:label path="code"><h5> <i class="fas fa-clipboard-check"></i> Select ingredient : </h5></form:label>
			  			<!--  <label><h5> Select ingredient : </h5></label> 
			      			<select id="inputingredient" class="form-control">
			        			<option selected>Choose...</option>
			        			<option>Pork</option>
			      			</select> -->
			      			<form:select path="code" class="form-control">
								<c:forEach var="item" items="${ingredients}">
									<form:option value="${item.code}" label="${item.name}" />
								</c:forEach>
							</form:select>
					</div>
	
					<!-- Unit. -->
					<div class="form-group">
						<form:label path="unit"><h5><i class="fas fa-weight"></i> Unit : </h5></form:label>
					    <!--  <label> <h5><i class="far fa-file-alt"></i> Unit : </h5></label> -->
					    <form:input class="form-control" placeholder="Enter the detail" path="unit" />
					    <!--  <input class="form-control" placeholder="Enter the detail"></input>  -->		    	    
					</div>
		
					<input class="btn btn-success" type="submit" value="Submit" />
			    	<!--  <a href="#" class="btn btn-success"><i class="fas fa-check-circle"></i> Confirm!</a> -->
		    	</form:form>
		  </div>
		</div>

	</div>


</body>
</html>