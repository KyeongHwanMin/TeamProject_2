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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
</head>

<body>

<div class="super_container">

<%@ include file ="../header.jsp" %>

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
								<li class="main_nav_item"><a href="startTrip.do">여행일정 만들기</a></li>
								<li class="main_nav_item"><a href="mypage.do">나의 여행</a></li>
								<li class="main_nav_item"><a href="/jejuguseok/history.do">관광지</a></li>
								<li class="main_nav_item"><a href="blog.html">숙박</a></li>
								<li class="main_nav_item"><a href="blog.html">장소 추천</a></li>
								<li class="main_nav_item"><a href="contact.html">contact</a></li>
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
	<!-- 관광지 테마 및 지역 선택 -->
	<form action="attractionSearchPro.do">
	<div class="container py-5">    
    <div class="row">
        <div class="col-lg-6">
            <div class="row">
              <div class="col-12">
                  <h4>관광지 테마</h4>
              </div>
            </div>
            <ul>
              <li>
                <input type="radio" id="histroy" value="histroy" name="place_category">
                <label for="place_histroy" >역사/문화</label>
                <div class="check"></div>
              </li>
              
              <li>
                <input type="radio" id="nature" value="nature" name="place_category">
                <label for="place_nature" >자연/경치</label>
                <div class="check"></div>
              </li>
              
              <li>
                <input type="radio" id="leisure" value="leisure" name="place_category">
                <label for="place_leisure" >레저/체험/학습</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="radio" id="healing" value="healing" name="place_category">
                <label for="place_healing" >휴식/힐링</label>
                <div class="check"></div>
              </li>
            </ul>
        </div>
         <div class="col-lg-6">
             <div class="row">
                  <div class="col-12">
                      <h4>관광지 지역</h4>
                  </div>
                </div>
            <ul>
                 <li>
                <input type="radio" id="jejusi" value="jejusi" name="place_local">
                <label for="jejusi">제주시</label>
                <div class="check"></div>
              </li>
                 <li>
                <input type="radio" id="seogwiposi" value="seogwiposi" name="place_local">
                <label for="seogwiposi">서귀포시</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="radio" id="jungmun" value="jungmun" name="place_local">
                <label for="jungmun">중문</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="radio" id="jejuairport" value="jejuairport" name="place_local">
                <label for="jejuairport">제주국제공항</label>
                <div class="check"></div>
              </li>
              
              <li>
                <input type="radio" id="aweol" value="aweol" name="place_local">
                <label for="aweol">애월/한림/협재</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="radio" id="pyoseon" value="pyoseon" name="place_local">
                <label for="pyoseon">표선/성산</label>
                <div class="check"></div>
              </li>     
              <li>
                <input type="radio" id="hamduk" value="hamduk" name="place_local">
                <label for="hamduk">함덕/김녕/세화</label>
                <div class="check"></div>
              </li>         
            </ul>
            <input type="submit" value ="search" name="검색" />
        </div>
    </div>
</div>
</form>

	<!-- Intro -->
	
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="intro_text text-center">
					</div>			
				</div>
			</div>
			<div class="row intro_items"></div>



<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>
