<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Static content 
<link rel="stylesheet" href="/resources/css/style.css">
<script type="text/javascript" src="/resources/js/app.js"></script>-->

<title>Spring Boot</title>
</head>
<body>
	<h1>Spring Boot - MVC web application example</h1>
	<hr>

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
	</form:form>


</body>
</html>