<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>관광지 검색</title> 
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
	
<script>
function myFunction() {
  document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
}
</script>
	

	<!-- 숙소 소개 페이지  --> 

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/jejuview.jpg"></div>
		<div class="home_content">
			<div class="home_title">  </div>
		</div>
	</div>
	
	<!-- Offers -->

	<div class="offers">

		<!-- 지역 선택  -->
<div class="button book_buttonn"><a href="attForm.do">전체</a></div> 
 <div class="button book_buttonn"><a href="attPro.do?search1=1">제주시</a></div>
 <div class="button book_buttonn"><a href="attPro.do?search1=2">서귀포시</a></div>
 <div class="button book_buttonn"><a href="attPro.do?search1=3">중문</a></div>
 <div class="button book_buttonn"><a href="attPro.do?search1=4">제주국제공항</a></div>
 <div class="button book_buttonn"><a href="attPro.do?search1=5">애월/한림/협재</a></div>
 <div class="button book_buttonn"><a href="attPro.do?search1=6">표선/성산</a></div>
 <div class="button book_buttonn"><a href="attPro.do?search1=7">함덕/김녕/세화</a></div>
 

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
									<li class="sort_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>기본</span></li>
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
							
						</ul><h6 align="right"> <a href="myAtt.do"> 내가 찜한 관광지</a> </h6>
					</div>
				</div>

				<div class="col-lg-12">
				

					<div class="offers_grid">

						<!-- 관광지 -->

					<c:forEach var="locationDTO" items="${list2}">
						<div class="offers_item ${locationDTO.category}"> 
						  
							<div class="row"> 
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
									<c:if test="${locationDTO.category == 'history'}">	
										<div class="offers_image_background" style="background-image:url(images/history.jpg)"></div>
									</c:if>	
									<c:if test="${locationDTO.category == 'leisure'}">	
										<div class="offers_image_background" style="background-image:url(images/leisure.jpg)"></div>
									</c:if>		
									<c:if test="${locationDTO.category == 'nature'}">	
										<div class="offers_image_background" style="background-image:url(images/nature.jpg)"></div>
									</c:if>	
									<c:if test="${locationDTO.category== 'healing'}">	
										<div class="offers_image_background" style="background-image:url(images/healing.png)"></div>
									</c:if>	
									<c:if test="${locationDTO.location == 'jejusi'}">	
										<div class="offer_name"><a href="#">제주시</a></div>
									</c:if>
									<c:if test="${locationDTO.location == 'seoquiposi'}">	 
										<div class="offer_name"><a href="#">서귀포시</a></div>
									</c:if>
									<c:if test="${locationDTO.location == 'jungmun'}">	
										<div class="offer_name"><a href="#">중문</a></div>
									</c:if> 
									<c:if test="${locationDTO.location == 'jejuairport'}">	
										<div class="offer_name"><a href="#">제주국제공항</a></div>
									</c:if>
									<c:if test="${locationDTO.location == 'aweol'}">	
										<div class="offer_name"><a href="#">애월/한림/협재</a></div>
									</c:if>	
									<c:if test="${locationDTO.location == 'pyoseon'}">	
										<div class="offer_name"><a href="#">표선/성산</a></div>
									</c:if>	
									<c:if test="${locationDTO.location == 'hamduk'}">	
										<div class="offer_name"><a href="#">함덕/김녕/세화</a></div>
									</c:if>	
									</div>
								</div>
										<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">${locationDTO.name} <span> 테마:${locationDTO.category} </span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
										</div>
										<p class="offers_text"> 소개: ${locationDTO.content} </p>
										<p class="offers_text"> 정보: ${locationDTO.address} </p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										
										<div class="button book_button"><a href="attbook.do?no=${locationDTO.no}" id="demo" onclick="myFunction()">찜하기<span></span><span></span><span></span></a></div>
										
									<!-- 관리자  -->
										<c:if test="${user_id == 'admin'}">      
											<button type="button" class="btn btn-outline-secondary"><a href="Update.do?no=${locationDTO.no}"> 수정 </a></button>
											<button type="button" class="btn btn-outline-secondary"><a href="homeDelete.do?no=${locationDTO.no}"> 삭제 </a></button> 
										</c:if>
									</div>
								</div>
							</div>
						</div>
						
						<br /> <br />
					</c:forEach> 
						
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