<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Main</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#img1").load("/spring/resources/html/1016/img1.html");
		$("#img2").load("/spring/resources/html/1016/img2.html");
		$("#img3").load("/spring/resources/html/1016/img3.html");
		$("#img4").load("/spring/resources/html/1016/img4.html");
		
		$(".row div").on("click", function(){
			window.open($(this).find("img").attr("src"));
		});
		
		$("form").on("submit", function( event ) {
			  event.preventDefault();
			  $.ajax({
						url:"Login", 
						data: $( this ).serialize()
				}).done(function(result){
					console.log(result);
					$("#loginPop").modal("hide");
					if(result.stat){
						alert(result.email + " 로그인이 성공하였습니다.");
					}else{
						alert("입력하신 [" + result.email + "] 정보가 잘못되었습니다.");
					}
				});
		});
	});
</script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Spring</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Main</a></li>
        <li><a href="#">Page 1</a></li>
        <li><a href="#">Page 2</a></li> 
        <li><a href="#">Page 3</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li data-toggle="modal" data-target="#signPop"><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li data-toggle="modal" data-target="#loginPop"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <h1>My First Bootstrap Page</h1>
  <p>This is some text.</p> 
  <div class="row">
  	<div class="col-sm-6" id="img1"></div>
  	<div class="col-sm-6" id="img2"></div>
  	<div class="col-sm-6" id="img3"></div>
  	<div class="col-sm-6" id="img4"></div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="loginPop" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">로그인</h4>
      </div>
      <div class="modal-body">
		<form>
		  <div class="form-group">
		    <label for="email">Email address:</label>
		    <input type="email" class="form-control" id="email" name="email">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" id="pwd" name="pwd">
		  </div>
		  <button type="submit" class="btn btn-success">login</button>
		</form>
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--       </div> -->
    </div>
    
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="signPop" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">회원 가입</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    
  </div>
</div>

</body>
</html>