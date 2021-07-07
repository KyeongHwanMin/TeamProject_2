<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Jeju Guseok Guseok</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/responsive.css">
<!-- 추가 css --><link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
</head>

<!-- login폼 페이지 -->

<body>

<div class="super_container">
	
		<!-- Header -->

	<header class="header">

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="#"><img src="/jejuguseok/images/logo_jeju3.png" alt=""></a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="#">home</a></li>
								<li class="main_nav_item"><a href="about.html">여행일정 만들기</a></li>
								<li class="main_nav_item"><a href="offers.html">나의 여행</a></li>
								<li class="main_nav_item"><a href="blog.html">관광지</a></li>
								<li class="main_nav_item"><a href="blog.html">숙박</a></li>
								<li class="main_nav_item"><a href="blog.html">장소 추천</a></li>
								<li class="main_nav_item"><a href="contact.html">contact</a></li>
							</ul>
						</div>
						
						
						
						<form id="search_form" class="search_form bez_1">
							<input type="search" class="search_content_input bez_1">
						</form>

						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>

	<div class="menu trans_500">
		<div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
			<div class="menu_close_container"><div class="menu_close"></div></div>
			<div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
			<ul>
				<li class="menu_item"><a href="#">home</a></li>
				<li class="menu_item"><a href="about.html">about us</a></li>
				<li class="menu_item"><a href="offers.html">offers</a></li>
				<li class="menu_item"><a href="blog.html">news</a></li>
				<li class="menu_item"><a href="contact.html">contact</a></li>
			</ul>
		</div>
	</div>



<!-- login 폼  -->
<br /> <br /> <br /> <br /> <br /> 
<div id="loginForm" align="center">

<br /> <br />
<main>
  <form name="loginForm" action="loginPro.do" class="loginForm">
  <h1>로그인</h1>
    <hr>
    <br />
	<table>
	<tr>
		<td align='center'width='150'> <b>아이디 </b></td>
       	<td colspan='2'>
       		<input type="text" name="id" placeholder="아이디" required style="width:300px; height:50px; font-size:15px;">
       	</td>
	</tr>
	<tr>
		<td align='center' width='150' > <b>비밀번호</b> </td>
		<td colspan='2'> 
			<input type="password" name="pw" placeholder="비밀번호" required style="width:300px; height:50px; font-size:15px;">
		</td>
	</tr>
</table>
	 <br />  
	<input type="submit" value="Login" class="btn btn-danger" style="width:350px; height:60px; font-size:18pt; opacity: 0.9">
			 <br /> <br />
	<input align='center' type="button" value="회원가입" onclick="window.location='signUp.do'" class="btn btn-danger">
	<input type="button" value="아이디 찾기" onclick="window.location='findId.do'" class="btn btn-warning"> 
	<input type="button" value="비밀번호 찾기" onclick="window.location='findPw.do'" class="btn btn-warning">
 </form>
</main>


</div>


<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>

