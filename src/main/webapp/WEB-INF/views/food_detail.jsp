<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>${food.name}</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="${base}/resources/css/detail_style.css">
    <link  href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" 
      rel="stylesheet"
      type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- For tooltip -->
    <script type="text/javascript">
      $(document).ready(function(){
          $('[data-toggle="tooltip"]').tooltip(
          {container:'body', trigger: 'hover', placement:"right"}
          );   
      });
  </script>
</head>
<body>
	
	<!-- 
	<c:forEach items="${memos}" var="item">

		<h1>Your name : ${item.name}</h1>
		<H3>THE TOPIC : ${item.topic}</H3>
		<H3>THE DETAIL : ${item.detail}</H3>

		<c:choose>
			<c:when test="${empty item.dateRemind}">
				<H3></H3>
			</c:when>
			<c:otherwise>
				<H3>
					<fmt:formatDate value="${item.dateRemind}" pattern="dd/MM/yyyy" />
				</H3>
			</c:otherwise>
		</c:choose>
		<a href="/delete/${item.id}">delete</a>

	</c:forEach>
	 
	<a href="../">back to home page</a>
	

	<h1>
		<a href="/foodIngredient/${food.id}">add ingredient</a>
	</h1> -->
	
	<center>
      <h1 class="text-center">
         <i class="fas fa-grin-stars"></i>
         <b>${food.name}</b>
         <i class="fas fa-grin-stars"></i> 
      </h1> 
   		 <a type="button" class="btn btn-warning" href="../">back to home page</a>
  </center>

  <br>

  <center>
      <div class="img-border">
      	  <img class="img" src="http://127.0.0.1:8887/${food.image_path}">
          <!--  <img class="img" src="picture/tomyum.jpg" alt="Card image cap"> -->
      </div>
  </center>
  


  <br>


  <div class="description">   

    <!-- For description -->
    <div class="card" >
      <h3 class="card-title"><i class="fas fa-bullhorn"></i></i> <b>Description :</b> </h3>      
      <div class="card-body">
        <p class="card-text"> &nbsp; &nbsp; &nbsp;
        	${food.description}
        </p>
      </div>
    </div>
    <!-- End description. -->
    <br> 
    <!-- Ingredient. -->
    <div class="card" >
      <h3 class="card-title"><i class="fas fa-clipboard-list"></i> <b>Ingredients :</b> </h3>  
       <div class="card-body">
            <!-- list of ingredients. -->
            <ol style="margin-left: 50px;">
            <c:forEach items="${listIngre}" var="item">
				
                  <li>
                    <!-- Each item of ingredients. -->
                        <div class="row" >
                          <!-- Name of item. -->
                                    <div class="col-sm-5">
                                        <label> ${item.name} </label>
                                    </div>
                                    
                                    <!-- Unit. -->
                                    <div class="col-sm-2">
                                        <label> ${item.unit} </label>
                                    </div>

                                    <!-- Button -->
                                    <div class="col-sm-4">
                                    	<a type="button" class="btn btn-danger" data-toggle="tooltip" data-placement="bottom" title="Remove!" href="/deleteIngre/${food.id}/${item.id}"><i class="fas fa-times"></i></a>
                                        <!--  <button type="button" class="btn btn-danger" data-toggle="tooltip" data-placement="bottom" title="Remove!">
                                          <i class="fas fa-times"></i>
                                        </button>    -->  
                                    </div>
                                </div>
                      <!-- End list of ingredients. -->
                      <br>
                    </li> 
                
                <!-- 
				<h3>
					Your name : ${item.name}
					</h1>
					<H3>THE TOPIC : ${item.unit}</H3>
					<H3>THE CODE : ${item.code}</H3>
		
		
					<a href="/deleteIngre/${food.id}/${item.id}">delete</a>  -->
			</c:forEach>
			</ol>
			
          <footer >
          	<a class="btn btn-outline-secondary" href="/foodIngredient/${food.id}">
				<i class="fas fa-plus-circle"></i> Add more ingredeient.
			</a>
            <!--  <button type="button" class="btn btn-outline-secondary">
              <i class="fas fa-plus-circle"></i> Add more ingredeient.
            </button>  -->
          </footer>
      </div>
    </div>
    <!-- End ingredent. -->
    
  </div>
  
</body>
</html>