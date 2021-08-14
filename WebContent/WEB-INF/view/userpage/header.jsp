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
								<li class="main_nav_item"><a href="attForm.do">관광지</a></li>
								<li class="main_nav_item"><a href="accom.do">숙박</a></li>
								<li class="main_nav_item"><a href="recommend.do">장소 추천</a></li>
								<li class="main_nav_item"><a href="list.do">contact</a></li>
								
						</c:if>	
								
							</ul> 
						</div>
						
			<!-- 검색  -->
			<c:if test="${user_id != null}">
							<div class="content_search ml-lg-0 ml-auto">
							<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
								<g>
									<g>
										<g>
											<path class="mag_glass" fill="#521414" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
											s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
											C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
											M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
											c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z"/>
										</g>
									</g>
									<g>
										<g>
											<path class="mag_glass" fill="#521414" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
											c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
											C-2.019,484.77-2.019,497.865,6.057,505.942z"/>
										</g>
									</g>
								</g>
							</svg>
						</div>
						
						<form id="search_form" class="search_form bez_1" action="searchItem.do" method="post">
							<select class="search_content_input bez_1" name="col">
								<option value="attraction">관광지</option>
								<option value="home">숙소</option>
							</select>
							
							<input type="search" class="search_content_input bez_1" type="text" name="search">
						</form>
					</c:if>	
		
			<!-- 검색  -->		
						
						
						
						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>
	</div>