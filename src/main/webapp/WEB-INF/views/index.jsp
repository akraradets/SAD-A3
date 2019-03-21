<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Static content 
<link rel="stylesheet" href="/resources/css/style.css">
<script type="text/javascript" src="/resources/js/app.js"></script>-->





<link rel="stylesheet" href="resources/css/style.css" />


<title>Spring Boot</title>
</head>

<body>

	<img class="img" src="resources/picture/kapao.jpg" alt="Card image cap">

	<h1>Spring Boot - MVC web application example</h1>
	<hr>

	<c:forEach items="${foods}" var="item">

		<h1>Your name : ${item.name}</h1>
		<H3>THE TOPIC : ${item.description}</H3>
		<H3>THE DETAIL : ${item.image_path}</H3>

		<!--  <img src="file:/${item.image_path}">-->


		<img src="http://127.0.0.1:8887/${item.image_path}">

		<a href="file://'${item.image_path}">Link 1</a>


		<a href="/viewFood/${item.id}">view</a>
		<a href="delete/${item.id}">delete</a>

	</c:forEach>


	<h1>
		<a href="/formFood">add Food</a>
	</h1>

</body>
</html>