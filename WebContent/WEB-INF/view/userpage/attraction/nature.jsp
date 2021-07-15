<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "jejuguseok_map.attractionDAO" %>
<%@ page import = "jejuguseok_map.attractionDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>자연 관광지</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
<link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
</head>

<body>

<div class="super_container">

<%@ include file ="../header.jsp" %>

	<!-- Milestones -->

	<div class="milestones">
		<div class="container">
			<div class="row">
				
				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="images/milestone_1.png" alt=""></div>
						<div class="milestone_counter" data-end-value="255">0</div>
						<div class="milestone_text">Clients</div>
					</div>
				</div>

				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="images/milestone_2.png" alt=""></div>
						<div class="milestone_counter" data-end-value="1176">0</div>
						<div class="milestone_text">Projects</div>
					</div>
				</div>

				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="images/milestone_3.png" alt=""></div>
						<div class="milestone_counter" data-end-value="39">0</div>
						<div class="milestone_text">Countries</div>
					</div>
				</div>

				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="images/milestone_4.png" alt=""></div>
						<div class="milestone_counter" data-end-value="127">0</div>
						<div class="milestone_text">Coffees</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Intro -->
	
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="intro_text text-center">
					</div>			
				</div>
			</div>
			<div class="row intro_items">

	<!-- Offers -->

	<div class="offers">
		<div class="container">
			<div class="row">
			
				<div class="col text-center">
				
					<h2 class="section_title">#역사문화</h2>
				</div>
				<div class="col text-center">
					<h2 class="section_title">#자연/경치</h2>
				</div>
				<div class="col text-center">
					<h2 class="section_title">#레저/체험/학습</h2>
				</div>
				
				<div class="col text-center">
					<h2 class="section_title">#휴식/힐링</h2>
				</div>
				
			</div>
			<div class="row offers_items">

				<!-- Offers Item -->
				<div class="col-lg-6 offers_col">
					<div class="offers_item">
						<div class="row">
							<div class="col-lg-6">
								<div class="offers_image_container">
									<!-- Image by https://unsplash.com/@kensuarez -->
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
									<div class="offers_link"><a href="offers.html">찜하기</a></div>
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
									<!-- Image by https://unsplash.com/@kensuarez -->
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
									<div class="offers_link"><a href="offers.html">찜하기</a></div>
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
									<!-- Image by https://unsplash.com/@kensuarez -->
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
									<div class="offers_link"><a href="offers.html">찜하기</a></div>
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
									<!-- Image by https://unsplash.com/@kensuarez -->
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
									<div class="offers_link"><a href="offers.html">찜하기</a></div>
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
