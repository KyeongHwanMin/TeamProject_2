<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Jeju Guseok Guseok</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link
	href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/jejuguseok/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="/jejuguseok/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="/jejuguseok/styles/responsive.css">
</head>

<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header">

			<!-- Main Navigation -->

			<nav class="main_nav">
				<div class="container">
					<div class="row">
						<div
							class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<div class="logo">
									<a href="#"><img src="/jejuguseok/images/logo_jeju3.png"
										alt=""></a>
								</div>
							</div>
							<div class="main_nav_container ml-auto">
								<ul class="main_nav_list">
									<li class="main_nav_item"><a href="#">home</a></li>
									<li class="main_nav_item"><a href="about.html">여행일정
											만들기</a></li>
									<li class="main_nav_item"><a href="offers.html">나의 여행</a></li>
									<li class="main_nav_item"><a href="blog.html">관광지</a></li>
									<li class="main_nav_item"><a href="blog.html">숙박</a></li>
									<li class="main_nav_item"><a href="blog.html">장소 추천</a></li>
									<li class="main_nav_item"><a href="contact.html">contact</a></li>
								</ul>
							</div>



							<form id="search_form" class="search_form bez_1">
								<input type="search" class="search_content_input bez_1">
							</form>

							<div class="hamburger">
								<i class="fa fa-bars trans_200"></i>
							</div>
						</div>
					</div>
				</div>
			</nav>

		</header>

		<!-- Milestones -->

		<div class="milestones">
			<div class="container">
				<div class="row">

					<!-- Milestone -->
					<div class="col-lg-3 milestone_col">
						<div class="milestone text-center">
							<div class="milestone_icon">
								<img src="images/milestone_1.png" alt="">
							</div>
							<div class="milestone_counter" data-end-value="255">0</div>
							<div class="milestone_text">Clients</div>
						</div>
					</div>

					<!-- Milestone -->
					<div class="col-lg-3 milestone_col">
						<div class="milestone text-center">
							<div class="milestone_icon">
								<img src="images/milestone_2.png" alt="">
							</div>
							<div class="milestone_counter" data-end-value="1176">0</div>
							<div class="milestone_text">Projects</div>
						</div>
					</div>

					<!-- Milestone -->
					<div class="col-lg-3 milestone_col">
						<div class="milestone text-center">
							<div class="milestone_icon">
								<img src="images/milestone_3.png" alt="">
							</div>
							<div class="milestone_counter" data-end-value="39">0</div>
							<div class="milestone_text">Countries</div>
						</div>
					</div>

					<!-- Milestone -->
					<div class="col-lg-3 milestone_col">
						<div class="milestone text-center">
							<div class="milestone_icon">
								<img src="images/milestone_4.png" alt="">
							</div>
							<div class="milestone_counter" data-end-value="127">0</div>
							<div class="milestone_text">Coffees</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<form class="form-horizontal">
			<fieldset>

				<!-- Form Name -->
				<legend>Form Name</legend>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="select_local">숙박
						지역</label>
					<div class="col-md-4">
						<select id="select_local" name="select_local" class="form-control">
							<option value="jejusi">제주시</option>
							<option value="seogwiposi">서귀포시</option>
							<option value="jungmun">중문</option>
							<option value="jejuairport">제주국제공항</option>
							<option value="aweol">애월/한림/협재</option>
							<option value="pyoseon">표선/상산</option>
							<option value="hamduk">함덕/김녕/세화</option>
						</select>
					</div>
				</div>

				<!-- Select Multiple -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="select_home">숙소
						유형</label>
					<div class="col-md-4">
						<select id="select_home" name="select_home" class="form-control"
							multiple="multiple">
							<option value="motel">모텔</option>
							<option value="guest">게스트하우스</option>
							<option value="pention">펜션</option>
							<option value="hotel">호텔</option>
						</select>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="숙소검색"> </label>
					<div class="col-md-4">
						<button id="숙소검색" name="숙소검색" class="btn btn-success">검색</button>
					</div>
				</div>

			</fieldset>
		</form>



		<!-- Intro -->

		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="intro_text text-center"></div>
			</div>
		</div>
		<div class="row intro_items">

			<!-- Offers -->

			<div class="offers">
				<div class="container">
					<div class="row"></div>
					<div class="row offers_items">

						<!-- Offers Item -->
						<div class="col-lg-6 offers_col">
							<div class="offers_item">
								<div class="row">
									<div class="col-lg-6">
										<div class="offers_image_container">
											<!-- Image by https://unsplash.com/@kensuarez -->
											<div class="offers_image_background"
												style="background-image: url(images/offer_1.jpg)"></div>
											<div class="offer_name">
												<a href="#">성산일출봉</a>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="offers_content">
											<div class="offers_price">
												<h4>제주 서귀포시 성산읍 성산리 1</h4>
											</div>
											<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은
												모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에
												성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다.</p>
											<div class="offers_icons">
												<ul class="offers_icons_list">
													<li class="offers_icons_item"><img
														src="images/post.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/compass.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/bicycle.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/sailboat.png" alt=""></li>
												</ul>
											</div>
											<div class="offers_link">
												<a href="offers.html">찜하기</a>
											</div>
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
											<div class="offers_image_background"
												style="background-image: url(images/offer_1.jpg)"></div>
											<div class="offer_name">
												<a href="#">성산일출봉</a>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="offers_content">
											<div class="offers_price">
												<h4>제주 서귀포시 성산읍 성산리 1</h4>
											</div>
											<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은
												모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에
												성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다.</p>
											<div class="offers_icons">
												<ul class="offers_icons_list">
													<li class="offers_icons_item"><img
														src="images/post.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/compass.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/bicycle.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/sailboat.png" alt=""></li>
												</ul>
											</div>
											<div class="offers_link">
												<a href="offers.html">찜하기</a>
											</div>
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
											<div class="offers_image_background"
												style="background-image: url(images/offer_1.jpg)"></div>
											<div class="offer_name">
												<a href="#">성산일출봉</a>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="offers_content">
											<div class="offers_price">
												<h4>제주 서귀포시 성산읍 성산리 1</h4>
											</div>
											<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은
												모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에
												성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다.</p>
											<div class="offers_icons">
												<ul class="offers_icons_list">
													<li class="offers_icons_item"><img
														src="images/post.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/compass.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/bicycle.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/sailboat.png" alt=""></li>
												</ul>
											</div>
											<div class="offers_link">
												<a href="offers.html">찜하기</a>
											</div>
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
											<div class="offers_image_background"
												style="background-image: url(images/offer_1.jpg)"></div>
											<div class="offer_name">
												<a href="#">성산일출봉</a>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="offers_content">
											<div class="offers_price">
												<h4>제주 서귀포시 성산읍 성산리 1</h4>
											</div>
											<p class="offers_text">그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은
												모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에
												성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다.</p>
											<div class="offers_icons">
												<ul class="offers_icons_list">
													<li class="offers_icons_item"><img
														src="images/post.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/compass.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/bicycle.png" alt=""></li>
													<li class="offers_icons_item"><img
														src="images/sailboat.png" alt=""></li>
												</ul>
											</div>
											<div class="offers_link">
												<a href="offers.html">찜하기</a>
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

		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="styles/bootstrap4/popper.js"></script>
		<script src="styles/bootstrap4/bootstrap.min.js"></script>
		<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
		<script src="plugins/easing/easing.js"></script>
		<script src="js/custom.js"></script>
</body>

</html>