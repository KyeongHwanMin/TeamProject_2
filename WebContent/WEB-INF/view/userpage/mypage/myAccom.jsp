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
	
	

	<!-- 내가 찜한 장소(숙소) 리스트  -->

	

	<!-- Offers -->

	<div class="offers">

		<!-- 설명 -->
		<h3 align="center"> </h3> <br/> 
		<p align="center"> </p> <br /> 
		<h2 align="center"> 내가 찜한 숙소 </h2> <br/> 
		
 
		<div class="container">
			<div class="row">
				<div class="col-lg-1 temp_col"></div>
				<div class="col-lg-11">
					
					
		<!-- Offers Sorting 카테고리 선택  -->
		
					<div class="offers_sorting_container">
						<ul class="offers_sorting">
							<li>
								<span class="sorting_text">이름순</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>default</span></li>
									<li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span>가나다순</span></li>
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


			<c:if test="${count == 0}"> 
				<div class="col-lg-12">
					<div class="offers_grid">
				 	
				 	<p align="center"> 선택한 찜하기가 없습니다.</p>
				
					 </div>
				 </div>
				
			</c:if>

			<div class="col-lg-12">
				
					<!-- Offers Grid : 숙소 리스트  -->

					<div class="offers_grid">
				
				

					<!-- Offers Item -->
				<c:if test="${count > 0}"> 
					<c:forEach var="homeDTO" items="${myAccomList}">
						
						<div class="offers_item ${homeDTO.home_type}"> <!-- ${guesthouse}  -->
						  
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@kensuarez -->
										<c:if test="${homeDTO.home_type == 'hotel'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_6.jpg)"></div>
									</c:if>	
									<c:if test="${homeDTO.home_type == 'motel'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_5.jpg)"></div>
									</c:if>		
									<c:if test="${homeDTO.home_type == 'guesthouse'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_8.jpg)"></div>
									</c:if>	
									<c:if test="${homeDTO.home_type == 'pention'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_7.jpg)"></div>
									</c:if>	
										
										<c:if test="${homeDTO.home_local == 'jejusi'}">	
										<div class="offer_name"><a href="#">제주시</a></div>
									</c:if>
									<c:if test="${homeDTO.home_local == 'seogwiposi'}">	
										<div class="offer_name"><a href="#">서귀포시</a></div>
									</c:if>
									<c:if test="${homeDTO.home_local == 'jungmun'}">	
										<div class="offer_name"><a href="#">중문</a></div>
									</c:if>
									<c:if test="${homeDTO.home_local == 'jejuairport'}">	
										<div class="offer_name"><a href="#">제주국제공항</a></div>
									</c:if>
									<c:if test="${homeDTO.home_local == 'aweol'}">	
										<div class="offer_name"><a href="#">애월/한림/협재</a></div>
									</c:if>	
									<c:if test="${homeDTO.home_local == 'pyoseon'}">	
										<div class="offer_name"><a href="#">표선/성산</a></div>
									</c:if>	
									<c:if test="${homeDTO.home_local == 'hamduk'}">	
										<div class="offer_name"><a href="#">함덕/김녕/세화</a></div>
									</c:if>	
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">${homeDTO.home_name} <span> ${homeDTO.home_local} </span></div>
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
										<div class="button book_buttonn"><a href="myAccomDeletePro.do?home_no=${homeDTO.home_no}"> 찜하기 취소 <span></span><span></span><span></span></a></div>
										
									</div>
								</div>
							</div>
						</div>
						
						<br /> <br />
					</c:forEach> 
			  </c:if>
						
						
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