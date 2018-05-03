<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="assets/css/viewlikes.css" rel="stylesheet">
<link rel='icon' href='favicon.ico' type='image/x-icon'/>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
<title>View Likes</title>
</head>
<body>
<div class="">
	<div class="dateHeader text-center">
		<h1 style="margin-top: 0px; padding-top: 30px; font-weight: bold; display: inline;">View Your Referrals and Suggestions</h1>
		<h3 style="padding-bottom: 10px;">View Referrals and Suggestions</h3>
	</div>
	<div class="centerContent">
		<div class="btnManager text-center" style="width: 100%; margin:0 auto;">
			<div class="toggleHeader">		
				<h2 class="toggleTitle">Toggle between Referrals and Suggestions</h2>
			</div>
			<div class="btn-group btnStyle" style="width: 100%; margin: 0 auto;">
				<button class="viewLikesYou" type="button" style="width: 50%;" onClick="clickLikesYou();">View Referrals</button>
				<button class="viewYourLikes" type="button" style="width: 50%;" onClick="clickYourLikes();">View Suggestions</button>
			</div>
	
		</div>
		<div class="likesYouDiv">
		<c:forEach items="${refer}" var="ref">
		<div class="likesYouCard">
			<table>
				<tr>
					<td>You:</td>
					<td>${ref.yourProfile}</td>
					<td>Referred To:</td>
					<td>${ref.theirProfile}</td>
					
				</tr>
				<tr>
					<td>Referred By:</td> 
					<td>${ref.profileA}</td>
					<td>Referred At:</td>
					<td>${ref.dateTime}</td>
				</tr>
			</table>
    	</div>
		</c:forEach>
		</div>
		<div class="yourLikesDiv">
		<c:forEach items="${suggest}" var="sug">
		<div class="yourLikesCard">
			<table>
				<tr>
					<td>You:</td>
					<td>${sug.yourProfile}</td>
					<td>Suggested:</td>
					<td>${sug.theirProfile}</td>
					
				</tr>
				<tr>
					<td>Cust. Rep:</td> 
					<td>${sug.custRep}</td>
					<td>Suggested At:</td> 
					<td>${sug.dateTime}</td>
				</tr>
			</table>
    	</div>
		</c:forEach>
		</div>
		
	</div>
</div>
<script>
	$(document).ready(function() {
		$(".viewYourLikes").click();  
	}) ;

	function clickLikesYou(){
		//show past, fade in past, fade out pending
		$(".viewLikesYou").css("background-color", "#890000");
		$(".viewYourLikes").css("background-color", "#900");
		$(".yourLikesDiv").fadeOut(100);
		$(".likesYouDiv").fadeIn(100);
	}
	function clickYourLikes(){
		//show pending, fade in pending, fade out past
		$(".likesYouDiv").fadeOut(100);
		$(".yourLikesDiv").fadeIn(100);
		//set background color to dark red #890000
		$(".viewYourLikes").css("background-color", "#890000");
		//set background color of past to red #900
		$(".viewLikesYou").css("background-color", "#900");
	}
</script>

</body>
</html>