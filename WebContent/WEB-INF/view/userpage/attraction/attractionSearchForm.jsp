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
	
		<h3 align="center"> 테마별로 즐기는 취향저격 제주 여행 </h3> <br/> 
		<p align="center"> 4개의 테마로 새로운 제주를 알아가는 즐거움 <br/>
		‘아는만큼 보인다’라는 말이 있다. 제주도는 흔히 가볍게 여행을 하는 곳이라고 생각하지만<br/> 
		각 지역마다의 역사와 그 지역의 숨은 이야기에는 관심이 소홀한 편이다. <br/>
		하지만 그 이야기들을 여행 전에 한번 알아보고 간다면 여행을 할 때 훨씬 보이는 것이 많아질 것이다. <br/>
		제주도의 생성에 관한 이야기, 민속과 의식주를 알아야 여행이 훨씬 풍요로워진다. 
		 </p>

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
                <input type="checkbox" id="place_category" value="histroy" name="place_category">
                <label for="place_histroy" >역사/문화</label>
                <div class="check"></div>
              </li>
              
              <li>
                <input type="checkbox" id="place_category" value="nature" name="place_category">
                <label for="place_nature" >자연/경치</label>
                <div class="check"></div>
              </li>
              
              <li>
                <input type="checkbox" id="place_category" value="leisure" name="place_category">
                <label for="place_leisure" >레저/체험/학습</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="checkbox" id="place_category" value="healing" name="place_category">
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
                <input type="checkbox" id="place_local" value="jejusi" name="place_local">
                <label for="jejusi">제주시</label>
                <div class="check"></div>
              </li>
                 <li>
                <input type="checkbox" id="place_local" value="seogwiposi" name="place_local">
                <label for="seogwiposi">서귀포시</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="checkbox" id="place_local" value="jungmun" name="place_local">
                <label for="jungmun">중문</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="checkbox" id="place_local" value="jejuairport" name="place_local">
                <label for="jejuairport">제주국제공항</label>
                <div class="check"></div>
              </li>
              
              <li>
                <input type="checkbox" id="place_local" value="aweol" name="place_local">
                <label for="aweol">애월/한림/협재</label>
                <div class="check"></div>
              </li>
              <li>
                <input type="checkbox" id="place_local" value="pyoseon" name="place_local">
                <label for="pyoseon">표선/성산</label>
                <div class="check"></div>
              </li>     
              <li>
                <input type="checkbox" id="place_local" value="hamduk" name="place_local">
                <label for="hamduk">함덕/김녕/세화</label>
                <div class="check"></div>
              </li>         
            </ul>
            <input type="submit" value ="검색" name="검색" />
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

	<!-- Offers -->
  	
	<div class="offers">
		<div class="container">

			<div class="row offers_items">

				<!-- Offers Item -->
				<c:forEach var="attractionDTO" items="${sea2list}">
				<div class="col-lg-6 offers_col">
					<div class="offers_item" ${attractionDTO.place_local}>
						<div class="row">
							<div class="col-lg-6">
								<div class="offers_image_container">
									<div class="offers_image_background" style="background-image:url((save/${place_img})"></div>
									<div class="offer_name"${attractionDTO.place_name}><a href="#"></a></div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="offers_content" ${attractionDTO.place_category}>
									<div class="offers_price"> ${attractionDTO.place_address}</div>
									<p class="offers_text" ${attractionDTO.place_content}></p>
									<div class="offers_icons">
										<ul class="offers_icons_list">
											<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
										</ul>
									</div>
									<div class="offers_link"><a href="">찜하기</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach> 
				
				
				<!-- Offers Item -->
				<div class="col-lg-6 offers_col">
					<div class="offers_item">
						<div class="row">
							<div class="col-lg-6">
								<div class="offers_image_container">
									<div class="offers_image_background" style="background-image:url(images/offer_1.jpg)"></div>
									<div class="offer_name"><a href="#">성산일출봉</a></div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="offers_content">
									<div class="offers_price"><h4>제주 서귀포시 성산읍 성산리 1</h4></div>
									<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은 모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에 성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다. </p>
									<div class="offers_icons">
										<ul class="offers_icons_list">
											<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
										</ul>
									</div>
									<div class="offers_link"><a href="">찜하기</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Offers Item -->
				<div class="col-lg-6 offers_col">
					<div class="offers_item">
						<div class="row">
							<div class="col-lg-6">
								<div class="offers_image_container">
									<div class="offers_image_background" style="background-image:url(images/offer_1.jpg)"></div>
									<div class="offer_name"><a href="#">성산일출봉</a></div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="offers_content">
									<div class="offers_price"><h4>제주 서귀포시 성산읍 성산리 1</h4></div>
									<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은 모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에 성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다. </p>
									<div class="offers_icons">
										<ul class="offers_icons_list">
											<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
										</ul>
									</div>
									<div class="offers_link"><a href="">찜하기</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Offers Item -->
				<div class="col-lg-6 offers_col">
					<div class="offers_item">
						<div class="row">
							<div class="col-lg-6">
								<div class="offers_image_container">
									<div class="offers_image_background" style="background-image:url(images/offer_1.jpg)"></div>
									<div class="offer_name"><a href="#">성산일출봉</a></div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="offers_content">
									<div class="offers_price"><h4>제주 서귀포시 성산읍 성산리 1</h4></div>
									<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은 모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에 성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다. </p>
									<div class="offers_icons">
										<ul class="offers_icons_list">
											<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
											<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
										</ul>
									</div>
									<div class="offers_link"><a href="">찜하기</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>



<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>
