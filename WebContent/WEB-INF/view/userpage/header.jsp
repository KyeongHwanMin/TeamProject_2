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
<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
<style>
div.fheader {
        width: 100%;
         height:13%;
        display: flex;
        box-sizing: border-box;     
      }
</style>
</head>

<body>

	
	<!-- Header -->

<div class="fheader">
	<header class="header">
		
		
		
		<!-- Top Bar/ 관리자만 볼 수 있음  -->
<c:if test="${user_id == 'admin'}">
		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						
					
						<div class="user_box ml-auto">
							<div class="user_box_register user_box_link"><a href="adminpage/index.do">관리자 페이지로 이동</a></div>
							
						</div>
					</div>
				</div>
			</div>		
		</div>
	</c:if>
	
	
		<!-- Main Navigation -->
	
				
	<nav class="main_nav">		
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="index.do"><img src="/jejuguseok/images/logo_jeju3.png" alt=""></a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="index.do">home</a></li>
								
						<c:if test="${user_id != null}">		
								<li class="main_nav_item"><a href="map.do">여행일정 만들기</a></li>
								<li class="main_nav_item"><a href="mypage.do">나의 여행</a></li>
								<li class="main_nav_item"><a href="attractionSearchForm.do">관광지</a></li>
								<li class="main_nav_item"><a href="accom.do">숙박</a></li>
								<li class="main_nav_item"><a href="blog.html">장소 추천</a></li>
								<li class="main_nav_item"><a href="list.do">contact</a></li>
						</c:if>	
								
							</ul>
						</div>
						

						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>
	</div>