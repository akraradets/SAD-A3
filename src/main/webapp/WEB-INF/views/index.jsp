<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.io.File"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Static content 
<link rel="stylesheet" href="/resources/css/style.css">
<script type="text/javascript" src="/resources/js/app.js"></script>-->


<title>Home</title>
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="stylesheet" href="${base}/resources/css/style.css" />
    <link  href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" 
      rel="stylesheet"
      type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



</head>

<body>

    <!-- 	<img class="img" src="resources/picture/kapao.jpg" alt="Card image cap">  -->

	<center>
      <h1 class="text-center"><i class="fas fa-utensils"></i> <b>Food</b></h1>
      <a href="/formFood" type="button" class="btn btn-warning" ><i class="fas fa-plus-circle"></i> Create new Food</a>
   	</center>


  	<br>


    <div class="form-inline">
      <form class="form-inline">        
        <input id="input_search" class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-success my-2 my-sm-0" onclick="search();">
          <i class="fas fa-search"></i>
        </button>
      </form>
    </div>
    
	<br>
	
	<div class="row">
	 	<c:forEach items="${foods}" var="item">
			<div class="column">
				
		            <!-- 1st food. -->				            
		            <div class="card">
		              <!-- <img class="img" src="picture/kapao.jpg" alt="Card image cap">  
			              <img class="img" src="http://127.0.0.1:8887/${item.image_path}"> --> 
			              <img class="img" src="http://127.0.0.1:8887/${item.image_path}">
			
			              <div class="card-body">
			                  <h5 class="card-title"><i class="fas fa-bullhorn"></i> <b>${item.name}</b></h5>
			                  <p class="card-text"> &nbsp; &nbsp;
			                    ${item.description}
			                  </p>
			              </div>
			              
			              <div class="card-footer">
			              	  <a type="button" class="btn btn-info" href="/viewFood/${item.id}">
			              	  		<i class="fas fa-search-plus"></i> Read more...
		           	  		  </a>
			                  <!-- <button type="button" class="btn btn-info"><i class="fas fa-search-plus"></i> Read more...</button>  -->
			              </div>
		            </div>
			  	
		            <!-- End 1st food.  -->
           			<!--  <h1>Your name : ${item.name}</h1> 
					<H3>THE TOPIC : </H3>
					<H3>THE DETAIL : ${item.image_path}</H3> 
					<a href="file://'${item.image_path}">Link 1</a>
					<a href="/viewFood/${item.id}">view</a>
					<a href="delete/${item.id}">delete</a> -->
			
			</div>
		</c:forEach>
 	</div>
	
	
    <br>    



    <!-- Modal -->
    <div class="modal fade" id="modal_search" tabindex="-1" role="dialog" aria-labelledby="modal_search"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <b>Address</b>
            <p id="modal-addr"></p>
            <b>Phone Number</b>
            <p id="modal-phone"></p>
            <a id="modal-url" href="">Google Map</a>
          </div>
        </div>
      </div>
    </div>
	
	
	<script>
	function search(){
      console.log("search ja");
      $("#modal_search").modal('show');
      var input_search = $("#input_search").val();
      var url = "https://sad-assignment3.appspot.com/getPlace";
      $.get(url, {input: input_search})
      .done(function (res) {
        console.log(res);
        display(res);
      })
      .fail(function (res) {
        console.log(res);
        alert("error");
      });
    }

    function display(result){
      // address: "ศูนย์บริการลูกค้า ทีโอที สาขาฟิวเจอร์พาร์ค รังสิต 94 Phahonyothin Rd, Tambon Prachathipat, Amphoe Thanyaburi, Chang Wat Pathum Thani 12130, Thailand"
      // id: "ChIJ9Vd_1tiB4jARw5GN_6hzMwY"
      // name: "ฟิวเจอร์พาร์ครังสิต"
      // phoneNo: "092 740 8452"
      // url: "https://maps.google.com/?cid=446827957718979011"
      console.log(result.data.name);

      $(".modal-title")[0].innerHTML = result.data.name;
      $("#modal-addr")[0].innerHTML = result.data.address;
      $("#modal-phone")[0].innerHTML = result.data.phoneNo;
      $("#modal-url")[0].href = result.data.url;

    }
    </script>

</body>
</html>