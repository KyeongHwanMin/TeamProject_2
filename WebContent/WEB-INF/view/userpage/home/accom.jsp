<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Offers</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/offers_responsive.css">
<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
</head>

<body>
<%@ include file ="../header.jsp" %>	<!-- Header -->
<div class="super_container">
	
	
	

	<!-- 숙소 소개 페이지  -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/제주숙소.jpg"></div>
		<div class="home_content">
			<div class="home_title">  </div>
		</div>
	</div>

	<!-- Offers -->

	<div class="offers">

		<!-- 설명 -->

		<h3 align="center"> 호텔부터 펜션까지 다양한 종류의 숙소  </h3> <br/>
		<p align="center"> 제주도 숙박시설에는 호텔 , 펜션  , 게스트 하우스 , 모텔까지 다양한 종류의 숙소가 있다. <br/>
		여행을 함께 하는 구성원 그리고 여행의 목적, 체류기간에 맞춰 숙소를 결정하면 된다. 가족, 연인을 위한 아늑하고 낭만적인 호텔이나 친구와 여행하기에 좀더 편한 펜션이 있고  <br/>
		 부모님을 모시고 가거나 아이와 함께 간다면 수영장이 있는 제주도 호텔을 선택하는 것이 좋다. </p>

		<!-- 지역 선택  -->
 
 <div class="button book_buttonn"><a href="accom.do">전체 지역</a></div> 
 
 <div class="button book_buttonn"><a href="accom.do?search=1">제주시</a></div>
 <div class="button book_buttonn"><a href="accom.do?search=2">서귀포시</a></div>
 <div class="button book_buttonn"><a href="#">중문</a></div>
 <div class="button book_buttonn"><a href="#">제주국제공항</a></div>
 <div class="button book_buttonn"><a href="#">애월/한림/협재</a></div>
 <div class="button book_buttonn"><a href="#">표선/상산</a></div>
 <div class="button book_buttonn"><a href="#">함덕/김녕/세화</a></div>
 
  
  
 
		<div class="container">
			<div class="row">
				<div class="col-lg-1 temp_col"></div>
				<div class="col-lg-11">
					
					<!-- Offers Sorting 카테고리 선택  -->
					<div class="offers_sorting_container">
						<ul class="offers_sorting">
							<li>
								<span class="sorting_text">location</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>default</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>alphabetical</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>alphabetical</span></li>
								</ul>
							</li>
							<li>
								<span class="sorting_text">숙소 종류</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="filter_btn" data-filter="*"><span>숙소 전체</span></li>
									<li class="filter_btn" data-filter=".motel"><span>모텔</span></li>
									<li class="filter_btn" data-filter=".guesthouse"><span>게스트하우스</span></li>
									<li class="filter_btn" data-filter=".pention"><span>펜션</span></li>
									<li class="filter_btn" data-filter=".hotel"><span>호텔</span></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>

				<div class="col-lg-12">
				
				
					<!-- Offers Grid : 숙소 리스트  -->

					<div class="offers_grid">

						<!-- Offers Item -->

					<c:forEach var="homeDTO" items="${list3}">
						
						<div class="offers_item guesthouse">
						  
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@kensuarez -->
										<div class="offers_image_background" style="background-image:url(${home_img})"></div>
										<div class="offer_name"><a href="single_listing.html">${homeDTO.home_name}</a></div>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">숙소 이름 <span> ${homeDTO.home_local} </span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
											숙소 종류 : ${homeDTO.home_type}
										</div>
								
										<p class="offers_text"> ${homeDTO.home_content} </p>
										<p class="offers_text"> ${homeDTO.home_address} </p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_button"><a href="#">찜하기<span></span><span></span><span></span></a></div>
										
									</div>
								</div>
							</div>
						</div>
					</c:forEach> 

						<!-- Offers Item -->

						<div class="offers_item hotel">
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@thoughtcatalog -->
										<div class="offers_image_background" style="background-image:url(images/offer_5.jpg)"></div>
										<div class="offer_name"><a href="single_listing.html">eurostar hotel</a></div>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">$50<span>per night</span></div>
										<div class="rating_r rating_r_3 offers_rating" data-rating="3">
											호텔
										</div>
										<p class="offers_text">숙소 주소 ~ 제주도 서귀포시 어쩌구 ...et.</p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_button"><a href="#">book<span></span><span></span><span></span></a></div>
										<div class="offer_reviews">
											<div class="offer_reviews_content">
												<div class="offer_reviews_title">very good</div>
												<div class="offer_reviews_subtitle">100 reviews</div>
											</div>
											<div class="offer_reviews_rating text-center">8.1</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Offers Item -->

						<div class="offers_item pention">
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@mindaugas -->
										<div class="offers_image_background" style="background-image:url(images/offer_6.jpg)"></div>
										<div class="offer_name"><a href="single_listing.html">grand castle</a></div>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">$110<span>per night</span></div>
										<div class="rating_r rating_r_5 offers_rating"  data-rating="5">
											카테고리 : 펜션 
										</div>
										<p class="offers_text">숙소 주소 ~ 제주도 서귀포시 어쩌구 ...t amet.</p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_button"><a href="#">book<span></span><span></span><span></span></a></div>
										<div class="offer_reviews">
											<div class="offer_reviews_content">
												<div class="offer_reviews_title">very good</div>
												<div class="offer_reviews_subtitle">100 reviews</div>
											</div>
											<div class="offer_reviews_rating text-center">8.1</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Offers Item -->

						<div class="offers_item guesthouse">
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@rktkn -->
										<div class="offers_image_background" style="background-image:url(images/offer_7.jpg)"></div>
										<div class="offer_name"><a href="single_listing.html">eurostar hotel</a></div>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">$50<span>per night</span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
											카테고리 : 게스트하우스
										</div>
										<p class="offers_text">숙소 주소 ~ 제주도 서귀포시 어쩌구 ...</p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_button"><a href="#">book<span></span><span></span><span></span></a></div>
										<div class="offer_reviews">
											<div class="offer_reviews_content">
												<div class="offer_reviews_title">very good</div>
												<div class="offer_reviews_subtitle">100 reviews</div>
											</div>
											<div class="offer_reviews_rating text-center">8.1</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Offers Item -->

						<div class="offers_item motel">
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@itsnwa -->
										<div class="offers_image_background" style="background-image:url(images/offer_8.jpg)"></div>
										<div class="offer_name"><a href="single_listing.html">grand castle</a></div>
									</div>
								</div>
								
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">$90<span>per night</span></div>
										<div class="rating_r rating_r_2 offers_rating" data-rating="2">
											카테고리 : 모텔
										</div>
										<p class="offers_text">숙소 주소 ~ 제주도 서귀포시 어쩌구 ...</p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_button"><a href="#">book<span></span><span></span><span></span></a></div>
										<div class="offer_reviews">
											<div class="offer_reviews_content">
												<div class="offer_reviews_title">very good</div>
												<div class="offer_reviews_subtitle">100 reviews</div>
											</div>
											<div class="offer_reviews_rating text-center">8.1</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>		
	</div>

	

</div>

<script src="/jejuguseok/js/jquery-3.2.1.min.js"></script>
<script src="/jejuguseok/styles/bootstrap4/popper.js"></script>
<script src="/jejuguseok/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/jejuguseok/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/jejuguseok/plugins/easing/easing.js"></script>
<script src="/jejuguseok/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/jejuguseok/js/offers_custom.js"></script>

</body>

</html>