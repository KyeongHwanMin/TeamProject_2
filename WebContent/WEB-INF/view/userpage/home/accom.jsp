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
	
<script>
function myFunction() {
  document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
}

var category='all';


function cate(num){
	category=num;
}


function pageNext(pageNum){
	window.location="/jejuguseok/accom.do?pageNum="+pageNum+"&category="+category;
}
</script>
	

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
 
 <div class="button book_buttonn"><a href="accomLocal.do?search=1">제주시</a></div>
 <div class="button book_buttonn"><a href="accomLocal.do?search=2">서귀포시</a></div>
 <div class="button book_buttonn"><a href="accomLocal.do?search=3">중문</a></div>
 <div class="button book_buttonn"><a href="accomLocal.do?search=4">제주국제공항</a></div>
 <div class="button book_buttonn"><a href="accomLocal.do?search=5">애월/한림/협재</a></div>
 <div class="button book_buttonn"><a href="accomLocal.do?search=6">표선/성산</a></div>
 <div class="button book_buttonn"><a href="accomLocal.do?search=7">함덕/김녕/세화</a></div>
 
  
  
 
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
									<li class="filter_btn" data-filter="*"  onclick="cate('all')"><span>숙소 전체</span></li>
									<li class="filter_btn" data-filter=".motel" onclick="cate('motel')"><span>민박/모텔</span></li>
									<li class="filter_btn" data-filter=".guesthouse" onclick="cate('guesthouse')"><span>게스트하우스</span></li>
									<li class="filter_btn" data-filter=".pention" onclick="cate('pension')"><span>펜션</span></li>
									<li class="filter_btn" data-filter=".hotel" onclick="cate('hotel')"><span>호텔</span></li>
								</ul>
							</li>
							
						</ul><h6 align="right"> <a href="myAccom.do"> 내가 찜한 숙소 보러가기</a> </h6>
					</div>
				</div>

				<div class="col-lg-12">
				
				
		<!-- Offers Grid : 숙소 리스트  -->

					<div class="offers_grid">

						<!-- Offers Item -->
			<c:if test="${count > 0}"> 
					<c:forEach var="locationDTO" items="${articleList}">
						
						<div class="offers_item ${locationDTO.category}"> <!-- ${guesthouse}  -->
						  
							<div class="row"> 
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@kensuarez -->
										
									<c:if test="${locationDTO.category == 'hotel'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_6.jpg)"></div>
									</c:if>	
									<c:if test="${locationDTO.category == 'motel'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_5.jpg)"></div>
									</c:if>		
									<c:if test="${locationDTO.category == 'guesthouse'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_8.jpg)"></div>
									</c:if>	
									<c:if test="${locationDTO.category == 'pention'}">	
										<div class="offers_image_background" style="background-image:url(images/offer_7.jpg)"></div>
									</c:if>	
									
									<c:if test="${locationDTO.location == 'jejusi'}">	
										<div class="offer_name"><a href="#">제주시</a></div>
									</c:if>
									<c:if test="${locationDTO.location == 'seoquiposi'}">	  <!-- seogwiposi  -->
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
										<div class="offers_price">${locationDTO.name} <span> ${locationDTO.location} </span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
											숙소 종류 : ${locationDTO.category}
										</div>
								 
										<p class="offers_text"> ${locationDTO.content} </p>
										<p class="offers_text"> ${locationDTO.address} </p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										
										<div class="button book_button"><a href="accomBookMK.do?no=${locationDTO.no}" id="demo" onclick="myFunction()">찜하기<span></span><span></span><span></span></a></div>
										
									<!-- 관리자  -->
										<c:if test="${user_id == 'admin'}">      
											<button type="button" class="btn btn-outline-secondary"><a href="homeUpdate.do?no=${locationDTO.no}"> 수정 </a></button>
											<button type="button" class="btn btn-outline-secondary"><a href="homeDelete.do?no=${locationDTO.no}"> 삭제 </a></button> 
										</c:if>
									<!-- 관리자  -->	
									
									</div>
								</div>
							</div>
						</div>
						
						<br /> <br />
					</c:forEach> 
			</c:if>
			
	</div>
				
				<%-- 
					<div>
					  <ul class="pagination">
					    <li class="page-item disabled">
					      <a class="page-link" href="#">&laquo;</a>
					    </li>
					    <li class="page-item active">
					      <a class="page-link" href="#">1</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">2</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">3</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#">&raquo;</a>
					    </li>
					  </ul>
					</div>
				--%>	
					
					
			<!--  페이징 처리    -->
					
					<br /> <br />
					
					<div align="center">  
				<c:if test="${count > 0}">
				   <c:set  var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
				   <c:set var="pageBlock" value="${10}"/>
				   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
				   <c:set var="startPage" value="${result * 10 + 1}" />
				   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
				   <c:if test="${endPage > pageCount}">
				        <c:set var="endPage" value="${pageCount}"/>
				   </c:if> 
				   
				 
				<ul class="pagination" >           
				   <c:if test="${startPage > 10}">
				      <li class="page-item">
				        <a class="page-link" href="accom.do?pageNum=${startPage - 10 }">&laquo;</a>
				        </li>
				   </c:if>
				
				
				   <c:forEach var="i" begin="${startPage}" end="${endPage}">
				      
				      <li class="page-item">
				       <a class="page-link" href="javascript:void(0);" onclick="pageNext(${i});"> ${i} </a>
				       </li>
				       
				   </c:forEach>
				
				   <c:if test="${endPage < pageCount}">
				   <li class="page-item">
				        <a class="page-link" href="accom.do?pageNum=${startPage + 10}">&raquo;</a>
				       </li>  
				   </c:if>
				</ul> 
				
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