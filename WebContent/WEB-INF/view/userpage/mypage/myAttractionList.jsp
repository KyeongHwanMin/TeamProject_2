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
	
	<!-- ﻿myattractionList : 마이페이지에서 찜한 관광지 노출 -->

	<div class="offers">

		<!-- 설명 -->
		<h3 align="center"> </h3> <br/> 
		<p align="center"> </p> <br /> 
		<h2 align="center"> 내가 찜한 관광지 </h2> <br/> 
		
 
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
								<span class="sorting_text">관광지 종류</span>
								<i class="fa fa-chevron-down"></i>
								<ul>
									<li class="filter_btn" data-filter="*"><span>모든 관광지</span></li>
									<li class="filter_btn" data-filter=".histroy" ><span >역사/문화</span></li>
									<li class="filter_btn" data-filter=".leisure" ><span>레저/체험/학습</span></li>
									<li class="filter_btn" data-filter=".nature" ><span>자연/경치</span></li>
									<li class="filter_btn" data-filter=".healing"><span>휴식/힐링</span></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>

<!-- ﻿count를 확인하여 찜한 관광지가 없을 땐 찜한 관광지가 없습니다 노출 --> 
			<c:if test="${count == 0}"> 
				<div class="col-lg-12">
					<div class="offers_grid">
				 	
				 	<p align="center"> 찜한 관광지가 없습니다.</p>
				
					 </div>
				 </div>
				
			</c:if>

			<div class="col-lg-12">
				
					<!-- Offers Grid : 관광지 리스트  -->

					<div class="offers_grid">
				
				

					<!-- 관광지 리스트: ﻿myattlist가 null이 아닐 때(관광지가 있을 때) 아래 정보 노출-->
					<!-- ﻿myattlist 불러오기(sql에서 location과 myattraciton DB에서 user_id와 no을 매칭시켜 불러오기) -->	
				<c:if test="${myAttList != null}"> 
					<c:forEach var="location" items="${myAttList}">
									
						<div class="offers_item ${location.category}"> 
						  
							<div class="row"> 
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
									<c:if test="${location.category == 'history'}">	
										<div class="offers_image_background" style="background-image:url(images/history.jpg)"></div>
									</c:if>	
									<c:if test="${location.category == 'leisure'}">	
										<div class="offers_image_background" style="background-image:url(images/leisure.jpg)"></div>
									</c:if>		
									<c:if test="${location.category == 'nature'}">	
										<div class="offers_image_background" style="background-image:url(images/nature.jpg)"></div>
									</c:if>	
									<c:if test="${location.category== 'healing'}">	
										<div class="offers_image_background" style="background-image:url(images/healing.png)"></div>
									</c:if>	
									<c:if test="${location.location == 'jejusi'}">	
										<div class="offer_name"><a href="#">제주시</a></div>
									</c:if>
									<c:if test="${location.location == 'seoquiposi'}">	 
										<div class="offer_name"><a href="#">서귀포시</a></div>
									</c:if>
									<c:if test="${location.location == 'jungmun'}">	
										<div class="offer_name"><a href="#">중문</a></div>
									</c:if> 
									<c:if test="${location.location == 'jejuairport'}">	
										<div class="offer_name"><a href="#">제주국제공항</a></div>
									</c:if>
									<c:if test="${location.location == 'aweol'}">	
										<div class="offer_name"><a href="#">애월/한림/협재</a></div>
									</c:if>	
									<c:if test="${location.location == 'pyoseon'}">	
										<div class="offer_name"><a href="#">표선/성산</a></div>
									</c:if>	
									<c:if test="${location.location == 'hamduk'}">	
										<div class="offer_name"><a href="#">함덕/김녕/세화</a></div>
									</c:if>	
										
								<!--﻿location DB에서 각 값들 불러오기 -->										
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">${location.name} <span> 테마: ${location.category} </span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
										</div>
										<p class="offers_text"> 소개: ${location.content} </p>
										<p class="offers_text"> 정보: ${location.address} </p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_buttonn"><a href="myAttDelete.do?place_no=${location.no}"> 찜하기 취소 <span></span><span></span><span></span></a></div>
										<!-- ﻿찜한 관광지를 location DB에서 no으로 취소시킴 -->										
										<c:if test="${user_id == 'admin'}">      
											<button type="button" class="btn btn-outline-secondary"><a href="attupdate.do?no=${location.no}"> 수정 </a></button>
											<button type="button" class="btn btn-outline-secondary"><a href="attdelete.do?no=${location.no}"> 삭제 </a></button> 										</c:if>
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